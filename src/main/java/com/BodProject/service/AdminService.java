package com.BodProject.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dao.AdminDao;
import com.BodProject.dto.CommDto;
import com.BodProject.dto.GroupPageDto;
import com.BodProject.dto.MemberDto;
import com.BodProject.dto.PhotoDto;
import com.BodProject.dto.ReportDto;
import com.BodProject.dto.TimeLineDto;

@Service
public class AdminService {

	@Autowired
	AdminDao adao;
	
	@Autowired
	private HttpSession session;
	
	String savePath = "C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg";
	
	public ModelAndView moveAdminHome() {
		ModelAndView mav = new ModelAndView();
		// TODO Auto-generated method stub
		ArrayList<MemberDto> member = adao.getMemberList();
		System.out.println(member);
		mav.addObject("member", member);
		mav.setViewName("admin/AdminHome");
		return mav;
	}

	public ModelAndView deleteMember(String mid, String loginId) {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();
		//select bcode by mid(mid가 작성한 board의 bcode 조회)
		String bcode[] = adao.getBoardBcode(mid);
		System.out.println(mid + "가 작성한 board 개수 : " + bcode.length);		
		//board에 해당하는 photoFile, comment, reply, boardLike 삭제
		for(int i =0; i < bcode.length; i++) {
			System.out.println("bocde / " + bcode[i]);
			//select PHOTO by bcode
			ArrayList<PhotoDto> pdtoList = adao.BoardPhotoInfo(bcode[i]);			
			//delete File and delete PHOTO
			System.out.println("pdtoList.size() :  " + pdtoList.size());
			if(pdtoList.size() != 0) {
				for(int j = 0; j<pdtoList.size(); j++) {
					int deletePhotoResult = adao.deletePhoto(pdtoList.get(j).getPhoto());
					File file = new File(savePath, pdtoList.get(j).getPhoto());
					file.delete();
				}
			}
			//LIKE(BOARD, COMM, REPLY) delete by bcode
			int deleteReplyLike = adao.deleteReplyLikeBybcode(bcode[i]);
			int deleteCommLike = adao.deleteCommLikeBybcode(bcode[i]);
			int deleteBoardLike = adao.deleteBoardLikeBybcode(bcode[i]);
			//해시태그 삭제
            int deleteTag = adao.deleteBoardTag(bcode[i]);
			//REPLY delete by bcode
			System.out.println("deleteReply service");
			System.out.println(bcode[i]);
			int deleteReply = adao.deleteReplyBybcode(bcode[i]);
			System.out.println("deleteReply by bcode : " + deleteReply);
			//COMM delete by bcode
			int deleteComm = adao.deleteCommBybcode(bcode[i]);			
			System.out.println("deleteComm by bcode : " + deleteComm);
			System.out.println("deleteReplyLike / deleteCommLike / deleteBoardLike : " + deleteReplyLike + " : " + deleteCommLike + " : " + deleteBoardLike);
		}
		//delete FRIEND
		int deleteFriend1 = adao.deleteFreindInMyMid(mid);
		int deleteFriend2 = adao.deleteFreindInFrMid(mid);
		System.out.println("deleteFriend1 / deleteFriend2 : " + deleteFriend1 + " : " + deleteFriend2);
		//chatting delete
		
		//delete REPORT 
		int deleteReport1 = adao.deleteReportInReporter(mid);
		int deleteReport2 = adao.deleteReportInTarget(mid);
		System.out.println("deleteReport1 / deleteReport2 : " + deleteReport1 + " : " + deleteReport2);
		//delete QnA 
		int deleteQnA = adao.deleteQnA(mid);
		System.out.println("deleteQnA : " + deleteQnA);
		//delete GUSER
		int deleteGuser = adao.deleteGuser(mid);
		System.out.println("deleteGuser : " + deleteGuser);
		//delete BOARDLIKE by mid
		int deleteLikeBymid = adao.deleteLikeBymid(mid);
		System.out.println("deleteLikeBymid : " + deleteLikeBymid);
		//delete REPLY by mid
		int deleteReply = adao.deleteReplyByMid(mid);
		System.out.println("deleteReply : " + deleteReply);
		//delete REPLY by (select COMM by mid)
		int deleteReplyInMidsComm = adao.deleteReplyInMidsComm(mid);
		System.out.println("deleteReplyInMidsComm : " + deleteReplyInMidsComm);
		//delete BoardLike by (select reply ( select comm by mid)
		int deleteBoardLikeByComm = adao.deleteBoardLikeByComm(mid);
		System.out.println("deleteBoardLikeByComm : " + deleteBoardLikeByComm);
		//delete COMM by mid 
		int deleteCommByMid = adao.deleteCommByMid(mid);
		System.out.println("deleteCommByMid : " + deleteCommByMid);
		int deleteCommLike = adao.deleteCommLike(mid);
		
		//delete BOARD		
		int deleteBoard = adao.deleteBoard(mid);
		System.out.println("deleteBoard : " + deleteBoard);		
		int deleteBoardLike = adao.deleteBoardLike(mid);
		//delete GBOARD  
		//select bcode by mid
		String gbcode[] = adao.getGBoardBcode(mid);
		System.out.println(mid + "가 작성한 Gboard 개수 : " + gbcode.length);
		//Gboard에 해당하는 photoFile, comment, reply, boardLike 삭제
		for(int i =0; i < gbcode.length; i++) {
			//select PHOTO by bcode
			System.out.println("gbcode : " + gbcode[i]);
			ArrayList<PhotoDto> pdtoList = adao.gBoardPhotoInfo(gbcode[i]);
			System.out.println(gbcode[i] + " 게시글의 사진 갯수 : " + pdtoList.size());
			//delete File and delete PHOTO
			if(pdtoList.size() != 0) {
				for(int j = 0; j<pdtoList.size(); j++) {
					int deletePhotoResult = adao.deletePhoto(pdtoList.get(j).getPhoto());
					File file = new File(savePath, pdtoList.get(j).getPhoto());
					file.delete();
				}				
			}
			//REPLY delete by gbcode
			int deleteReplyInGboard = adao.deleteReplyBybcode(gbcode[i]);
			System.out.println("deleteReplyInGboard : " + deleteReplyInGboard);
			//COMM delete by gbcode
			int deleteCommInGboard = adao.deleteCommBybcode(gbcode[i]);
			System.out.println("deleteCommInGboard : " + deleteCommInGboard);
			//LIKE(BOARD, COMM, REPLY) delete by gbcode
			int deleteReplyLikeInGboard = adao.deleteReplyLikeBybcode(gbcode[i]);
			System.out.println("deleteReplyLikeInGboard : " + deleteReplyLikeInGboard);
			int deleteCommLikeInGboard = adao.deleteCommLikeBybcode(gbcode[i]);
			System.out.println("deleteCommLikeInGboard : " + deleteCommLikeInGboard);
			//해시태그 삭제
            int deleteTag = adao.deleteBoardTag(gbcode[i]);
			int deleteBoardLikeInGboard = adao.deleteBoardLikeBybcode(gbcode[i]);
			System.out.println("deleteBoardLikeInGboard : " + deleteBoardLikeInGboard);
			int deleteBoardByGbCode = adao.deleteBoardByGBCode(gbcode[i]);
		}
		
		//mid가 관리자인 Group // 그 Group의 게시글(REPLYLIKE, COMMLIKE, BOARDLIKE, PHOTO, FILE, BOARD)과 GUSER
		String gcode[] = adao.selectGroupPage(mid);
		System.out.println("gcode[] : " + gcode);
		for(int i = 0; i < gcode.length; i++) {
			ArrayList<PhotoDto> photoList = adao.photoInfoByGcode(gcode[i]);
			System.out.println(gcode[i] + " 그룹 게시글의 사진 갯수 : " + photoList.size());
			if(photoList.size() != 0) {
				for(int j = 0; j < photoList.size(); j++) {
					int deletePhotoResult = adao.deletePhoto(photoList.get(j).getPhoto());
					File file = new File(savePath, photoList.get(j).getPhoto());
					file.delete();
				}
			}
			String bcode2[] = adao.selectBcodeByGcode(gcode[i]);
			System.out.println(gcode[i] + " 그룹의 게시글 갯수 : " + bcode2.length);
			for(int j = 0; j < bcode2.length; j++) {
				//Reply delete by bcode2
				int deleteReplyByBcode = adao.deleteReplyBybcode(bcode2[i]);
				System.out.println("deleteReplyByBcode : " + deleteReplyByBcode );
				//COMM delete by bcode2
				int deleteCommInBoard = adao.deleteCommBybcode(bcode2[i]);
				System.out.println("deleteCommInBoard : " + deleteCommInBoard);
				//LIKE(BOARD, COMM, REPLY) delete by bcode
				int deleteReplyLikeInBoard = adao.deleteReplyLikeBybcode(bcode2[i]);
				System.out.println("deleteReplyLikeInBoard : " + deleteReplyLikeInBoard);
				int deleteCommLikeInBoard = adao.deleteCommLikeBybcode(bcode2[i]);
				System.out.println("deleteCommLikeInBoard : " + deleteCommLikeInBoard);
				int deleteBoardLikeInBoard = adao.deleteBoardLikeBybcode(bcode2[i]);
				System.out.println("deleteBoardLikeInBoard : " + deleteBoardLikeInBoard);
				int deleteBoardByBcode = adao.deleteBoardByBcode(bcode2[i]);
				System.out.println("deleteBoardByBcode : "+ deleteBoardByBcode);
			}
			int deleteGuserByGcode = adao.deleteGuserByGcode(gcode[i]);
		}
		int deleteGroup = adao.deleteGroupPage(mid);
		System.out.println("deleteGroup : " + deleteGroup);
		
		//delete MemberProfile file
		String mProfile = adao.getMProfile(mid);
		savePath = "C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg\\userimg";
		if(mProfile != "basicImg") { //기본 프로필 사진이 아니면
			File file = new File(savePath, mProfile);
			file.delete();
		}
		//delete MEMBER		
		int deleteMember = adao.deleteMember(mid);
		System.out.println("mid , loginId : " + mid + " / " + loginId);
	      if(mid.equals(loginId)) {
	         System.out.println("mid와 loginId 같을 때");
	         mav.setViewName("member/Login");
	      } else {
	         System.out.println("mid와 loginId 다를 때");
	         mav.setViewName("redirect:/moveAdminHome");         
	      }
		return mav;
	}

