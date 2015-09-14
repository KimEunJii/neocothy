package com.netcruz.iims.controller;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netcruz.iims.service.AddressService;
import com.netcruz.iims.vo.AddressVo;
import com.netcruz.iims.vo.UserVo;

@Controller("adressController")
@RequestMapping("/address")
public class AddressController {
	@Autowired
	AddressService addressService;
	
	@RequestMapping("/insert.do")
	public String insert(AddressVo	vo){
		addressService.registerAddress(vo);

		return "redirect:/address/list.do";
	}
	
	@RequestMapping("/get.do")
	public String get(int id){
		addressService.selectAddress(id);
		return "";
	}
	
	@RequestMapping("/list.do")
	public String list(){
		
//		try{
//			System.out.println(InetAddress.getLocalHost().getHostAddress());
//		}catch(Exception e){
//			e.printStackTrace();
//		}
		
		
		return "tem.jsp?nextPage=addresslist";
	}
	
	@RequestMapping("/addresstest.do")
	public @ResponseBody JSONArray addressTest(){
		JSONArray ja = JSONArray.fromObject(addressService.addressList());
		return ja;
	}
	
	@RequestMapping("/delete.do")
	public String deleteWork(int id){
		addressService.delete(id);
		return "redirect:list.do";
	}
	
	@RequestMapping("/updateWork.do")
	public String update(AddressVo vo, HttpServletRequest request, HttpSession session){
		try {
			vo.setCategory(new String(vo.getCategory().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setPartner(new String(vo.getPartner().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setPm(new String(vo.getPm().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setPm_phone(new String(vo.getPm_phone().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setPm_email(new String(vo.getPm_email().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setTask(new String(vo.getTask().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setEquipment(new String(vo.getEquipment().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setEngineer(new String(vo.getEngineer().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setEngineer_phone(new String(vo.getEngineer_phone().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setEngineer_email(new String(vo.getEngineer_email().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setTest_date(new String(vo.getTest_date().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setTest_type(new String(vo.getTest_type().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setManager(new String(vo.getManager().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setNote(new String(vo.getNote().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setUser_id(new String(vo.getUser_id().getBytes("ISO-8859-1"), "euc-kr"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		UserVo userFlag = (UserVo)session.getAttribute("userFlag");
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyy/MM/dd/HH:mm:ss");
		String updateDate = dateFormat.format(calendar.getTime());

		String note = vo.getNote();
		String[] result = note.split("수정자");
		String str1 = result[0] + "\n" + "수정자: " + userFlag.getName() + "\n" + "수정 일자: " + updateDate; 
		
		vo.setNote(str1);
		
		addressService.update(vo);
		
		return "redirect:/address/list.do"; 
	}
}
