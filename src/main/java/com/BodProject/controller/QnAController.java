package com.BodProject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dto.QnADto;
import com.BodProject.service.QnAService;
import com.google.gson.Gson;

@Controller
public class QnAController {
	QnADto qdto;
	ModelAndView mav;
	@Autowired
	private QnAService qsvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/moveQnAWriteForm")
	public String moveQnAWriteForm(){
		return "qna/QnAWriteForm";
	}
	
	@RequestMapping(value="/question")
	public ModelAndView question(QnADto qdto) {
		String loginId = (String) session.getAttribute("loginId");
		qdto.setQamid(loginId);
		mav= qsvc.question(qdto);
		System.out.println(qdto);
		return mav;
	}
	
	@RequestMapping(value="/moveQnAList")
	public ModelAndView moveQnAList(){
		mav = qsvc.getQnAList();
		return mav;
	}
	
	@RequestMapping(value="/moveQnAInfo")
	public ModelAndView moveQnAInfo(@RequestParam("qacode") String qacode){
		mav = qsvc.getQnAInfo(qacode);
		return mav;
	}
	
	@RequestMapping(value="/answer")
	public ModelAndView answer(QnADto qdto) {
		mav = qsvc.answer(qdto);
		return mav;
	}
	
	@RequestMapping(value="/showAnswer")
	public @ResponseBody String showAnswer(@RequestParam("qacode") String qacode) {
		String qnaanswer = qsvc.showAnswer(qacode);
		Gson gson = new Gson();
		String json_qaa = gson.toJson(qnaanswer);
		return json_qaa;
	}
	
	@RequestMapping(value="/qnaModify")
	public ModelAndView qnaModify(QnADto qdto) {
		mav = qsvc.qnaModify(qdto);
		return mav;
	}
	
	@RequestMapping(value="/qnaDelete")
	public ModelAndView qnaDelete(String qacode) {
		mav = qsvc.qnaDelete(qacode);
		return mav;
	}
}