	public ModelAndView memberView(String mid) {
		ModelAndView mav = new ModelAndView();
		System.out.println("mid : " + mid);
		MemberDto member = adao.memberView(mid);
		mav.addObject("member", member);
		mav.setViewName("admin/AdminMemberView");
		return mav;
	}

	public ModelAndView moveAdminBoardDelete() {
		ModelAndView mav = new ModelAndView();
		ArrayList<TimeLineDto> board = adao.getBoardList();
		for (int i = 0; i < board.size(); i++) {
			String bcode = board.get(i).getBcode();
			String[] photoList = adao.getPhotoList(bcode);
			board.get(i).setPhoto(photoList);
		}
		System.out.println("board 확인 : " + board);
		mav.addObject("board", board);
		mav.setViewName("admin/AdminBoardList");
		return mav;
	}

	public ModelAndView deleteBoard(String bcode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("bcode : " + bcode);
		// 기존에 있던 파일을 삭제하는 부분
		ArrayList<PhotoDto> pdtoList = adao.photoInfo(bcode);
		System.out.println(pdtoList);
		System.out.println(pdtoList.size());
		if (!pdtoList.isEmpty()) {
			for (int i = 0; i < pdtoList.size(); i++) {
				System.out.println("기존 사진 : " + pdtoList.get(i).getPhoto());
				String bpPhoto = pdtoList.get(i).getPhoto();
				int deletePhoto = adao.deletePhoto(bpPhoto);
				File file = new File(savePath, pdtoList.get(i).getPhoto());
				file.delete();
			}
		}
		//LIKE 삭제
		int deleteReplyLike = adao.deleteReplyLikeBybcode(bcode);
		System.out.println("deleteReplyLike : " + deleteReplyLike);
		int deleteCommLike = adao.deleteCommLikeBybcode(bcode);
		System.out.println("deleteCommLike : " + deleteCommLike);
		int deleteBoardLike = adao.deleteBoardLikeBybcode(bcode);
		System.out.println("deleteBoardLike : " + deleteBoardLike);
		
		// BOARDPHOTO 데이터 삭제
		int deleteBoardPhoto = adao.deletePhotoBybCode(bcode);
		System.out.println("deleteBoardPhoto : " + deleteBoardPhoto);
		//Reply삭제
		int deleteReply = adao.deleteReplyBybcode(bcode);
		System.out.println("deleteReply : " + deleteReply);
		//COMM delete by bcode
		int deleteComm = adao.deleteCommBybcode(bcode);	
		System.out.println("deleteComm : " + deleteComm);
		
		// BOARD 데이터 삭제
		int deleteBoard = adao.deleteBoardByBcode(bcode);
		System.out.println("deleteBoard : " + deleteBoard);
		mav.setViewName("redirect:/moveAdminBoardDelete");
		return mav;
	}

