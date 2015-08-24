package com.netcruz.iims.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		return "login";
	}
	
	@RequestMapping("/login.do")
	public String getUser(String user_id, String pw, HttpSession session){

		UserVo userVo = userService.getUser(user_id,pw);
		System.out.println(userVo);
		session.setAttribute("userFlag", userVo);
		return "redirect:/user/main.do";		
	}
	
	@RequestMapping("/main.do")
	public String main(HttpSession session){
	   
	    	
	    	UserVo vo = (UserVo) session.getAttribute("userFlag");
	        System.out.println(vo);
	    	if(vo != null){
	    		String user_id = vo.getId();
	    		UserVo user = userService.getOne(user_id);
	    		
	    		session.setAttribute("userFlag", user);
	    		return "redirect:/address/list.do";
	    	}
	    	else
	    	
	    		return "AlertPage";  		    		
	}
	
	 @RequestMapping(value = "/logout.do")
	 public String logout(HttpSession session){
	    	
	       session.removeAttribute("userFlag");	        
	       return "redirect:/user/loginForm.do";
	 }
	
	
	@RequestMapping("/tem.do")
	public String tem(){
		return "tem";
	}
	

}
