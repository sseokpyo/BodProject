package com.BodProject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dao.QnADao;
import com.BodProject.dto.QnADto;

@Service
public class QnAService {
	QnADto qdto;
	@Autowired
	private QnADao qdao;
	
	public ModelAndView question(QnADto qdto) {
		ModelAndView mav = new ModelAndView();
		String maxQcode = qdao.getMaxCode();
		String qcode = "Q";
		if(maxQcode == null) {
			qcode += "00" + 1;
		}else {
			maxQcode = maxQcode.substring(1);
			int num = Integer.parseInt(maxQcode) +1;
			if(num < 10) {
				qcode += "00" + num;
			}else if(num < 100){
				qcode += "0" + num;
			}else if(num <1000) {
				qcode += num;
			}
		}
		qdto.setQacode(qcode);
		System.out.println(qdto);
		int insertResult = qdao.question(qdto);
		mav.setViewName("redirect:/moveQnAList");
		return mav;
	}

	public ModelAndView getQnAList() {
		ModelAndView mav = new ModelAndView();
		ArrayList<QnADto> qnaList = qdao.getQnAList();
		mav.addObject("qnaList", qnaList);	
		System.out.println("qnaList : " + qnaList);
		mav.setViewName("qna/QnAList");
		return mav;
	}

	public ModelAndView getQnAInfo(String qacode) {
		ModelAndView mav = new ModelAndView();
		qdto = qdao.getQnAInfo(qacode);
		mav.addObject("qdto", qdto);
		mav.setViewName("qna/QnAInfo");
		return mav;
	}

	public ModelAndView answer(QnADto qdto) {
		ModelAndView mav = new ModelAndView();
		int answerResult = qdao.answer(qdto);
		mav.setViewName("redirect:/moveQnAInfo?qacode="+qdto.getQacode());			
		return mav;
	}

	public String showAnswer(String qacode) {
		String qnaanswer = qdao.showAnswer(qacode);
		return qnaanswer;
	}

	public ModelAndView qnaDelete(String qacode) {
		ModelAndView mav = new ModelAndView();
		int deleteResult = qdao.qnaDelete(qacode);
		mav.setViewName("redirect:/moveQnAList");
		return mav;
	}

	public ModelAndView qnaModify(QnADto qdto) {
		ModelAndView mav = new ModelAndView();
		int updateResult = qdao.qnaModify(qdto);
		mav.setViewName("redirect:/moveQnAInfo?qacode="+qdto.getQacode());
		return mav;
	}

}