	public ModelAndView boardView(String bcode) {
		//get board
		ModelAndView mav = new ModelAndView();
		TimeLineDto board = adao.getBoard(bcode);	
		String mProfile = adao.getMProfile(board.getBmid());
		board.setMprofile(mProfile);
		if(board.getMprofile().contains("http")) {
		}else {
			String mprofile = "/controller/resources/uploadImg/userimg/"+board.getMprofile();
			board.setMprofile(mprofile);
		}		
		String photo[] = adao.getPhotoList(bcode);
		board.setPhoto(photo);
		System.out.println("board : " + board);
		
		//get Comm
		ArrayList<CommDto> commList = adao.getCommList(bcode);
		for(int i = 0; i < commList.size(); i++) {
			if(commList.get(i).getMprofile().contains("http")) {
			}else {
				String mprofile = "/controller/resources/uploadImg/userimg/"+commList.get(i).getMprofile();
				commList.get(i).setMprofile(mprofile);
			}
			commList.get(i).setReplycount(adao.getReplyCount(commList.get(i).getCcode()));
			commList.get(i).setLikecount(adao.getBoardLikeCount(commList.get(i).getCcode()));
		}
		System.out.println("commList : " + commList);
		
		//get Reply
		
		mav.addObject("commList", commList);
		mav.addObject("board", board);
		mav.setViewName("admin/AdminBoardView");
		return mav;
	}

