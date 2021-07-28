package com.BodProject.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dao.BoardDao;
import com.BodProject.dao.GroupDao;
import com.BodProject.dto.BoardLikeDto;
import com.BodProject.dto.GroupPageDto;
import com.BodProject.dto.MemberDto;
import com.BodProject.dto.PhotoDto;
import com.BodProject.dto.TimeLineDto;

@Service
public class GroupService {

	@Autowired
	private GroupDao gdao;
	
	@Autowired
	private BoardDao bdao;

	String savePath = "C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg\\groupProfile";
	int size = 1024 * 1024 * 10; // 파일 처리 크기 10MB

	@Autowired
	private HttpSession session;
	
	private PhotoDto pdto;
	
	
	public String checkGroupName(String gname) {
		System.out.println("넘어온 아이디:"+gname);
		String gnameCheck = gdao.checkGroupName(gname);
		System.out.println("svc:"+gnameCheck);
		return gnameCheck;
	}

	//그룹 생성
	public ModelAndView groupCreate(GroupPageDto newGroup) throws IllegalStateException, IOException {
			ModelAndView mav = new ModelAndView();
			
			//그룹 코드 생성
			String maxGCode = gdao.maxGroupCode();
			String gCode = "G";
			if (maxGCode == null) {
				gCode += "00" + 1;
			} else {
				maxGCode = maxGCode.substring(1);
				int num = Integer.parseInt(maxGCode) + 1;
				if (num < 10) {
					gCode += "00" + num;
				} else if (num < 100) {
					gCode += "0" + num;
				} else if (num < 1000) {
					gCode += num;
				}
			}
			newGroup.setGcode(gCode);
			
			MultipartFile gprofile = newGroup.getGprofileUpload();
	
			if( gprofile.getSize() < 1 ){
				newGroup.setGprofile("groupProfile.jpg");
				int gCreateResult2 = gdao.groupCreate(newGroup);
			}else {
				UUID uuid = UUID.randomUUID();
				
				String gfileName = uuid.toString()+""+gprofile.getOriginalFilename();
				
				String savePath = "C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg\\groupProfile";
				
				if(!gprofile.isEmpty()) {
					gprofile.transferTo(new File(savePath,gfileName));
				}
				newGroup.setGprofile(gfileName);
				
				int gCreateResult = gdao.groupCreate(newGroup);
				
				if(gCreateResult < 1) {
					File file = new File(savePath, gfileName);
					file.delete();
				}
			}
			
			//그룹 회원에 관리자 아이디 추가
			String gmanager = newGroup.getGmanager();
			String gcode = newGroup.getGcode();
			int groupManager = gdao.addgManager(gmanager,gcode);
			
			mav.setViewName("redirect:/moveGroupPage?gcode="+gcode+"&loginId="+gmanager); 
			
			return mav;
		}

	public ModelAndView groupList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(null, mav);
		
