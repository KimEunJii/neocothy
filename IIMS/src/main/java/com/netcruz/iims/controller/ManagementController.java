package com.netcruz.iims.controller;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



import org.springframework.web.servlet.ModelAndView;

import com.netcruz.iims.service.ManagementService;
import com.netcruz.iims.vo.ManagementVo;


@Controller("managementController")
@RequestMapping("/management")
public class ManagementController {
	@Autowired
	ManagementService managementService;
	
	@RequestMapping("/insert.do")
	public String insert(int no, String category, String date, String equipment, String title,
			String contents, String note, String period_type, String company, String user_id){		

		
		return "redirect:/address/list.do";
	}
	
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
	
	@RequestMapping("/insertWork.do")
	public String insertWork(String category,String date, String equipment,String title, 
			String contents, String note,String user_id){		
		
		managementService.insertManagement(category, date, equipment, title, contents, note, user_id);
		return "redirect:/management/work_list.do";
	}
	
//	@RequestMapping("/getDetail.do")
//	public @ResponseBody String getDetail(int id){
//		JSONObject json = new JSONObject();
//		json.put("getDetail", managementService.getDetail(id));	
//		return json.toString();
//		
//	}
	
	@RequestMapping("/delete.do")
	public String deleteWork(int id){
		managementService.delete(id);
		return "redirect:/management/work_list.do";
	}
	
	@RequestMapping("/updateWork.do")
	public String updateWork(int id, String date, String equipment, String title, String contents, String note){
		ManagementVo vo = new ManagementVo();
		vo.setId(id);
		vo.setDate(date);
		vo.setEquipment(equipment);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setNote(note);
		managementService.work_update(vo);
		return "redirect:/management/work_list.do";
	}
	

}