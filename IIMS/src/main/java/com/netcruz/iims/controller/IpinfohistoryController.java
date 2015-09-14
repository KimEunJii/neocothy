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
import com.netcruz.iims.service.IpinfohistoryService;
import com.netcruz.iims.vo.IpinfoVo;
import com.netcruz.iims.vo.IpinfohistoryVo;
import com.netcruz.iims.vo.UserVo;


@Controller("ipinfohistoryController")
@RequestMapping("/ipinfohistory")
public class IpinfohistoryController {
	
	@Autowired
	IpinfohistoryService ipinfohistoryService;
	
	@Autowired
	IpinfoService ipinfoService;
	
	@RequestMapping("/insert.do")
	public String insert(IpinfohistoryVo vo){
		
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date today = new Date(); 
		String dTime = formatter.format ( today );
		vo.setMody_date(dTime);
		
		ipinfohistoryService.registerIpinfohistory(vo);				
				
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
	public String update(IpinfohistoryVo vo,HttpSession session, IpinfoVo vo2, int id){

		
		try{
			vo.setCategory(new String(vo.getCategory().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setNetwork(new String(vo.getNetwork().getBytes("ISO-8859-1"),"euc-kr"));
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
			vo.setNote(new String(vo.getNote().getBytes("ISO-8859-1"),"euc-kr"));
			vo.setUser_id(new String(vo.getUser_id().getBytes("ISO-8859-1"),"euc-kr"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}			
	
		//ipinfohistory 사용시 ipinfo insert DB
		if("사용".equals(vo.getUsed())){
			vo2.setId(vo.getId());
			vo2.setCategory(vo.getCategory());
			vo2.setNetwork(vo.getNetwork());
			vo2.setIp(vo.getIp());
			vo2.setMask(vo.getMask());
			vo2.setUsages(vo.getUsages());
			vo2.setEquipment(vo.getEquipment());
			vo2.setModel(vo.getModel());
			vo2.setUsed(vo.getUsed());
			vo2.setOs(vo.getOs());
			vo2.setUse_dept(vo.getUse_dept());
			vo2.setUser(vo.getUser());
			vo2.setUse_term(vo.getUse_term());
			vo2.setPer_date(vo.getPer_date());
			vo2.setMody_date(vo.getMody_date());
			vo2.setNote(vo.getNote());
			vo2.setUser_id(vo.getUser_id());
		
		

			ipinfoService.registerIpinfo(vo2);			
			ipinfohistoryService.delete(id);
		
		}

		UserVo userFlag = (UserVo)session.getAttribute("userFlag");
		
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date today = new Date(); 
		String updateDate = formatter.format ( today );
		String note = vo.getNote();

		String[] result = note.split("수정자");
		String str1 = result[0] + "\n" + "수정자: " + userFlag.getName() + "\n" + "수정 일자: " + updateDate; 
	
		vo.setNote(str1);

		ipinfohistoryService.update(vo);


		return "redirect:/ipinfohistory/list.do";
	}
}
