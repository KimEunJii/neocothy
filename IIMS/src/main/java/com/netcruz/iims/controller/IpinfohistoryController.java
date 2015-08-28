package com.netcruz.iims.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netcruz.iims.service.IpinfohistoryService;
import com.netcruz.iims.vo.IpinfohistoryVo;


@Controller("ipinfohistoryController")
@RequestMapping("/ipinfohistory")
public class IpinfohistoryController {
	
	@Autowired
	IpinfohistoryService ipinfohistoryService;
	
	
	@RequestMapping("/insert.do")
	public String insert(IpinfohistoryVo vo){
		
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date today = new Date(); 
		String dTime = formatter.format ( today );
		vo.setMody_date(dTime);
		
		ipinfohistoryService.registerIpinfohistory(vo);		
		System.out.println("insert controller");
		
		
		
		return "redirect:/ipinfohistory/list.do";
	}	
	
	@RequestMapping("/get.do")
	public String get(int id){
		ipinfohistoryService.selectIpinfohistory(id);
		return "";
	}
	
	
	@RequestMapping("/list.do")
	public String list(){
	
		return "tem.jsp?nextPage=ipinfo_history";
		
	}
	
	@RequestMapping("/ipinfohistorytest.do")
	public @ResponseBody JSONArray ipinfohistoryTest(){
		JSONArray ja = JSONArray.fromObject(ipinfohistoryService.ipinfohistoryList());
		return ja;
	}
	
	@RequestMapping("/delete.do")
	public String deleteWork(int id){
		ipinfohistoryService.delete(id);
		return "redirect:/ipinfohistory/list.do";
	}
	
	@RequestMapping("/update.do")
	public String update(IpinfohistoryVo vo){

		

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
		ipinfohistoryService.update(vo);

		return "redirect:/ipinfohistory/list.do";
	}
}
