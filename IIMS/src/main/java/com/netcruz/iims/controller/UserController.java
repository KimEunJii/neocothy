package com.netcruz.iims.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.netcruz.iims.service.UserIpService;
import com.netcruz.iims.service.UserService;
import com.netcruz.iims.vo.UserIpVo;
import com.netcruz.iims.vo.UserVo;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	UserIpService userIpService;
	
	@RequestMapping("/loginForm.do")
	public String loginForm(){

		return "login";
	}
	
	@RequestMapping("/login.do")
	public String getUser(String user_id, String pw, HttpSession session,Model model) throws UnknownHostException{

		UserVo userVo = userService.getUser(user_id,pw);
	
		session.setAttribute("userFlag", userVo);

		String hostAddress = (String)session.getAttribute("hostAddress");
		String hostName = (String)session.getAttribute("hostName");

		String myIp = null;
		InetAddress ipAddress = null;
		try {
			ipAddress = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(hostAddress.equals("0:0:0:0:0:0:0:1")){
			myIp = ipAddress.getHostAddress(); 
		}else{
			myIp = hostAddress;
		}
		
		IpinfoController.setUserIp(myIp, hostName);
     	
    	userIpService.insertUserIp(myIp,hostName,user_id);
    	
    
		return "redirect:/ipinfo/expiredlist.do";		
	}
	/*
	@RequestMapping("/main.do")
	public String main(HttpSession session){
	   
	    	
	    	UserVo vo = (UserVo) session.getAttribute("userFlag");
	        System.out.println(vo);
	    	if(vo != null){
	    		String user_id = vo.getId();
	    		UserVo user = userService.getOne(user_id);
	    		
	    		session.setAttribute("userFlag", user);
	    		return "tem.jsp?nextPage=main";
	    	}
	    	else	    	
	    		return "AlertPage";  		    		
	}
	*/
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
