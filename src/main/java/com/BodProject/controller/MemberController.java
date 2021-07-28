 package com.BodProject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dto.MemberDto;
import com.BodProject.service.MemberService;
import com.google.gson.Gson;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	@Autowired
	private MemberService msvc;
	
	@Autowired
	private HttpSession session;

	
	ModelAndView mav = new ModelAndView();
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "member/Login";
	}
	
	@RequestMapping(value="/logout")
	public String logout() {
		session.invalidate();
		return "member/Login";
	}
	
	@RequestMapping(value="/checkLogin")
	public @ResponseBody String checkLogin(String loginId, String loginPw){
		String checkResult = msvc.checkLogin(loginId,loginPw);
		return checkResult;
	}
	 
	@RequestMapping(value="/login")
	public ModelAndView login(String loginId) {	
		mav = msvc.getNick(loginId);
		return mav;
	}
	
	@RequestMapping(value="/kakaoLogin")
	public ModelAndView kakaoLogin(String loginId) {	
		mav = msvc.getNick(loginId);
		return mav;
	}
	
	@RequestMapping(value="/searchId")
	public @ResponseBody String searchId(String mname, int mphone) {
		String searchId = msvc.searchId(mname,mphone);
		return searchId;
	}
	
	@RequestMapping(value="/searchPw")
	public @ResponseBody String searchPw(String mid, int mphone) {
		String searchPw = msvc.searchPw(mid,mphone);
		return searchPw;
	}
	
	@RequestMapping(value="/checkKakaoUser")
	public @ResponseBody String checkKakaoUser(String kId, String kname, String Kgender,String kprofile) {
		String kUserInfo  = msvc.checkKakaoUser(kId,kname);
		return kUserInfo;
	}
	
	@RequestMapping( value="/kakaoJoin", method = RequestMethod.GET)
	public ModelAndView kakaoJoin(String id,String name, String gender, String profile) {
		
		mav.addObject("id", id);
		mav.addObject("name", name);
		mav.addObject("gender", gender);
		mav.addObject("profile", profile);
		
		mav.setViewName("member/joinForm");
		
		return mav;
	}
	
	
	@RequestMapping(value="/moveIdCheck")
	public @ResponseBody String moveMEMAILcheck(String inputMid) {
		
		String midCheckResult = msvc.moveMidCheck(inputMid);
		
		return midCheckResult;
		
	}
	
	@RequestMapping(value="/MNICKcheck")
	public @ResponseBody String MNICKcheck(String inputMNICK) {
		
		String MNICKcheckResult = msvc.MNICKcheck(inputMNICK);
		
		return MNICKcheckResult;
	
}
	
	@RequestMapping(value="/memberjoin", method = RequestMethod.POST)
		public ModelAndView memberjoin(MemberDto memberInfo) throws IllegalStateException, IOException{
		System.out.println("/memberjoin 실행 ");
		System.out.println(memberInfo);
		mav = msvc.memberjoin(memberInfo);
		return mav;
	}
	
	//0712 합친 후 추가 코드 -----------------------------------------------------
	
	@RequestMapping(value="/profileModify")
	public ModelAndView profileModify(MemberDto modifyMem) throws IllegalStateException, IOException {
		System.out.println("수정된 정보 확인: "+modifyMem);
		if(modifyMem.getMgender() == null) {
			modifyMem.setMgender("");
		}
		
		mav = msvc.modifyMember(modifyMem);
		return mav;
	}
	