	public ModelAndView moveAdminGroupDelete() {
		ModelAndView mav = new ModelAndView();
		//그룹명의 갯수
		ArrayList<GroupPageDto> groupList = adao.getGroupList();
		System.out.println(groupList);
		mav.addObject("groupList", groupList);
		mav.setViewName("admin/AdminGroupList");
		return mav;
	}

	//그룹 삭제
	public ModelAndView deleteGroup(String gcode) {
		ModelAndView mav = new ModelAndView();
		
		//회원 탈퇴
		int deleteGuser = adao.deleteGuer(gcode);
		
		//게시글 삭제  -- 타임라인 후에 처리
		ArrayList<PhotoDto> photoList = adao.photoInfoByGcode(gcode);
		System.out.println(gcode + " 그룹 게시글의 사진 갯수 : " + photoList.size());
		if (photoList.size() != 0) {
			for (int j = 0; j < photoList.size(); j++) {
				int deletePhotoResult = adao.deletePhoto(photoList.get(j).getPhoto());
				File file = new File(savePath, photoList.get(j).getPhoto());
				file.delete();
			}
		}
		String bcode[] = adao.selectBcodeByGcode(gcode);
		System.out.println(gcode + " 그룹의 게시글 갯수 : " + bcode.length);
		for (int i = 0; i < bcode.length; i++) {
			// LIKE(BOARD, COMM, REPLY) delete by bcode
			int deleteReplyLikeInBoard = adao.deleteReplyLikeBybcode(bcode[i]);			
			int deleteCommLikeInBoard = adao.deleteCommLikeBybcode(bcode[i]);
			int deleteBoardLikeInBoard = adao.deleteBoardLikeBybcode(bcode[i]);
			// Reply delete by bcode
			int deleteReplyByBcode = adao.deleteReplyBybcode(bcode[i]);
			// COMM delete by bcode
			int deleteCommInBoard = adao.deleteCommBybcode(bcode[i]);
			int deleteBoardByBcode = adao.deleteBoardByBcode(bcode[i]);
		}
		int deleteGuserByGcode = adao.deleteGuserByGcode(gcode);
		
		//그룹 삭제
		int deleteGroup = adao.deleteGroup(gcode);
		
		mav.setViewName("redirect:/moveAdminGroupDelete");
		return mav;
	}

	//신고 요청
    public String report(ReportDto reportdto) {
       
       String id = reportdto.getReporter();
       String code = reportdto.getReporttarget();
       //신고 중복 확인
       String doubleCheck = adao.checkReport(id,code);
       
       if(doubleCheck != null) {
          doubleCheck = "X";
          
       }else {
          doubleCheck = "O";
          int reportResult = adao.report(reportdto);
       }
       System.out.println("신고중복확인"+doubleCheck);
       return doubleCheck;
    }

    //신고 목록
    public ModelAndView getReportList() {
       ModelAndView mav = new ModelAndView();
       
       ArrayList<ReportDto> reportList = adao.getReportList();
       
       mav.addObject("report", reportList);
       mav.setViewName("admin/AdminReport");
       return mav;
    }
}
