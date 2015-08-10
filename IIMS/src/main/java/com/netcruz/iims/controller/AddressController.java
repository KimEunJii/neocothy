package com.netcruz.iims.controller;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netcruz.iims.service.AddressService;
import com.netcruz.iims.vo.AddressVo;

@Controller("adressController")
@RequestMapping("/address")
public class AddressController {
	@Autowired
	AddressService addressService;
	
	@RequestMapping("/insert.do")
	public String insert(int no, String category, String partner, String pm, String pm_phone,
			String pm_email, String task, String equipment, String engineer, String engineer_phone,
			String engineer_email, String test_date, String test_type, String manager,
			String note, String user_id){
		
		System.out.println("resistor controller");
		
		return "redirect:/address/list.do";
	}
	
	@RequestMapping("/list.do")
	public String list(Model model){

		return "tem.jsp?nextPage=addresslist";
	}
	
	@RequestMapping("/addresstest.do")
	public @ResponseBody JSONArray addressTest(){
		JSONArray ja = JSONArray.fromObject(addressService.addressList());
		return ja;
	}
}