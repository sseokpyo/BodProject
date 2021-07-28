package com.BodProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dto.BoardDto;
import com.BodProject.dto.BoardLikeDto;
import com.BodProject.dto.CommDto;
import com.BodProject.dto.HashTagDto;
import com.BodProject.dto.MemberDto;
import com.BodProject.dto.ReplyDto;
import com.BodProject.dto.SearchFriendDto;
import com.BodProject.dto.TimeLineDto;
import com.BodProject.service.BoardService;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardService bsvc;
	
	private ModelAndView mav;
	
	File file;
	int size = 1024*1024*10; // 파일 처리 크기 10MB
	String savePath =  // 파일 저장 경로 
			"C:\\springworkspace\\BodProject\\src\\main\\webapp\\resources\\uploadImg";
	
	@RequestMapping(value="/boardList")
	public ModelAndView boardList() {
		String loginId = (String) session.getAttribute("loginId");
		mav = bsvc.boardList(loginId);
		return mav;
	}
	//글작성 페이지 이동
		@RequestMapping(value="/moveBoardWriteForm")
		public String moveBoardWriteForm() {
			return "board/BoardWriteForm";
		}
		
		//글작성
		@RequestMapping(value="/boardWrite")
		public ModelAndView boardWrite(BoardDto board) throws IllegalStateException, IOException {
					System.out.println("boardWrite controller 실행");	
					System.out.println("boardwrite 확인" + board);
		    		mav = bsvc.boardWrite(board);
		    		return mav;
		 }
		
		//글작성 페이지 이동
		@RequestMapping(value = "/moveGroupBoardWriteForm")
		public String moveGroupBoardWriteForm(String gcode) {
			
			return "board/BoardWriteForm?gcode="+gcode;
		}
		
		
		
		//글수정 페이지 이동
		@RequestMapping(value="/moveBoardModifyForm")
		public ModelAndView moveBoardModifyForm(@RequestParam("bcode") String bcode) {
			System.out.println("moveBoardModifyForm controller 실행");
			System.out.println("bcode: " +  bcode);
			mav = bsvc.moveBoardModifyForm(bcode);
			return mav;		
		}
		
		//글수정
		@RequestMapping(value="/boardModify")
		public ModelAndView boardModify(TimeLineDto board) throws IllegalStateException, IOException {
			System.out.println("boardModify controller 실행 ");
			System.out.println(board);
			mav= bsvc.boardModify(board);
			return mav;
		}
		
		//글삭제
		@RequestMapping(value = "/boardDelete")
		public ModelAndView boardDelete(@RequestParam("bcode") String bcode) {
			System.out.println("boardDelete controller 실행");
			mav = bsvc.boardDelete(bcode);
			return mav;
		}
	
	@RequestMapping(value="/commList")
	public @ResponseBody String commList(@RequestParam("bcode") String bcode){
		String loginId = (String) session.getAttribute("loginId");
		ArrayList<CommDto> commList = bsvc.getCommList(loginId, bcode);
		Gson gson = new Gson();
		String json_commList = gson.toJson(commList);
		return json_commList;
	}
	
	@RequestMapping(value="/commRegist", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public @ResponseBody String commRegist(CommDto cdto) {
		cdto.setCmnick((String) session.getAttribute("loginNick"));
		System.out.println("cdto : " + cdto);
		String bcode = bsvc.commRegist(cdto);
		System.out.println("bcode : " + bcode);
		return bcode;
	}
	
	@RequestMapping(value="/replyList", method=RequestMethod.POST)
	public @ResponseBody String replyList(@RequestParam("ccode") String ccode, @RequestParam("cbcode") String cbcode) {
		String loginId = (String) session.getAttribute("loginId");
		ArrayList<ReplyDto> replyList = bsvc.getReplyList(loginId, ccode, cbcode);
		Gson gson = new Gson();
		String json_replyList = gson.toJson(replyList);
		return json_replyList;
	}
	
	@RequestMapping(value="/replyRegist", method=RequestMethod.POST)
	public @ResponseBody ReplyDto replyRegist(ReplyDto rdto) {
		rdto.setRemnick((String) session.getAttribute("loginNick"));
		System.out.println("rdto : " + rdto);
		ReplyDto rdto2 = bsvc.replyRegist(rdto);
		return rdto2;
	}
	
	@RequestMapping(value="/boardlike", method=RequestMethod.POST)
	public @ResponseBody String boardlike(BoardLikeDto bldto) {
		bldto.setLimid((String) session.getAttribute("loginId"));
		String result = bsvc.boardlike(bldto);
		return result;
	}
	
	//0714 -추가
		//회원 타임라인 이동
		@RequestMapping(value="/moveUserBoardList")
		public ModelAndView moveUserBoardList(String userId, String loginId){
			
			mav = bsvc.getUserBoardList(userId,loginId);
			return mav;
		}
		
		//타임라인 프로필 수정
		
		 //내 타임라인
		   @RequestMapping(value="/moveMyBoardList")
		   public ModelAndView moveMyBoardList(){
		      String loginId = (String)session.getAttribute("loginId");
		      
		      mav = bsvc.getMyBoardList(loginId);
		      return mav;
		   }
		   
		   //타임라인 프로필 수정 이동
		   @RequestMapping(value="/moveProfileModifyForm")
		   public ModelAndView moveProfileModifyForm(){
		      String loginId = (String)session.getAttribute("loginId");
		      
		      mav = bsvc.profileModifyForm(loginId);
		      return mav;
		   }
		   
		   //타임라인 프로필 수정 작업
		   @RequestMapping(value="/modifyBoardProfile")
		   public ModelAndView profileModify(MemberDto modiMem) throws IllegalStateException, IOException {
		      mav = bsvc.modifyBoardProfile(modiMem);
		      
		      return mav;
		   }
		   
		   @RequestMapping(value="/searchfriend")
		   public @ResponseBody String searchfriend(String searchtext) {
			   String loginId = (String) session.getAttribute("loginId");
			   ArrayList<SearchFriendDto> searchFriendList = bsvc.searchfriend(searchtext, loginId);
			   Gson gson = new Gson();
			   String json_searchFriendList = gson.toJson(searchFriendList);
			   return json_searchFriendList;
		   }
		   
		   @RequestMapping(value="/showLikeList")
		   public @ResponseBody String showLikeList(String bcode) {
			   String[] likelist = bsvc.showLikeList(bcode);
			   Gson gson = new Gson();
			   String json_likelist = gson.toJson(likelist);
			   return json_likelist;
		   }
		   
		  
		  
		  @RequestMapping(value="/uploadtime")
		  public @ResponseBody String uploadtime(String[] filename) {
			 for(int i = 0; i<filename.length; i++) {
				 System.out.println(filename[i]);
			 }
			  String upload = bsvc.uploadtime(filename);
			  Gson gson = new Gson();
			  String json_upload = gson.toJson(upload);
			  return json_upload;
		  }
		  
		  @RequestMapping(value="/tagTest")
	         public String testHashTag(BoardDto test){
	            System.out.println("본문:"+test.getBcontent());
	            System.out.println("태그:"+test.getTaglist());
	            for(int i =0; i<test.getTaglist().size(); i++) {
	               String a = test.getTaglist().get(i);
	               System.out.println(i+"번째 문자"+a);
	            }
	            return "/board/hashtag";
	         }
	         
	         @RequestMapping(value="/searchHashTag")
	         public @ResponseBody String searchHashTag(String searchTag) {
	            ArrayList<HashTagDto> testB= bsvc.searchHashTag(searchTag);
	            Gson gson = new Gson();
	            String json_testB = gson.toJson(testB);
	            return json_testB;
	         }
	         
	         
	         @RequestMapping(value="/modifyBtagDelete")
	         public @ResponseBody int modifyBtagDelete(String tagcode, String tagname) {
	            System.out.println("삭제태그"+tagcode+":"+tagname);
	            int tagDelete = bsvc.tagDelete(tagcode, tagname);
	            return tagDelete;
	         }
	         
	         @RequestMapping(value="/moveTagBoardList")
	         public ModelAndView moveTagBoardList(HashTagDto tag) {
	            String reTag = "#"+tag.getTagname();
	            tag.setTagname(reTag);
	            String loginId = (String)session.getAttribute("loginId");
	            mav = bsvc.moveHashTagBoardList(tag,loginId);
	            return mav;
	         }
	         
	         
	         
}


