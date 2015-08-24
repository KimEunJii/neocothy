package com.netcruz.iims.controller;




import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		
		String str = vo.getNote();
		String str1 = str + "\n" + dTime;
		vo.setNote(str1);
		
	
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
	public String update(IpinfoVo vo,HttpSession session){

		

		try{
			vo.setCategory(new String(vo.getCategory().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setNetwork(new String(vo.getCategory().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setIp(new String(vo.getIp().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setMask(vo.getMask());
			vo.setUsages(new String(vo.getUsages().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setEquipment(new String(vo.getEquipment().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setModel(new String(vo.getModel().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setUsed(new String(vo.getUsed().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setOs(new String(vo.getOs().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setUse_dept(new String(vo.getUse_dept().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setUser(new String(vo.getUser().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setUse_term(new String(vo.getUse_term().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setPer_date(new String(vo.getPer_date().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setMody_date(new String(vo.getMody_date().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setNote(new String(vo.getNote().getBytes("8859_1"),"euc-kr"));
			vo.setUser_id(new String(vo.getUser_id().getBytes("ISO-8859-1"),"euc-kr"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}			
	
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date today = new Date(); 
		String dTime = formatter.format ( today );
		vo.setMody_date(dTime);
		
		String str = vo.getNote();
		
		String[] result = str.split("\n");
		
		String str1 = result[0] + "\n" + dTime;
		
		vo.setNote(str1);
		
	
		ipinfoService.update(vo);
		System.out.println("update.do controller");		
		System.out.println("vo : " +vo);
		

		return "redirect:/ipinfo/list.do";
	}
}
