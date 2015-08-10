package com.netcruz.iims.controller;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netcruz.iims.service.BoardService;
import com.netcruz.iims.vo.BoardVo;

@Controller("boardController")
@RequestMapping( "/board" )
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping( "/insert.do" )
	public String insert(int no, String title) {
		
		System.out.println("resistor controller");
		boardService.registerBoard(no,title);		
		return "redirect:/board/list.do";
		
	}
	
//	@RequestMapping( "/index.do" )
//	public String insert123() {
//		
//			
//		return "index";
//		
//	}
	
	
	@RequestMapping( "/list.do" )
	public String list(Model model) {
		
		List<BoardVo> list = boardService.boardList();
		model.addAttribute("list", list);

		return "index2";
	}
	
	@RequestMapping("/test2.do")
	public @ResponseBody String test2(){
		JSONObject json = new JSONObject();
		json.put("a", boardService.boardList());
		json.put("b", "bbbbaaabbbbbbb");
		//json.put("b", testService.test1());
		json.put("c", "dddd");
	
		return json.toString();
	}
}
