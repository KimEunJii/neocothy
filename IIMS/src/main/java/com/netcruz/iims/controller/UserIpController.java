package com.netcruz.iims.controller;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netcruz.iims.service.BlockIpService;
import com.netcruz.iims.service.UserIpService;
import com.netcruz.iims.vo.UserIpVo;


@Controller("userIpController")
@RequestMapping("/userIp")
public class UserIpController {

	@Autowired
	UserIpService userIpService;
	
	@Autowired
	BlockIpService blockIpService;
	
	@RequestMapping("/getUserIpList.do")
	public @ResponseBody JSONArray userIpList(){
		JSONArray ja = JSONArray.fromObject(userIpService.userIpList());
		return ja;
	}
	
	@RequestMapping("/userIp.do")
	public String userIp(){
		return "tem.jsp?nextPage=useriplist";
	}
	
	@RequestMapping("/blockIp.do")
	public String blockIp(int id,HttpSession session){
		UserIpVo vo = userIpService.getUserIp(id);
		blockIpService.insert(vo.getHost_ip());
		return "redirect:/userIp/userIp.do";
	}
	
	@RequestMapping("/blockIpList.do")
	public String blockIp(){
		return "tem.jsp?nextPage=blockiplist";
	}
	
	@RequestMapping("/getBlockIpList.do")
	public @ResponseBody JSONArray blockIpList(){
		JSONArray ja = JSONArray.fromObject(blockIpService.list());
		return ja;
	}
	
	@RequestMapping("/deleteBlockIp.do")
	public String blockIp(String block_ip){
		blockIpService.delete(block_ip);
		return "redirect:/userIp/blockIpList.do";
	}
	
	
	
	

}