@RequestMapping(value="/friendRequest")
	public @ResponseBody int friendUpdate(String loginId, String friendId){
		System.out.println("friendRequest controller 실행");
		int friendUpdate = msvc.friendRequest(loginId,friendId);
		System.out.println("friendUpdate : " + friendUpdate);
		return friendUpdate;
	}
	
	@RequestMapping(value="/friendDelete")
	public @ResponseBody int friendDelete(String loginId, String friendId){
		
		int friendDelete = msvc.friendDelete(loginId,friendId);
		return friendDelete;
	}
	
	@RequestMapping(value="/getUserFriendList")
	public @ResponseBody String getUserFriendList(String userId, String loginId){
		
		ArrayList<MemberDto> userFrList = msvc.getFriendList(userId, loginId);
		
		Gson gson = new Gson();
		String json_friendList = gson.toJson(userFrList);
		
		return json_friendList;
	}
	

	@RequestMapping(value="/moveLoginForm")
	public String moveLoginForm() {
		return "member/Login";
	}
	@RequestMapping(value="/moveJoinForm")
	public String moveJoinForm() {
		return "member/joinForm";
	}

	@RequestMapping(value="/moveSearchIdPwForm")
	public String moveSearchIdPwForm(){
		return "member/SearchIdPwForm";
	}
	
	//7월23일
		@RequestMapping(value="/moveFriendRequest")
		public ModelAndView moveFriendRequest(String userId){
			System.out.println("moveFriendRequest controller 실행 userId : " + userId);
			mav = msvc.moveFriendRequest(userId);
			return mav;
		}
		
		@RequestMapping(value = "/acceptFriend")
		public ModelAndView acceptFriend (String friendId, String userId) {
			System.out.println("acceptFriend controller 실행 friendId / userId : " + friendId + " / " + userId);
			mav = msvc.acceptFriend(friendId, userId);
			return mav;
		}
		
		@RequestMapping(value = "/refuseFriend")
		public ModelAndView refuseFriend(String friendId, String userId) {
			System.out.println("refuseFriend controller 실행 friendId / userId : " + friendId + " / " + userId);
			mav = msvc.refuseFriend(friendId, userId);
			return mav;
		}
		
		@RequestMapping(value = "/deleteFriend")
		public ModelAndView deleteFriend(String friendId, String userId) {
			System.out.println("deleteFriend controller 실행 friendId / userId : " + friendId + " / " + userId);
			mav = msvc.deleteFriend(friendId, userId);
			return mav;
		}
		
		@RequestMapping(value = "/acceptFriendByAjax")
		public @ResponseBody String acceptFriendByAjax(String friendId, String userId) {
			System.out.println("acceptFriendByAjax controller 실행 friendId / userId : " + friendId + " / " + userId );
			String aceceptResult = msvc.acceptFriendByAjax(friendId, userId);
			return aceceptResult;
		}
		
		@RequestMapping(value = "/refuseFriendByAjax")
		public @ResponseBody String refuseFriendByAjax(String friendId, String userId) {
			System.out.println("refuseFriendByAjax controller 실행 friendId / userId : " + friendId + " / " + userId);
			String refuesResult = msvc.refuseFriendByAjax(friendId, userId);
			return refuesResult;
		}
		
		 @RequestMapping(value="/moveUserInfoModifyForm")
		    public ModelAndView moveProfileModifyForm() {
		      String loginId = (String)session.getAttribute("loginId");
		      mav = msvc.getMemberInfo(loginId);
		      return mav;
		   }
		   
		   @RequestMapping(value="/userInfoModify")
		   public ModelAndView userInfoModify(MemberDto modifyMem) throws IllegalStateException, IOException {
		      System.out.println("수정된 정보 확인: "+modifyMem);
		      if(modifyMem.getMgender() == null) {
		         modifyMem.setMgender("");
		      }
		      
		      mav = msvc.modifyMember(modifyMem);
		      return mav;
		   }
		   
		   //
		   @RequestMapping(value = "/friendRequestBoolean")
		   public @ResponseBody int friendRequestBoolean(String loginId) {
		      System.out.println("friendRequestBoolean controller 실행");
		      int friendRequest = msvc.friendRequestList(loginId);
		      System.out.println("friendRequest : " + friendRequest);
		      return friendRequest;
		   }
		   
		   @RequestMapping(value = "/friendRequestList")
		   public @ResponseBody ArrayList<MemberDto> friendRequestList(String loginId){
		      System.out.println("friendRequestList controller 실행");
		      ArrayList<MemberDto> friendRequestList = msvc.getFriendRequestList(loginId);
		      return friendRequestList;
		   }
}
