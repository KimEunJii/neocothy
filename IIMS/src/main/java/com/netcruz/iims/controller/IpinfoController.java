package com.netcruz.iims.controller;


import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netcruz.iims.service.IpinfoService;
import com.netcruz.iims.vo.IpinfoVo;
import com.netcruz.iims.vo.UserVo;


@Controller("ipinfoController")
@RequestMapping("/ipinfo")
public class IpinfoController {
	
	@Autowired
	IpinfoService ipinfoService;
	
	
	@RequestMapping("/insert.do")
	public String insert(IpinfoVo vo,HttpSession session){
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date today = new Date(); 
		String dTime = formatter.format ( today );
		vo.setMody_date(dTime);
		
		UserVo userFlag = (UserVo)session.getAttribute("userFlag");
		vo.setUser_id(userFlag.getId());
		ipinfoService.registerIpinfo(vo);		
		
		return "redirect:/ipinfo/list.do";
	}	
	
	@RequestMapping("/list.do")
	public String list(Model model){
		List<IpinfoVo> list = ipinfoService.ipinfoList();
		model.addAttribute("LIST", list);
		
		return "tem.jsp?nextPage=ipinfolist";
	}
	
	@RequestMapping("/ipinfotest.do")
	public @ResponseBody JSONArray ipinfoTest(){
		JSONArray ja = JSONArray.fromObject(ipinfoService.ipinfoList());
		return ja;
	}
	@RequestMapping("/delete.do")
	public String deleteWork(int id){
		ipinfoService.delete(id);
		return "redirect:/ipinfo/list.do";
	}
	
	@RequestMapping("/update.do")
	public String updateIpinfo(IpinfoVo vo,HttpSession session){
		try {
			vo.setCategory(new String(vo.getCategory().getBytes("ISO-8859-1"), "euc-kr"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		UserVo userFlag = (UserVo)session.getAttribute("userFlag");
		vo.setNote("수정자: "+userFlag.getName());
		ipinfoService.update(vo);

		return "redirect:/ipinfo/list.do";
	}
}