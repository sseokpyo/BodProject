package com.BodProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	 @RequestMapping("/moveChat")
		public ModelAndView moveChat() {
			ModelAndView mav = new ModelAndView();
			System.out.println("chat controller 실행");
			mav.setViewName("include/chat");
			return mav;
		}

}