		return mav;
	}

	public ModelAndView getGroupList() {
		ModelAndView mav = new ModelAndView();
		
		//그룹명의 갯수
		ArrayList<GroupPageDto> groupList = gdao.getGroupList();
		
		
		mav.addObject("groupPage", groupList);
	
		mav.setViewName("/group/GroupSearch");
		
		return mav;
	}

	public ArrayList<GroupPageDto> getSearchGroupList(String searchWord) {
		String search  = "%"+searchWord+"%";
		
		ArrayList<GroupPageDto> groupList = gdao.getSearchGroupList(search); 
		return groupList;
	}

	//그룹가입
	public ModelAndView joinGroup(String gcode, String guser) {
		ModelAndView mav = new ModelAndView();
		int joinGroup = gdao.joinGroup(gcode,guser);
		
		mav.setViewName("redirect:/moveGroupPage?gcode="+gcode+"&loginId="+guser); 
		return mav;
	}
	
	//그룹 탈퇴
	public ModelAndView signOutGroup(String gcode, String userId) {
	      ModelAndView mav = new ModelAndView();
	      //회원목록 삭제
	      String signOutGroup = gdao.signOutGroup(gcode, userId);

	      // 게시글 삭제 -- 타임라인 후에 처리
	      ArrayList<PhotoDto> photoList = gdao.signOutphotoInfo(gcode,userId);
	      System.out.println(gcode + " 그룹 게시글의 사진 갯수 : " + photoList.size());
	      if (photoList.size() != 0) {
	         for (int j = 0; j < photoList.size(); j++) {
	            int deletePhotoResult = gdao.deletePhoto(photoList.get(j).getPhoto());
	            File file = new File(savePath, photoList.get(j).getPhoto());
	            file.delete();
	         }
	      }
	      String bcode[] = gdao.singOutUserBoard(gcode,userId);
	      System.out.println(gcode + " 그룹의 게시글 갯수 : " + bcode.length);
	      for (int i = 0; i < bcode.length; i++) {
	         System.out.println(bcode[i]);
	         // LIKE(BOARD, COMM, REPLY) delete by bcode
	         int deleteReplyLikeInBoard = gdao.deleteReplyLikeBybcode(bcode[i]);
	         int deleteCommLikeInBoard = gdao.deleteCommLikeBybcode(bcode[i]);
	         int deleteBoardLikeInBoard = gdao.deleteBoardLikeBybcode(bcode[i]);
	         // Reply delete by bcode
	         int deleteReplyByBcode = gdao.deleteReplyBybcode(bcode[i]);
	         // COMM delete by bcode
	         int deleteCommInBoard = gdao.deleteCommBybcode(bcode[i]);
	         //해시태그
	         int deleteTagByBcode = gdao.signOitGroupBoardTag(bcode[i]);
	         int deleteBoardByBcode = gdao.deleteBoardByBcode(bcode[i]);
	      }

	      mav.setViewName("redirect:/moveGroupSearch");
	      return mav;
	   }

	public ModelAndView getGroupPage(String gcode, String loginId) {
		
		
		ModelAndView mav = new ModelAndView();
		GroupPageDto gPage = gdao.getGroupPage(gcode);
		
		//내가 가입되어있는지 확인
		String checkUser = gdao.checkGroupUser(gcode,loginId);
		
		ArrayList<TimeLineDto> boardList = bdao.getGroupBoardList(gcode);
		
		System.out.println("boardList : " + boardList);
		for(int i = 0; i<boardList.size(); i++) {
				String bcode = boardList.get(i).getBcode();
				String[] photoList = bdao.getPhotoList(bcode);
				boardList.get(i).setPhoto(photoList);
				ArrayList<String> tag = bdao.boardTagList(bcode);
		        boardList.get(i).setTaglist(tag);   
				
				if(boardList.get(i).getMprofile().contains("http")) {
					
				}else {
					String mprofile = "/controller/resources/uploadImg/userimg/"+boardList.get(i).getMprofile();
					boardList.get(i).setMprofile(mprofile);
					
				}
				
				boardList.get(i).setCommcount(bdao.getCommcount(bcode));
				boardList.get(i).setLikecount(bdao.getBoardLikeCount(bcode));
				BoardLikeDto bldto = new BoardLikeDto();
				bldto.setLicode(bcode);
				bldto.setLimid(loginId);
				BoardLikeDto likemodify = bdao.boardlike(bldto);
				
				if(likemodify == null) {
					boardList.get(i).setLikemodify("far fa-heart");
				}else {
					boardList.get(i).setLikemodify("fas fa-heart");
				}
				if(boardList.get(i).getBgcode() != null) {
					String bgname = bdao.getBgname(gcode);
					String bgprofile = bdao.getBgprofile(gcode);
					boardList.get(i).setBgname(bgname);
					boardList.get(i).setGprofile(bgprofile);
				}
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date toDay = new Date();
		for(int j = 0; j < boardList.size(); j++) {
			String bdate = boardList.get(j).getBdate();
			Date boardDate = null;
			try {
				boardDate = format.parse(bdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int secondBdate = (int) ((toDay.getTime() - boardDate.getTime())/1000);
			String transBdate = null;
			if(secondBdate < 60) {
				transBdate = secondBdate +"초전";
			}else if(secondBdate < 3600) {
				transBdate = secondBdate/60 +"분전";
			}else if(secondBdate < 86400) {
				transBdate = secondBdate/3600 +"시간전";
			}else{
				transBdate = secondBdate/86400 +"일전";
			}
			boardList.get(j).setBdate(transBdate);
		}
		System.out.println(boardList);
	
		mav.addObject("groupUser", checkUser);
		mav.addObject("group", gPage);
		mav.addObject("boardList", boardList);
		mav.setViewName("/group/GroupPage");
		
		return mav;
	}

	//친구 목록 출력
	public ArrayList<MemberDto> getGroupMemList(String gcode, String loginId) {
		ArrayList<MemberDto> gMemList = gdao.getGroupMemList(gcode);
		
		//이미지 경로 지정
		for(int i = 0; i < gMemList.size(); i++) {
			if(gMemList.get(i).getMprofile().contains("http")) {
			}else {
				String mprofile = "/controller/resources/uploadImg/userimg/"+gMemList.get(i).getMprofile();
				gMemList.get(i).setMprofile(mprofile);
			}
			
			//친구인지 확인 
			String friendId = gMemList.get(i).getMid();
			System.out.println("내아이디: "+loginId+ "확인할 친구 아이디 : "+friendId);
			String fcheckResult = gdao.friendCheck(loginId,friendId);
			if(fcheckResult != null) {
				gMemList.get(i).setFriendcheck(1);
			}else {
				gMemList.get(i).setFriendcheck(0);
			}
		}
		
		System.out.println(gMemList);
		return gMemList;
	}

	//내가 가입한 그룹 목록
	public ModelAndView getMyGroupList(String loginId) {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<GroupPageDto> mygroup = gdao.getMyGroupList(loginId);
		mav.addObject("mygroup", mygroup);
		
		mav.setViewName("/group/MyGroupList");
		return mav;
	}

	//그룹 삭제
		public ModelAndView deleteGroup(String gcode) {
			ModelAndView mav = new ModelAndView();
			
			//회원 탈퇴
			int deleteGuser = gdao.deleteGuer(gcode);
			
			//게시글 삭제  -- 타임라인 후에 처리
			ArrayList<PhotoDto> photoList = gdao.photoInfoByGcode(gcode);
			System.out.println(gcode + " 그룹 게시글의 사진 갯수 : " + photoList.size());
			if (photoList.size() != 0) {
				for (int j = 0; j < photoList.size(); j++) {
					int deletePhotoResult = gdao.deletePhoto(photoList.get(j).getPhoto());
					File file = new File(savePath, photoList.get(j).getPhoto());
					file.delete();
				}
			}
			String bcode[] = gdao.selectBcodeByGcode(gcode);
			System.out.println(gcode + " 그룹의 게시글 갯수 : " + bcode.length);
			for (int i = 0; i < bcode.length; i++) {
				// LIKE(BOARD, COMM, REPLY) delete by bcode
				int deleteReplyLikeInBoard = gdao.deleteReplyLikeBybcode(bcode[i]);			
				int deleteCommLikeInBoard = gdao.deleteCommLikeBybcode(bcode[i]);
				int deleteBoardLikeInBoard = gdao.deleteBoardLikeBybcode(bcode[i]);
				// Reply delete by bcode
				int deleteReplyByBcode = gdao.deleteReplyBybcode(bcode[i]);
				// COMM delete by bcode
				int deleteCommInBoard = gdao.deleteCommBybcode(bcode[i]);
				int deleteBoardByBcode = gdao.deleteBoardByBcode(bcode[i]);
			}
			//해시태그 삭제
			int deleteTag = gdao.deleteGroupBoardTag(gcode);
			int deleteGuserByGcode = gdao.deleteGuserByGcode(gcode);
			
			//그룹 삭제
			int deleteGroup = gdao.deleteGroup(gcode);
			
			mav.setViewName("redirect:/moveGroupSearch");
			return mav;
		}

	public int giveGroupManager(String gcode, String userId) {
		int giveResult = gdao.giveGroupManager(gcode,userId);
		return giveResult;
	}

	public int signOutUser(String gcode, String userId) {
		int signOutResult = gdao.signOutUser(gcode,userId);
		return signOutResult;
	}

	
	public ModelAndView getGroupProfile(String gcode) {
		ModelAndView mav = new ModelAndView();
		
		GroupPageDto ginfo = gdao.getGroupInfo(gcode);
		mav.addObject("gInfo", ginfo);
		mav.setViewName("group/GroupProfileModifyForm");
		return mav;
	}

	public ModelAndView modifyGroup(GroupPageDto modifyGroup) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		
		String savePath = "C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg\\groupProfile";
		
		MultipartFile modiProfile = modifyGroup.getGprofileUpload();
		
		//새로지정한 파일이 있을때
		if(modiProfile.getSize() > 0) {
			//기존 저장된 파일 삭제 
			File file = new File(savePath, modifyGroup.getGprofile());
			file.delete();
			
			//새로 파일 이름 생성
			UUID uuid = UUID.randomUUID();
			
			String gfilename = uuid.toString() + "_" + modiProfile.getOriginalFilename();

			if(!modiProfile.isEmpty()) {
				modiProfile.transferTo(new File(savePath, gfilename));
			}
			modifyGroup.setGprofile(gfilename);
			
			//업데이트 실행
			int modifyResult = gdao.modifyGroup(modifyGroup);
			
			if(modifyResult < 0) {
				File file2 = new File(savePath, modifyGroup.getGprofile());
				file2.delete();
			}
		}else {
			//새로 지정한 파일이 없을때
			int modifyResult2 = gdao.modifyGroup(modifyGroup);
		}
		//그룹 페이지로 이동
		String gcode = modifyGroup.getGcode();
		String guser = modifyGroup.getGmanager();
		mav.setViewName("redirect:/moveGroupPage?gcode="+gcode+"&loginId="+guser);
		return mav;
	}

	
}
