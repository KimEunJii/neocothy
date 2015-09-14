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



import org.springframework.web.servlet.ModelAndView;

import com.netcruz.iims.service.ManagementService;
import com.netcruz.iims.vo.ManagementVo;
import com.netcruz.iims.vo.UserVo;


@Controller("managementController")
@RequestMapping("/management")
public class ManagementController {
	@Autowired
	ManagementService managementService;
	
	
	@RequestMapping("/work_list.do")
	public String work_list(String category){
			
			return "tem.jsp?nextPage=work_managementlist";		
	}
	
	@RequestMapping("/error_list.do")
	public String error_list(String category){
		
			return "tem.jsp?nextPage=error_managementlist";		
	}
	
	
	@RequestMapping("/daily_list.do")
	public String daily_list(String category){
		
			return "tem.jsp?nextPage=daily_managementlist";		
	}
	
	@RequestMapping("/maintain_list.do")
	public String maintainance_list(String category){
		
			return "tem.jsp?nextPage=maintain_managementlist";		
	}
	
	
	@RequestMapping("/getWorkManagement.do")
	public @ResponseBody JSONArray getWorkManagement(){
		
		JSONArray ja = JSONArray.fromObject(managementService.work_managementList());
		
		return ja;
	}
	
	@RequestMapping("/getErrorManagement.do")
	public @ResponseBody JSONArray getErrorManagement(){
		
		JSONArray ja = JSONArray.fromObject(managementService.error_managementList());
		return ja;
	}
	
	@RequestMapping("/getDailyManagement.do")
	public @ResponseBody JSONArray getDailyManagement(){
		
		JSONArray ja = JSONArray.fromObject(managementService.daily_managementList());
		return ja;
	}
	
	@RequestMapping("/getMaintainManagement.do")
	public @ResponseBody JSONArray getMaintainManagement(){
		
		JSONArray ja = JSONArray.fromObject(managementService.maintain_managementList());
		return ja;
	}
	
	@RequestMapping("/insert.do")
	public ModelAndView insertWork(ManagementVo vo){		
		ModelAndView mav = new ModelAndView();
		mav.addObject(managementService.insert(vo));
		
		if("work".equals(vo.getCategory())){
			 mav.setViewName("redirect:/management/work_list.do");
		}else if("error".equals(vo.getCategory())){
			 mav.setViewName("redirect:/management/error_list.do");
		}else if("daily".equals(vo.getCategory())){
			 mav.setViewName("redirect:/management/daily_list.do");
		}else
			 mav.setViewName("redirect:/management/maintain_list.do");
		
		return mav;
	}
	
	
	@RequestMapping("/delete.do")
	public String deleteManagement(ManagementVo vo){
		managementService.delete(vo.getId());
		if("work".equals(vo.getCategory())){
			return "redirect:/management/work_list.do";
		}else if("error".equals(vo.getCategory())){
			return "redirect:/management/error_list.do";
		}else if("daily".equals(vo.getCategory())){
			return "redirect:/management/daily_list.do";
		}else
			return "redirect:/management/maintain_list.do";
	}
	
	@RequestMapping("/update.do")
	public String updateManagement(ManagementVo vo,HttpSession session){
		
		try{
			if(vo.getCategory() != null){
				vo.setCategory(new String(vo.getCategory().getBytes("ISO-8859-1"), "euc-kr"));
			}
			if(vo.getCompany() != null){
				vo.setCompany(new String(vo.getCompany().getBytes("ISO-8859-1"), "euc-kr"));
			}
			if(vo.getContents() != null){
				vo.setContents(new String(vo.getContents().getBytes("ISO-8859-1"), "euc-kr"));
			}
			if(vo.getDate() != null){
				vo.setDate(new String(vo.getDate().getBytes("ISO-8859-1"), "euc-kr"));
			}
			if(vo.getEquipment() != null){
				vo.setEquipment(new String(vo.getEquipment().getBytes("ISO-8859-1"), "euc-kr"));
			}
			if(vo.getPeriod_type() != null){
				vo.setPeriod_type(new String(vo.getPeriod_type().getBytes("ISO-8859-1"), "euc-kr"));
			}
			if(vo.getTitle() != null){
				vo.setTitle(new String(vo.getTitle().getBytes("ISO-8859-1"), "euc-kr"));
			}
			if(vo.getNote() != null){
				UserVo userFlag = (UserVo)session.getAttribute("userFlag");
				SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
				Date today = new Date(); 
				String updateDate = formatter.format ( today );
				String note = new String(vo.getNote().getBytes("ISO-8859-1"), "euc-kr");

				String[] result = note.split("수정자");
				String str1 = result[0] + "\n" + "수정자: " + userFlag.getName() + "\n" + "수정 일자: " + updateDate; 
				
				vo.setNote(str1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		managementService.update(vo);
	
		
		if("work".equals(vo.getCategory())){
			return "redirect:/management/work_list.do";
		}else if("error".equals(vo.getCategory())){
			return "redirect:/management/error_list.do";
		}else if("daily".equals(vo.getCategory())){
			return "redirect:/management/daily_list.do";
		}else
			return "redirect:/management/maintain_list.do";
	}
	

}