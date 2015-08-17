package com.netcruz.iims.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netcruz.iims.service.IpinfoService;
import com.netcruz.iims.vo.IpinfoVo;


@Controller("ipinfoController")
@RequestMapping("/ipinfo")
public class IpinfoController {
	
	@Autowired
	IpinfoService ipinfoService;
	
	
	@RequestMapping("/insert.do")
	public String insert(IpinfoVo vo){
		ipinfoService.registerIpinfo(vo);		
		
		System.out.println("insert controller");		
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
	public String updateIpinfo(IpinfoVo vo){
		try {
			vo.setCategory(new String(vo.getCategory().getBytes("ISO-8859-1"), "euc-kr"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ipinfoService.update(vo);

		return "redirect:/ipinfo/list.do";
	}
}
