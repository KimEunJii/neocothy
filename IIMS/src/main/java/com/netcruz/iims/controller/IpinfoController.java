package com.netcruz.iims.controller;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netcruz.iims.service.BlockIpService;
import com.netcruz.iims.service.IpinfoService;
import com.netcruz.iims.service.IpinfohistoryService;
import com.netcruz.iims.service.UserIpService;
import com.netcruz.iims.vo.IpinfoVo;
import com.netcruz.iims.vo.IpinfohistoryVo;
import com.netcruz.iims.vo.UserVo;

@Controller("ipinfoController")
@RequestMapping("/ipinfo")
public class IpinfoController {

	// 로그인한 내 PC IP
	public static String hostAddress = "";
	public static String hostName="";
	
	@Autowired
	IpinfoService ipinfoService;
	
	@Autowired
	UserIpService userIpService;
	
	@Autowired
	IpinfohistoryService ipinfohistoryService;
	
	@Autowired	// 차단목록
	BlockIpService blockIpService;

	@RequestMapping("/insert.do")
	public String insert(IpinfoVo vo, HttpSession session, IpinfohistoryVo vo2) {
		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date today = new Date();
		String dTime = formatter.format(today);
		vo.setMody_date(dTime);

		UserVo userFlag = (UserVo) session.getAttribute("userFlag");
		vo.setUser_id(userFlag.getId());
		vo2.setUser_id(userFlag.getId());
		// ipinfo "미사용" ipinfohistory insert db
		if ("미사용".equals(vo.getUsed())) {
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

		
			ipinfohistoryService.registerIpinfohistory(vo2);
		}

		ipinfoService.registerIpinfo(vo);

		return "redirect:/ipinfo/list.do";
	}

	@RequestMapping("/list.do")
	public String list(Model model) {
		List<IpinfoVo> list = ipinfoService.ipinfoList();
		model.addAttribute("LIST", list);

		return "tem.jsp?nextPage=ipinfolist";
	}

	@RequestMapping("/ipinfotest.do")
	public @ResponseBody JSONArray ipinfoTest() {
		JSONArray ja = JSONArray.fromObject(ipinfoService.ipinfoList());
		return ja;
	}

	@RequestMapping("/delete.do")
	public String deleteWork(int id) {
		ipinfoService.delete(id);
		return "redirect:/ipinfo/list.do";
	}

	@RequestMapping("/update.do")
	public String updateIpinfo(IpinfoVo vo, HttpSession session,
			IpinfohistoryVo vo2) {
		try {
			vo.setCategory(new String(vo.getCategory().getBytes("ISO-8859-1"),
					"euc-kr"));
			vo.setNetwork(new String(vo.getNetwork().getBytes("ISO-8859-1"),
					"euc-kr"));
			vo.setIp(new String(vo.getIp().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setMask(vo.getMask());
			vo.setUsages(new String(vo.getUsages().getBytes("ISO-8859-1"),
					"euc-kr"));
			vo.setEquipment(new String(
					vo.getEquipment().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setModel(new String(vo.getModel().getBytes("ISO-8859-1"),
					"euc-kr"));
			vo.setUsed(new String(vo.getUsed().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setOs(new String(vo.getOs().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setUse_dept(new String(vo.getUse_dept().getBytes("ISO-8859-1"),
					"euc-kr"));
			vo.setUser(new String(vo.getUser().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setUse_term(new String(vo.getUse_term().getBytes("ISO-8859-1"),
					"euc-kr"));
			vo.setPer_date(new String(vo.getPer_date().getBytes("ISO-8859-1"),
					"euc-kr"));
			vo.setMody_date(new String(
					vo.getMody_date().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setNote(new String(vo.getNote().getBytes("ISO-8859-1"), "euc-kr"));
			vo.setUser_id(new String(vo.getUser_id().getBytes("ISO-8859-1"),
					"euc-kr"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// ipinfo 미사용시 ipinfohistory insert db
		if ("미사용".equals(vo.getUsed())) {
			try {
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
			
				ipinfohistoryService.registerIpinfohistory(vo2);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	
		UserVo userFlag = (UserVo) session.getAttribute("userFlag");

		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date today = new Date();
		String updateDate = formatter.format(today);
		String note = vo.getNote();

		String[] result = note.split("수정자");
		String str1 = result[0] + "\n" + "수정자: " + userFlag.getName() + "\n"
				+ "수정 일자: " + updateDate;

		vo.setNote(str1);

		ipinfoService.update(vo);

		return "redirect:/ipinfo/list.do";
	}

	@RequestMapping("/expiredlist.do")
	public String expiredList(HttpSession session) {

		
		UserVo userFlag = (UserVo) session.getAttribute("userFlag");
	
		//UserIpVo userIpVo = (UserIpVo)session.getAttribute("userIp");
		//System.out.println("hostIp:"+userIpVo.getHost_ip());
		String hostAddress = (String)session.getAttribute("hostAddress");
		//System.out.println(hostAddress);
		String myIp = null;
		InetAddress ipAddress = null;
		try {
			ipAddress = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(hostAddress.equals("0:0:0:0:0:0:0:1")){
			myIp = ipAddress.getHostAddress(); 
		}else{
			myIp = hostAddress;
		}
		
		
		if (blockIpService.blockIp(myIp) == null) {
			if (userFlag != null) {
				IpinfoVo vo = new IpinfoVo();
				vo.setUser_id(userFlag.getId());
				return "tem.jsp?nextPage=main";
			} else
				return "AlertPage";
		}else
			return "AlertBlock";
	}

	@RequestMapping("/expiredipinfotest.do")
	public @ResponseBody JSONArray expiredIpinfoTest(HttpSession session) {
		System.out.println("/expiredipinfotest.do");

		UserVo userFlag = (UserVo) session.getAttribute("userFlag");
	
		IpinfoVo vo = new IpinfoVo();
		vo.setUser_id(userFlag.getId());
	

		JSONArray ja = JSONArray.fromObject(ipinfoService.expiredIpinfoList(vo));
	
		return ja;
	}
	
	public static void setUserIp(String strAddr, String strName){
		hostAddress = strAddr;
		hostName = strName;
	}

}
