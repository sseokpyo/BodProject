package com.BodProject.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dto.GBoardDto;
import com.BodProject.dto.GroupPageDto;
import com.BodProject.dto.MemberDto;
import com.BodProject.dto.TimeLineDto;
import com.BodProject.service.GroupService;
import com.google.gson.Gson;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService gsvc;
	
	@Autowired
	private HttpSession session;
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value="/moveGroupSearch")
	public ModelAndView moveGroupList(){
		
		mav = gsvc.getGroupList();
		 
		return mav;
	}
	
	//그룹 생성폼 이동
	@RequestMapping(value="/moveGroupCreateForm")
	public String moveGroupCreateForm(){
		return "group/GroupCreateForm";
	}
	
	//그룹명 중복처리
	@RequestMapping(value="/checkGname")
	   public @ResponseBody String checkGname(String inputGname){
	      String checkGname = gsvc.checkGroupName(inputGname);
	      Gson gson = new Gson();
	      String json_checkGname = gson.toJson(checkGname);
	      
	      return json_checkGname;
	   }
	
	//그룹 생성
	@RequestMapping(value="/groupCreate")
	public ModelAndView groupCreate(GroupPageDto newGroup) throws IllegalStateException, IOException{
		
		mav = gsvc.groupCreate(newGroup);
		
		return mav;
	}
	
	//검색한 그룹 리스트
	@RequestMapping(value="/searchGroup")
	public @ResponseBody String searchGroup(String searchWord){
		System.out.println(searchWord);
		ArrayList<GroupPageDto> groupList = gsvc.getSearchGroupList(searchWord);
		
		Gson gson = new Gson();
		String json_groupList = gson.toJson(groupList);
	
		return json_groupList;
	}
	
	//그룹 가입
	@RequestMapping(value="/joinGroup")
	public ModelAndView joinGroup(String gcode, String userId){
		mav = gsvc.joinGroup(gcode,userId);
		return mav;
	}
	
	//그룹 탈퇴
	@RequestMapping(value="/signOutGroup")
	public ModelAndView signOutGroup(String gcode, String userId) {
		mav = gsvc.signOutGroup(gcode,userId);
		return mav;
	}
	
	//그룹 프로필 이동
	@RequestMapping(value="/moveGroupPage")
	public ModelAndView moveGroupPage(@RequestParam ("gcode") String gcode){
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(gcode+":"+loginId);
		mav = gsvc.getGroupPage(gcode, loginId);
		return mav;
	}
	
	//그룹 회원 목록 출력
	@RequestMapping(value="/getGroupMemList")
	public @ResponseBody String getGroupMemList(String gcode, String loginId){
		System.out.println("친구목록 요청: "+gcode);
		ArrayList<MemberDto> groupMemList = gsvc.getGroupMemList(gcode,loginId);
		
		Gson gson = new Gson();
		String json_groupMemList = gson.toJson(groupMemList);
	
		return json_groupMemList;
	}

	//내 그룹 목록 출력
	@RequestMapping(value="/moveMyGroupList")
	public ModelAndView moveMyGroupList(String loginId) {
		System.out.println("내그룹목록 id: "+loginId);
		mav = gsvc.getMyGroupList(loginId);
		
		return mav;
	}
	
	
	//그룹 삭제
	@RequestMapping(value="/deleteGroup")
	public ModelAndView deleteGroup(String gcode) {
		mav = gsvc.deleteGroup(gcode);
		
		return mav;
	}
	
	//그룹 관리자 양도
	@RequestMapping(value="/giveGroupManager")
	public String giveGroupManager(String gcode, String userId,String loginId){
		int giveGroupManager = gsvc.giveGroupManager(gcode,userId);
		return "redirect:/moveGroupPage?gcode="+gcode+"&loginId="+loginId;
	}
	
	//그룹 회원 강제 탈퇴
	@RequestMapping(value="/signOutGroupUser")
	public @ResponseBody int signOutGroupUser(String gcode, String userId) {
		int signOutUser = gsvc.signOutUser(gcode,userId);
		return signOutUser;
	}
	
	//그룹 수정 이동
	@RequestMapping(value="/moveGroupProfileModifyForm")
	public ModelAndView moveGroupProfileModifyForm(String gcode){
		mav = gsvc.getGroupProfile(gcode);
		return mav;
	}
	
	//그룹 수정 작업
	@RequestMapping(value="/groupProfileModify")
	public ModelAndView groupProfileModify(GroupPageDto modifyGroup) throws IllegalStateException, IOException{
		
		mav = gsvc.modifyGroup(modifyGroup);
		return mav;
	}
}
