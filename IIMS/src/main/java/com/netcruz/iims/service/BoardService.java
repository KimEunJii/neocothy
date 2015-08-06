package com.netcruz.iims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netcruz.iims.dao.BoardDao;
import com.netcruz.iims.vo.BoardVo;

@Service("boardVo")
public class BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	
	public BoardVo registerBoard(int no, String title ) {
		System.out.println( "BoardService.registerBoard" );
		BoardVo vo = new BoardVo();
		vo.setNo(no);
		vo.setTitle(title);
		boardDao.insert(vo);
		return vo;
	}
	
	public List<BoardVo> boardList(){
		List<BoardVo> boardList = boardDao.getList();	
		return boardList;
	}
}
