package com.netcruz.iims.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;









import org.springframework.web.servlet.ModelAndView;

import com.netcruz.iims.service.SecureBoardService;
import com.netcruz.iims.vo.SecureBoardVo;
import com.netcruz.iims.vo.UserVo;

@Controller("secureBoardController")
@RequestMapping("/secureBoard")
public class SecureBoardController {
	@Autowired
	@Qualifier("secureBoardService")
	SecureBoardService secureBoardService;

	public SecureBoardController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/secureboardlist.do")
	public String secureBoardList() throws Exception{
		System.out.println("/secureboardlist.do");
		return "tem.jsp?nextPage=secureboardlist";
	}
	
	
	@RequestMapping("/aftersecureboardlist.do")
	public @ResponseBody JSONArray afterSecureBoardList() throws Exception{
		JSONArray ja = JSONArray.fromObject(secureBoardService.getSecureBoardList());
		System.out.println("[debug]    json..." + ja);
		return ja;
	}
	
	@RequestMapping("/insertsecureboard.do")
	public String insertSecureBoard(SecureBoardVo secureBoardVo)  throws Exception {
		
		System.out.println("/insertboard.do");
		System.out.println("secureBoardVo : " + secureBoardVo);
		secureBoardService.insertSecureBoard(secureBoardVo);
		return "redirect:/secureBoard/secureboardlist.do";
	}
	/*
	@RequestMapping("/insertsecureboard.do")
	public ModelAndView insertSecureBoard(SecureBoardVo secureBoardVo)  throws Exception {
		System.out.println("/insertboard.do");
		System.out.println("secureBoardVo : " + secureBoardVo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(secureBoardService.insertSecureBoard(secureBoardVo));
		mav.setViewName("redirect:/secureBoard/secureboardlist.do");
		secureBoardService.insertSecureBoard(secureBoardVo);
		return mav;
	}*/
	@RequestMapping("/deletesecureboard.do")
	public String deleteSecureBoard(SecureBoardVo secureBoardVo) throws Exception{
		System.out.println("/deletesecureboard.do");
		System.out.println("secureBoardVo : " + secureBoardVo);
		secureBoardService.deleteSecureBoard(secureBoardVo.getId());
	
		return "redirect:/secureBoard/secureboardlist.do";
	}
	
	@RequestMapping("/updatesecureboard.do")
	public String updateSecureBoard(SecureBoardVo secureBoardVo,HttpSession session, HttpServletRequest request) throws Exception{
		
		try{
			secureBoardVo.setCategory(new String(secureBoardVo.getCategory().getBytes("ISO-8859-1"), "euc-kr"));
			secureBoardVo.setContents(new String(secureBoardVo.getContents().getBytes("ISO-8859-1"), "euc-kr"));
			secureBoardVo.setNote(new String(secureBoardVo.getNote().getBytes("ISO-8859-1"), "euc-kr"));
			secureBoardVo.setRegDate(new String(secureBoardVo.getRegDate().getBytes("ISO-8859-1"), "euc-kr"));
			secureBoardVo.setTitle(new String(secureBoardVo.getTitle().getBytes("ISO-8859-1"), "euc-kr"));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		System.out.println("/updatesecureboard.do");
		System.out.println("secureBoardVo : " + secureBoardVo);
		
		UserVo userFlag = (UserVo)session.getAttribute("userFlag");
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date today = new Date(); 
		String dTime = formatter.format ( today );
		String str = secureBoardVo.getNote();
		String[] result = str.split("수정자");
		String strNote = result[0];
		
		String str1 = strNote + "\n" + "수정자: " + userFlag.getName()+ "\n" + "수정 일자: " + dTime;
		secureBoardVo.setNote(str1);
		
		secureBoardService.updateSecureBoard(secureBoardVo);
		
		
		return "redirect:/secureBoard/secureboardlist.do"; 
	}
	/*
	public List<SecureBoardVo> secureBoardList2(Search search) throws Exception {
		
		return null;
		
	}*/
	/*
	@RequestMapping("/secureboardlist.do")
	public String secureBoardList( @ModelAttribute("search") Search search, Model model , HttpServletRequest request) throws Exception{
		System.out.println("/secureboardlist.do");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("search : " + search);
		System.out.println("pageSize : " + pageSize);
		Map<String , Object> map=secureBoardService.getSecureBoardList(search);
		System.out.println(map.get("list"));
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/views/tem.jsp?nextPage=secureboardlist";
	}
	
	@RequestMapping("/aftersecureboardlist.do")
	public @ResponseBody JSONArray afterSecureBoardList( @ModelAttribute("search") Search search, Model model , HttpServletRequest request) throws Exception{
		System.out.println("/aftersecureboardlist.do");
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("search : " + search);
		System.out.println("pageSize : " + pageSize);
		Map<String , Object> map=secureBoardService.getSecureBoardList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		JSONArray ja = JSONArray.fromObject(secureBoardService.getSecureBoardList(search));
		System.out.println("[debug]    json..." + ja);
		return ja;
	}
	*/
	

}
