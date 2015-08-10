package com.netcruz.iims.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.netcruz.iims.service.UserService;
import com.netcruz.iims.vo.UserVo;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/loginForm.do")
	public String loginForm(){
		System.out.println("login");
		return "index";
	}
	
	@RequestMapping("/login.do")
	public String getUser(String user_id, String pw, HttpSession session){
	
		UserVo userVo = userService.getUser(user_id,pw);
		System.out.println("sss");
		session.setAttribute("userFlag", userVo);
			return "redirect:/board/list.do";		
	}
	
	@RequestMapping("/tem.do")
	public String tem(){
		return "tem";
	}
	

}
