package com.netcruz.iims.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.netcruz.iims.dao.LibraryBoardDao;
import com.netcruz.iims.vo.LibraryBoardVo;

@Service("libraryBoardService")
public class LibraryBoardService {
	
	@Autowired
	@Qualifier("libraryBoardDao")
	private LibraryBoardDao libraryBoardDao;
	
	public void setLibraryBoardDao(LibraryBoardDao libraryBoardDao) {
		this.libraryBoardDao = libraryBoardDao;
	}
	//보안계업무 등록
	public void insertLibraryBoard(LibraryBoardVo vo) throws Exception{
		libraryBoardDao.insertLibraryBoard(vo);
	}
	
	//보안계업무 리스트 조회
	public List<LibraryBoardVo> getLibraryBoardList() throws Exception{
		List<LibraryBoardVo> libraryBoardList= libraryBoardDao.getLibraryBoardList();
		return libraryBoardList;
	}
	//보안계업무 조회
	public LibraryBoardVo getLibraryBoard(int id) throws Exception {
		return libraryBoardDao.getLibraryBoard(id);
	}
	//보안계업무 수정
	public void updateLibraryBoard(LibraryBoardVo vo) throws Exception{
		libraryBoardDao.updateLibraryBoard(vo);
	}
	//보안계업무 삭제
	public void deleteLibraryBoard(int id) throws Exception{
		libraryBoardDao.deleteLibraryBoard(id);
	}
	/*
	//보안계업무 리스트 조회
	public Map<String, Object> getLibraryBoardList(Search search) throws Exception{
		System.out.println("libraryBoardService.java ||||  getLibraryBoardList()");
		List<LibraryBoardVo> libraryBoardList= libraryBoardDao.getLibraryBoardList(search);
		int totalCount = libraryBoardDao.getTotalCount(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", libraryBoardList);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
*/
}
