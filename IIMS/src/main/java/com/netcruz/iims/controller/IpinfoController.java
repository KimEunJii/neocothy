package com.netcruz.iims.controller;




import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date today = new Date(); 
		String dTime = formatter.format ( today );
		vo.setMody_date(dTime);
		
		ipinfoService.registerIpinfo(vo);		
		System.out.println("insert controller");
		
		
		
		return "redirect:/ipinfo/list.do";
	}	
	
	@RequestMapping("/get.do")
	public String get(int id){
		ipinfoService.selectIpinfo(id);
		return "";
	}
	
	
	@RequestMapping("/list.do")
	public String list(){
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
	public String update(IpinfoVo vo){

		

//		try{
//			vo.setCategory(new String(vo.getCategory().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setNetwork(new String(vo.getCategory().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setIp(new String(vo.getIp().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setMask(vo.getMask());
//			vo.setUsages(new String(vo.getUsages().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setEquipment(new String(vo.getEquipment().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setModel(new String(vo.getModel().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setUsed(new String(vo.getUsed().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setOs(new String(vo.getOs().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setUse_dept(new String(vo.getUse_dept().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setUser(new String(vo.getUser().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setUse_term(new String(vo.getUse_term().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setPer_date(new String(vo.getPer_date().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setMody_date(new String(vo.getMody_date().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setNote(new String(vo.getNote().getBytes("ISO-8859-1"),"euc-kr"));
//			vo.setUser_id(new String(vo.getUser_id().getBytes("ISO-8859-1"),"euc-kr"));
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}			
//	
		
		
		System.out.println("update.do controller");		
		System.out.println("vo : " +vo);
		ipinfoService.update(vo);

		return "redirect:/ipinfo/list.do";
	}
}
