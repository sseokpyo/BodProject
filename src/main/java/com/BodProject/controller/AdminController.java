package com.BodProject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dto.ReportDto;
import com.BodProject.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService asvc;
	
	@Autowired
	private HttpSession session;
	
	ModelAndView mav = new ModelAndView();

	@RequestMapping(value="/moveAdminHome")
	public ModelAndView moveAdminHome() {
		System.out.println("moveAdminHome controller 실행");
		mav = asvc.moveAdminHome();
		return mav;
	}
	
	@RequestMapping(value="/deleteMember")
	public ModelAndView deleteMember (@RequestParam("mid") String mid) {
		System.out.println("deleteMember controller 실행");
		System.out.println("mid : " + mid);
		String loginId = (String)session.getAttribute("loginId");
		mav = asvc.deleteMember(mid, loginId);
		return mav;
	}
	
	@RequestMapping(value="/memberView")
	public ModelAndView memberView (@RequestParam("mid") String mid) {
		System.out.println("memberView controller 실행");
		mav = asvc.memberView(mid);
		return mav;
	}
	
	@RequestMapping(value = "/moveAdminBoardDelete")
	public ModelAndView moveAdminBoardDelete() {
		System.out.println("moveAdminBoardDelete controller 실행");
		mav = asvc.moveAdminBoardDelete();
		return mav;
	}
	
	@RequestMapping(value = "/deleteBoard")
	public ModelAndView deleteBoard(String bcode) {
		System.out.println("deleteBoard controller 실행 bcdoe : " + bcode);
		mav = asvc.deleteBoard(bcode);
		return mav;
	}
	
	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(String bcode) {
		System.out.println("boardView controller 실행 bcode : " + bcode);
		mav = asvc.boardView(bcode);
		return mav;
	}
	
	@RequestMapping(value = "/moveAdminGroupDelete")
	public ModelAndView moveAdminGroupDelete () {
		System.out.println("moveAdminGroupDelete controller 실행");
		mav = asvc.moveAdminGroupDelete();
		return mav;
	}
	
	@RequestMapping(value = "/deleteGroupByAdmin")
	public ModelAndView deleteGroupByAdmin(String gcode) {
		System.out.println("deleteGroupByAdmin Controller 실행");
		mav = asvc.deleteGroup(gcode);
		return mav;
	}
	
	//신고 목록
    @RequestMapping(value="/moveAdminReport")
    public ModelAndView moveAdminReport() {
       mav = asvc.getReportList();
       return mav;
    }
    
    //신고 요청
    @RequestMapping(value="/report")
    public @ResponseBody String report(ReportDto reportdto) {
       System.out.println("신고처리"+reportdto);
       String result = asvc.report(reportdto);
       return result;
    }   
	
}
