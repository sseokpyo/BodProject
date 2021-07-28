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
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dao.BoardDao;
import com.BodProject.dto.BoardDto;
import com.BodProject.dto.BoardLikeDto;
import com.BodProject.dto.CommDto;
import com.BodProject.dto.HashTagDto;
import com.BodProject.dto.MemberDto;
import com.BodProject.dto.PhotoDto;
import com.BodProject.dto.ReplyDto;
import com.BodProject.dto.SearchFriendDto;
import com.BodProject.dto.TimeLineDto;
import com.google.gson.Gson;

@Service
public class BoardService {
	
	String savePath = 
			"C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg";
	int size = 1024*1024*10; // 파일 처리 크기 10MB
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BoardDao bdao;
	
	private PhotoDto pdto;
	
	private BoardLikeDto bldto;
	
	public ModelAndView boardList(String loginId) {
		ModelAndView mav = new ModelAndView();
		ArrayList<TimeLineDto> boardList = bdao.getBoardList(loginId);
		System.out.println("boardList : " + boardList);
		for(int i = 0; i<boardList.size(); i++) {
			String bcode = boardList.get(i).getBcode();
			ArrayList<String> tag = bdao.boardTagList(bcode);
	        boardList.get(i).setTaglist(tag);
			String[] photoList = bdao.getPhotoList(bcode);
			boardList.get(i).setPhoto(photoList);
			if(boardList.get(i).getMprofile().contains("http")) {
			}else {
				String mprofile = "/controller/resources/uploadImg/userimg/"+boardList.get(i).getMprofile();
				boardList.get(i).setMprofile(mprofile);
			}
			boardList.get(i).setCommcount(bdao.getCommcount(bcode));
			boardList.get(i).setLikecount(bdao.getBoardLikeCount(bcode));
			bldto = new BoardLikeDto();
			bldto.setLicode(bcode);
			bldto.setLimid(loginId);
			BoardLikeDto likemodify = bdao.boardlike(bldto);
			if(likemodify == null) {
				boardList.get(i).setLikemodify("far fa-heart");
			}else {
				boardList.get(i).setLikemodify("fas fa-heart");
			}
			if(boardList.get(i).getBgcode() != null) {
				String bgname = bdao.getBgname(boardList.get(i).getBgcode());
				String bgprofile = bdao.getBgprofile(boardList.get(i).getBgcode());
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
		System.out.println("boardList 확인 : " + boardList);
		mav.addObject("boardList", boardList);
		
		mav.setViewName("board/BoardList");
		return mav;
	}
	
	//글작성
		public ModelAndView boardWrite(BoardDto board) {
			
			ModelAndView mav = new ModelAndView();
			System.out.println(board);
			if(board.getBgcode() == null) {
				// 글번호 생성
				String maxBcode = bdao.maxBoardNum();
				String bcode = "B";
				if (maxBcode == null) {
					bcode += "00" + 1;
				} else {
					maxBcode = maxBcode.substring(1);
					int num = Integer.parseInt(maxBcode) + 1;
					if (num < 10) {
						bcode += "00" + num;
					} else if (num < 100) {
						bcode += "0" + num;
					} else if (num < 1000) {
						bcode += num;
					}
				}
				board.setBcode(bcode);
				board.setBvideo("video");
				//태그저장
	            if(board.getTaglist() != null) {
	               for(int i = 0; i < board.getTaglist().size(); i++) {
	                  String tagcode = board.getBcode();
	                  int addTag = bdao.addTag(board.getTaglist().get(i),tagcode);
	               }
	            }
				System.out.println("board : " + board);
				int insertBoard = bdao.insertBoard(board);
				if (insertBoard > 0) {
					System.out.println("board 테이블 입력완료");
				}
				
				// 파일업로드
				MultipartFile[] fileList = board.getBphotofile();
				
				for (MultipartFile mf : fileList) {
					String bfile = mf.getOriginalFilename(); // 원본 파일 명
					long fileSize = mf.getSize(); // 파일 사이즈
					if (!mf.isEmpty()) {
						UUID uuid = UUID.randomUUID();
						bfile = uuid.toString() + "_" + bfile;
						pdto = new PhotoDto();
						pdto.setPhoto(bfile);
						pdto.setPbcode(bcode);
						int insertPhoto = bdao.insertPhoto(pdto);
						if (insertPhoto > 0) {
							System.out.println("사진 입력 완료");
						}
					}
					try {
						mf.transferTo(new File(savePath, bfile));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}

				String[] filename = bdao.getPhotoList(bcode);
				System.out.println("filename : " + filename[0] + filename[1] + filename[2]);
				Gson gson = new Gson();
				String filename_json = gson.toJson(filename);
				mav.addObject("filename", filename_json);
				mav.setViewName("include/loading");
			} else if(board.getBgcode() != null) {
				// 글번호 생성
				String maxGbCode = bdao.maxGroupBoardNum();
				String gbCode = "GB";
				if (maxGbCode == null) {
					gbCode += "00" + 1;
				} else {
					maxGbCode = maxGbCode.substring(2);
					int num = Integer.parseInt(maxGbCode) + 1;
					if (num < 10) {
						gbCode += "00" + num;
					} else if (num < 100) {
						gbCode += "0" + num;
					} else if (num < 1000) {
						gbCode += num;
					}
				}
				board.setBcode(gbCode);
				board.setBvideo("video");
				
				System.out.println("board : " + board);
				int insertGroupBoard = bdao.insertGroupBoard(board);
				System.out.println("insertGroupBoard : " + insertGroupBoard);
				if (insertGroupBoard > 0) {
					System.out.println("Groupboard 테이블 입력완료");
				}
				
				//태그저장
	            if(board.getTaglist() != null) {
	               for(int i = 0; i < board.getTaglist().size(); i++) {
	                  String tagcode = board.getBcode();
	                  int addTag = bdao.addTag(board.getTaglist().get(i),tagcode);
	               }
	            }

				// 파일업로드
				MultipartFile[] fileList = board.getBphotofile();

				for (MultipartFile mf : fileList) {
					String gbfile = mf.getOriginalFilename(); // 원본 파일 명
					long fileSize = mf.getSize(); // 파일 사이즈

					if (!mf.isEmpty()) {
						UUID uuid = UUID.randomUUID();
						gbfile = uuid.toString() + "_" + gbfile;
						pdto = new PhotoDto();
						pdto.setPhoto(gbfile);
						pdto.setPbcode(gbCode);
						System.out.println("gbfile / gbCode : " + gbfile + " / " + gbCode);
						int insertPhoto = bdao.insertPhoto(pdto);
						if (insertPhoto > 0) {
							System.out.println("사진 입력 완료 : " + insertPhoto);
						}
					}
					try {
						mf.transferTo(new File(savePath, gbfile));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}

				String[] filename = bdao.getPhotoList(gbCode);
				System.out.println("filename : " + filename[0] + filename[1] + filename[2]);
				Gson gson = new Gson();
				String filename_json = gson.toJson(filename);
				mav.addObject("filename", filename_json);
				mav.setViewName("include/loading?gcode="+board.getBgcode());
				
			}
			return mav;
		}

		//글수정 페이지 이동
		public ModelAndView moveBoardModifyForm(String bcode) {
			ModelAndView mav = new ModelAndView();
			TimeLineDto timeline = bdao.getBoardByBcode(bcode);
			System.out.println("timeline : " + timeline);
			String[] photo = bdao.getPhotoList(bcode);
			timeline.setPhoto(photo);
			
			//해시태그 불러옴
	         ArrayList<HashTagDto> tagList = bdao.getBoardTagList(bcode);
	         mav.addObject("tagList", tagList);
	         mav.addObject("timeline", timeline);
	         mav.setViewName("board/BoardModifyForm");
	         return mav;
		}

		//글수정
		public ModelAndView boardModify(TimeLineDto board) throws IllegalStateException, IOException {
			// TODO Auto-generated method stub
			ModelAndView mav = new ModelAndView();
			System.out.println(board);
			if(board.getBgcode() == null) {
				String bcode = board.getBcode();
				System.out.println("bcode : " + bcode);
				MultipartFile[] fileList = board.getBphotofile();
				//태그저장
	            if(board.getTaglist() != null) {
	               for(int i = 0; i < board.getTaglist().size(); i++) {
	                  String tagcode = board.getBcode();
	                  int addTag = bdao.addTag(board.getTaglist().get(i),tagcode);
	               }
	            }
				
				//기존 파일 삭제
				ArrayList<PhotoDto> pdtoList = bdao.photoInfo(bcode);
				System.out.println("파일삭제 서비스 시작");;
				if (!fileList[0].isEmpty()) {
					for (int i = 0; i < pdtoList.size(); i++) {
						String bPhoto = pdtoList.get(i).getPhoto();
						int deletePhoto = bdao.deletePhoto(bPhoto);
						File file = new File(savePath, pdtoList.get(i).getPhoto());
						file.delete();
					}
				}
				//int i = 0; i<fileList.length;i++
				for (MultipartFile mf : fileList) {
					String bfile = mf.getOriginalFilename(); // 원본 파일 명
					long fileSize = mf.getSize(); // 파일 사이즈
					
					
					
					// 파일업로드
					System.out.println("파일업로드 서비스 시작");
					if (!mf.isEmpty()) {
						UUID uuid = UUID.randomUUID();
						bfile = uuid.toString() + "_" + bfile;
						pdto = new PhotoDto();
						pdto.setPhoto(bfile);
						pdto.setPbcode(board.getBcode());
						int insertPhoto = bdao.insertPhoto(pdto);
						if (insertPhoto > 0) {
							System.out.println("사진 입력 완료");
						}
					}
					try {
						mf.transferTo(new File(savePath, bfile));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				int boardUpdate = bdao.boardModify(board);
				mav.setViewName("redirect:/boardList");
			} else if (board.getBgcode() != null) {
				String bcode = board.getBcode();
				System.out.println("bcode : " + bcode);
				MultipartFile[] fileList = board.getBphotofile();	
				
				if(!fileList[0].isEmpty()) {
					ArrayList<PhotoDto> pdtoList = bdao.GroupPhotoInfo(bcode);
					// 기존에 있던 파일을 삭제하는 부분
						for(int i = 0; i < pdtoList.size(); i++) {
							String gPhoto = pdtoList.get(i).getPhoto();
							int deletePhoto = bdao.deletePhoto(gPhoto);
							File file = new File(savePath, pdtoList.get(i).getPhoto());
							file.delete();	
						}
				
				for (MultipartFile mf : fileList) {
					String gbFile = mf.getOriginalFilename();
					long fileSize = mf.getSize(); // 파일 사이즈
					
							// 파일업로드	
							System.out.println("파일업로드 서비스 시작");
							if (!mf.isEmpty()) {
								UUID uuid = UUID.randomUUID();
								gbFile = uuid.toString() + "_" + gbFile;
								pdto = new PhotoDto();
								pdto.setPhoto(gbFile);
								pdto.setPbcode(board.getBcode());
								int insertPhoto = bdao.insertPhoto(pdto);
								if (insertPhoto > 0) {
									System.out.println("사진 입력 완료");
								}
							}
							try {
								mf.transferTo(new File(savePath, gbFile));
							} catch (IllegalStateException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						
					}
				}	
				System.out.println(board);
				int boardUpdate = bdao.boardModify(board);
				mav.setViewName("redirect:/boardList");
			}
			return mav;
		}
		
		//글삭제
				public ModelAndView boardDelete(String bcode) {
					ModelAndView mav = new ModelAndView();
					System.out.println("bcode : " + bcode);
					// 기존에 있던 파일을 삭제하는 부분
					ArrayList<PhotoDto> pdtoList = bdao.photoInfo(bcode);
					if (!pdtoList.isEmpty()) {
						for (int i = 0; i < pdtoList.size(); i++) {
							String bpPhoto = pdtoList.get(i).getPhoto();
							int deletePhoto = bdao.deletePhoto(bpPhoto);
							File file = new File(savePath, pdtoList.get(i).getPhoto());
							file.delete();
						}
					}
					//LIKE 삭제
					int deleteReplyLike = bdao.deleteReplyLikeBybcode(bcode);
					System.out.println("deleteReplyLike : " + deleteReplyLike);
					int deleteCommLike = bdao.deleteCommLikeBybcode(bcode);
					System.out.println("deleteCommLike : " + deleteCommLike);
					int deleteBoardLike = bdao.deleteBoardLikeBybcode(bcode);
					System.out.println("deleteBoardLike : " + deleteBoardLike);
					//해시태그 삭제
		            int deleteTag = bdao.deleteBoardTag(bcode);
					// BOARDPHOTO 데이터 삭제
					int deleteBoardPhoto = bdao.deletePhotoBybCode(bcode);
					System.out.println("deleteBoardPhoto : " + deleteBoardPhoto);
					//Reply삭제
					int deleteReply = bdao.deleteReplyBybcode(bcode);
					System.out.println("deleteReply : " + deleteReply);
					//COMM delete by bcode
					int deleteComm = bdao.deleteCommBybcode(bcode);	
					System.out.println("deleteComm : " + deleteComm);
					
					// BOARD 데이터 삭제
					int deleteBoard = bdao.deleteBoard(bcode);
					System.out.println("deleteBoard : " + deleteBoard);
					mav.setViewName("redirect:/boardList");
					return mav;
				}

	public ArrayList<CommDto> getCommList(String loginId, String bcode) {
		ArrayList<CommDto> commList = bdao.getCommList(bcode);
		for(int i = 0; i < commList.size(); i++) {
			if(commList.get(i).getMprofile().contains("http")) {
			}else {
				String mprofile = "/controller/resources/uploadImg/userimg/"+commList.get(i).getMprofile();
				commList.get(i).setMprofile(mprofile);
			}
			commList.get(i).setReplycount(bdao.getReplyCount(commList.get(i).getCcode()));
			commList.get(i).setLikecount(bdao.getBoardLikeCount(commList.get(i).getCcode()));
			bldto = new BoardLikeDto();
			bldto.setLicode(commList.get(i).getCcode());
			bldto.setLimid(loginId);
			BoardLikeDto likemodify = bdao.boardlike(bldto);
			if(likemodify == null) {
				commList.get(i).setLikemodify("far fa-heart");
			}else {
				commList.get(i).setLikemodify("fas fa-heart");
			}
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date toDay = new Date();
		for(int i = 0; i < commList.size(); i++) {
			String cdate = commList.get(i).getCdate();
			Date commDate = null;
			try {
				commDate = format.parse(cdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int secondCommdate = (int) ((toDay.getTime() - commDate.getTime())/1000);
			String transCdate = null;
			if(secondCommdate < 60) {
				transCdate = secondCommdate +"초전";
			}else if(secondCommdate < 3600) {
				transCdate = secondCommdate/60 +"분전";
			}else if(secondCommdate < 86400) {
				transCdate = secondCommdate/3600 +"시간전";
			}else{
				transCdate = secondCommdate/86400 +"일전";
			}
			commList.get(i).setCdate(transCdate);
		}
		
		System.out.println("commList : " + commList);
		return commList;
	}

	public String commRegist(CommDto cdto) {
		String bcode = null;
		if(cdto.getCcomment() == null || cdto.getCcomment() == "") {
			bcode = "글내용을 입력해주세요";
		}else {
			String maxCcode = bdao.maxCcodeNum();
			String ccode = "C";
			if(maxCcode == null) {
				ccode += "00" + 1;
			}else {
				maxCcode = maxCcode.substring(1);
				int num = Integer.parseInt(maxCcode) +1;
				if(num < 10) {
					ccode += "00" + num;
				}else if(num < 100){
					ccode += "0" + num;
				}else if(num <1000) {
					ccode += num;
				}
			}
			
			cdto.setCcode(ccode);
			System.out.println("cdtoservice : " + cdto);
			int commInsert = bdao.commRegist(cdto);
			bcode = cdto.getCbcode();
		}
		System.out.println("bcode : " + bcode);
		return bcode;
	}

	public ArrayList<ReplyDto> getReplyList(String loginId, String ccode, String cbcode) {
		System.out.println(ccode + "" +  cbcode);
		ArrayList<ReplyDto> replyList = bdao.getReplyList(ccode, cbcode);
		for(int i = 0; i < replyList.size(); i++) {
			if(replyList.get(i).getMprofile().contains("http")) {
			}else {
				String mprofile = "/controller/resources/uploadImg/userimg/"+replyList.get(i).getMprofile();
				replyList.get(i).setMprofile(mprofile);
			}
			
			replyList.get(i).setLikecount(bdao.getBoardLikeCount(replyList.get(i).getRecode()));
			bldto = new BoardLikeDto();
			bldto.setLicode(replyList.get(i).getRecode());
			bldto.setLimid(loginId);
			System.out.println("bldto : " + bldto);
			BoardLikeDto likemodify = bdao.boardlike(bldto);
			System.out.println("likemodify : " + likemodify);
			if(likemodify == null) {
				replyList.get(i).setLikemodify("far fa-heart");
			}else {
				replyList.get(i).setLikemodify("fas fa-heart");
			}
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date toDay = new Date();
		for(int i = 0; i < replyList.size(); i++) {
			String replyDate = replyList.get(i).getRedate();
			Date redate = null;
			try {
				redate = format.parse(replyDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int secondRedate = (int) ((toDay.getTime() - redate.getTime())/1000);
			String transRedate = null;
			if(secondRedate < 60) {
				transRedate = secondRedate +"초전";
			}else if(secondRedate < 3600) {
				transRedate = secondRedate/60 +"분전";
			}else if(secondRedate < 86400) {
				transRedate = secondRedate/3600 +"시간전";
			}else{
				transRedate = secondRedate/86400 +"일전";
			}
			replyList.get(i).setRedate(transRedate);
		}
		
		System.out.println("replyList : " + replyList);
		return replyList;
	}

	public ReplyDto replyRegist(ReplyDto rdto) {
		if(rdto.getRecomment() == null || rdto.getRecomment() == "") {
			String rebcode = rdto.getRebcode();
			rebcode = "답글내용을 입력해주세요";
			rdto.setRebcode(rebcode);
			return rdto;
		}else {
			String maxRecode = bdao.maxRecodeNum();
			String recode = "R";
			if(maxRecode == null) {
				recode += "00" + 1;
			}else {
				maxRecode = maxRecode.substring(1);
				int num = Integer.parseInt(maxRecode) +1;
				if(num < 10) {
					recode += "00" + num;
				}else if(num < 100){
					recode += "0" + num;
				}else if(num <1000) {
					recode += num;
				}
			}
			
			rdto.setRecode(recode);
			System.out.println("rdtoservice : " + rdto);
			int replyInsert = bdao.replyRegist(rdto);
			
			System.out.println("rebcode : " + rdto.getRebcode());
			System.out.println("reccode : " + rdto.getReccode());
			return rdto;
		}
	}

	public String boardlike(BoardLikeDto bldto) {
		BoardLikeDto select = bdao.boardlike(bldto);
		String result = null;
		if(select == null) {
			int updatelike = bdao.setBoardlike(bldto);
			if(updatelike > 0) {
				result = "add";
			}
		}else {
			int deletelike = bdao.deleteBoardlike(bldto);
			if(deletelike > 0) {
				result = "remove";
			}
		}
		return result;
	}

	//회원 타임라인 호출
    public ModelAndView getUserBoardList(String userId, String loginId) {
       ModelAndView mav = new ModelAndView();      
       
       MemberDto userInfo = bdao.getUserInfo(userId);
       if(userInfo.getMprofile().contains("http")) {
       }else {
          String mprofile = "/controller/resources/uploadImg/userimg/"+userInfo.getMprofile();
          userInfo.setMprofile(mprofile);
       }
       //로그인회원과 보드회원이 친구인지 확인
       //친구인지 확인 
       String friendId = userInfo.getMid();
       System.out.println("내아이디: "+loginId+ "확인할 친구 아이디 : "+friendId);
       String fcheckResult = bdao.friendCheck(loginId,friendId);
       if(fcheckResult != null) {
          userInfo.setFriendcheck(1);
       }else {
          userInfo.setFriendcheck(0);
       }
       //친구 수 
       int friendNum = bdao.getFriendNum(friendId);
       
       //보드 추가부분
       ArrayList<TimeLineDto> boardList = bdao.getUserBoardList(userId);
		
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
     				bldto = new BoardLikeDto();
     				bldto.setLicode(bcode);
     				bldto.setLimid(loginId);
     				BoardLikeDto likemodify = bdao.boardlike(bldto);
     				
     				if(likemodify == null) {
     					boardList.get(i).setLikemodify("far fa-heart");
     				}else {
     					boardList.get(i).setLikemodify("fas fa-heart");
     				}
     				if(boardList.get(i).getBgcode() != null) {
     					String bgname = bdao.getBgname(boardList.get(i).getBgcode());
     					String bgprofile = bdao.getBgprofile(boardList.get(i).getBgcode());
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
     		
       mav.addObject("friendNum", friendNum);
       mav.addObject("boardList", boardList);
       mav.addObject("userInfo", userInfo);
       mav.setViewName("/board/UserBoardList");
       
       return mav;
    }

    //0720추가 -------------------
    
    
    // 내 타임라인
    public ModelAndView getMyBoardList(String loginId) {
       ModelAndView mav = new ModelAndView();
       
       MemberDto myInfo = bdao.getMyInfo(loginId);
       if(myInfo.getMprofile().contains("http")) {
       }else {
          String mprofile = "/controller/resources/uploadImg/userimg/"+myInfo.getMprofile();
          myInfo.setMprofile(mprofile);
       }
       int friendNum = bdao.getFriendNum(loginId);
       //게시글
       ArrayList<TimeLineDto> boardList = bdao.getMyBoardList(loginId);
		
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
				bldto = new BoardLikeDto();
				bldto.setLicode(bcode);
				bldto.setLimid(loginId);
				BoardLikeDto likemodify = bdao.boardlike(bldto);
				
				if(likemodify == null) {
					boardList.get(i).setLikemodify("far fa-heart");
				}else {
					boardList.get(i).setLikemodify("fas fa-heart");
				}
				if(boardList.get(i).getBgcode() != null) {
					String bgname = bdao.getBgname(boardList.get(i).getBgcode());
					String bgprofile = bdao.getBgprofile(boardList.get(i).getBgcode());
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
       
       mav.addObject("friendNum", friendNum);
       mav.addObject("userInfo", myInfo);
       mav.addObject("boardList", boardList);
       mav.setViewName("/board/UserBoardList");
       
       return mav;
    }

    public ModelAndView profileModifyForm(String loginId) {
       ModelAndView mav = new ModelAndView();
       
       MemberDto myInfo = bdao.getMyInfo(loginId);
       if(myInfo.getMprofile().contains("http")) {
       }else {
          String mprofile = "/controller/resources/uploadImg/userimg/"+myInfo.getMprofile();
          myInfo.setMprofile(mprofile);
       }
       int friendNum = bdao.getFriendNum(loginId);
       
       //게시글 추가
       
       mav.addObject("userInfo", myInfo);
       mav.addObject("friendNum", friendNum);
       mav.setViewName("/board/ProfileModifyForm");
       return mav;
    }

    //타임라인 프로필 수정
    public ModelAndView modifyBoardProfile(MemberDto modiMem) throws IllegalStateException, IOException {
       ModelAndView mav = new ModelAndView();
       
       String savePath = "C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg\\userimg";
       
       MultipartFile modiProfile = modiMem.getMfile();
       
       //새로지정한 파일이 있을때
       if(modiProfile.getSize() > 0) {
          //기존 저장된 파일 삭제 
          File file = new File(savePath, modiMem.getMprofile());
          file.delete();
          
          //새로 파일 이름 생성
          UUID uuid = UUID.randomUUID();
          
          String mfilename = uuid.toString() + "_" + modiProfile.getOriginalFilename();

          if(!modiProfile.isEmpty()) {
             modiProfile.transferTo(new File(savePath, mfilename));
          }
          modiMem.setMprofile(mfilename);
          
          //업데이트 실행
          int modifyResult = bdao.modifyMember(modiMem);
          
          if(modifyResult < 0) {
             File file2 = new File(savePath, modiMem.getMprofile());
             file2.delete();
          }
       }else {
          //새로 지정한 파일이 없을때
          String mprofile = modiMem.getMprofile();  
          String saveProfile = mprofile.substring(40);
          modiMem.setMprofile(saveProfile);
          int modifyResult2 = bdao.modifyMember(modiMem);
       }
       
       //세션 다시 저장
       session.invalidate();
       
       String userProfile = modiMem.getMprofile();
       session.setAttribute("loginId", modiMem.getMid());
       session.setAttribute("loginNick", modiMem.getMnick());
       
       if(userProfile.contains("http")){
          
       }else {
          userProfile = "/controller/resources/uploadImg/userimg/"+userProfile;
       }
       session.setAttribute("loginPf", userProfile);
       
       
       mav.setViewName("redirect:/moveMyBoardList");
       return mav;
    }

	public ArrayList<SearchFriendDto> searchfriend(String searchtext, String loginId) {
		searchtext = "%" + searchtext + "%";
		ArrayList<SearchFriendDto> searchFriendList = bdao.searchFriend(searchtext, loginId);
		for(int i = 0; i<searchFriendList.size(); i++) {
			if(searchFriendList.get(i).getUserprofile().contains("http")) {	
			}else {
				String mprofile = "/controller/resources/uploadImg/userimg/"+searchFriendList.get(i).getUserprofile();
				searchFriendList.get(i).setUserprofile(mprofile);
			}			
		}
		return searchFriendList;
	}

	public String[] showLikeList(String bcode) {
		String[] likelist = bdao.getLikeList(bcode);
		return likelist;
	}

	public String uploadtime(String[] filename) {
		String upload = null;
		for(int i = 0; i < filename.length; i++) {
			filename[0] = StringUtils.delete(filename[0], "[");
			filename[(filename.length)-1] = StringUtils.delete(filename[(filename.length)-1], "]");
			filename[i] = StringUtils.delete(filename[i], "\"");
			System.out.println("filename0728 : " + filename[i]);
			boolean run = true;
			while(run) {
				File aa = new File(savePath, filename[i]);
				boolean result = aa.exists();
				System.out.println("result : " + result);
				
				if(result == true) {
					run = false;
				}
			}
		}
		upload = "exist";
		
		System.out.println("upload : " + upload);
		return upload;
	}
	//0722
	   //해시태그
	   public ArrayList<HashTagDto> searchHashTag(String searchTag) {
	      String tagWord = searchTag+"%";
	      ArrayList<HashTagDto> tagList = bdao.getTagList(tagWord);
	      for(int i = 0; i<tagList.size(); i++) {
	         //태그가 포함된 게시글 숫자
	         int tagNum = bdao.getTagNum(tagList.get(i).getTagname());
	         tagList.get(i).setTagnum(tagNum);
	      }
	      return tagList;
	   }

	   public int tagDelete(String tagcode, String tagname) {
	      int deleteResult = bdao.tagDelete(tagcode,tagname);
	      return deleteResult;
	   }

	   //해시태그 타임라인
	   public ModelAndView moveHashTagBoardList(HashTagDto tag,String loginId) {
	      ModelAndView mav = new ModelAndView();
	      //코드로 검색해서 가져오기
	      ArrayList<TimeLineDto> boardList = new ArrayList<TimeLineDto>();
	      System.out.println(tag.getOrderby());
	      if(tag.getOrderby().equals("like")) {
	         boardList = bdao.getTagLikeBoardList(tag);
	      }else{
	         boardList = bdao.getTagNewBoardList(tag);
	      }
	      
	      for(int i = 0; i<boardList.size(); i++) {
	         String bcode = boardList.get(i).getBcode();
	         String[] photoList = bdao.getPhotoList(bcode);
	         boardList.get(i).setPhoto(photoList);
	      
	         ArrayList<String> addTag = bdao.boardTagList(bcode);
	         boardList.get(i).setTaglist(addTag);               
	         
	         if(boardList.get(i).getMprofile().contains("http")) {
	            
	         }else {
	            String mprofile = "/controller/resources/uploadImg/userimg/"+boardList.get(i).getMprofile();
	            boardList.get(i).setMprofile(mprofile);
	            
	         }
	         
	         boardList.get(i).setCommcount(bdao.getCommcount(bcode));
	         boardList.get(i).setLikecount(bdao.getBoardLikeCount(bcode));
	         bldto = new BoardLikeDto();
	         bldto.setLicode(bcode);
	         bldto.setLimid(loginId);
	         BoardLikeDto likemodify = bdao.boardlike(bldto);
	         
	         if(likemodify == null) {
	            boardList.get(i).setLikemodify("far fa-heart");
	         }else {
	            boardList.get(i).setLikemodify("fas fa-heart");
	         }
	         if(boardList.get(i).getBgcode() != null) {
	            String bgname = bdao.getBgname(boardList.get(i).getBgcode());
	            String bgprofile = bdao.getBgprofile(boardList.get(i).getBgcode());
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
	      
	      //태그정보
	      String tagname = tag.getTagname();
	      HashTagDto tagdto = bdao.getHashTagInfo(tagname);
	      mav.addObject("tagInfo", tagdto);
	      mav.addObject("boardList", boardList);
	      mav.setViewName("/board/HashTagBoardList");
	      return mav;
	   }

	

}
