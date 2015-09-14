package com.netcruz.iims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import com.netcruz.iims.vo.LibraryBoardVo;

@Repository("libraryBoardDao")
public class LibraryBoardDao {
	//아래는 구 SqlSession 선언방식
	//@Autowired
	//SqlSession sqlSession;
	
	
	///Field
	@Autowired
	@Qualifier("sqlSession")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	///Constructor
	public LibraryBoardDao() {
		System.out.println(this.getClass());
	}
	
	///Method
	public void insertLibraryBoard(LibraryBoardVo vo) throws Exception{
		sqlSession.insert("LibraryBoardMapper.insertLibraryBoard", vo);
	}
	
	public List<LibraryBoardVo> getLibraryBoardList() throws Exception{
		System.out.println("LibraryBoardDao.getLibraryBoardList");
		return sqlSession.selectList("LibraryBoardMapper.getLibraryBoardList");
	}
	
	
	public LibraryBoardVo getLibraryBoard(int id) throws Exception {
		return sqlSession.selectOne("LibraryBoardMapper.getLibraryBoard", id);
	}
	
	public void updateLibraryBoard(LibraryBoardVo vo) throws Exception{
		sqlSession.update("LibraryBoardMapper.updateLibraryBoard", vo);
	}
	
	public void deleteLibraryBoard(int id) throws Exception{
		sqlSession.delete("LibraryBoardMapper.deleteLibraryBoard", id);
	}
	
	
	
	/*
	public List<LibraryBoardVo> getLibraryBoardList(Search search) throws Exception{
		System.out.println("LibraryBoardDao.getLibraryBoardList");
		return sqlSession.selectList("LibraryBoardMapper.getLibraryBoardList", search);
	}
	public int getTotalCount(Search search) throws Exception {
		System.out.println("LibraryBoardDao.getTotalCount");
		return sqlSession.selectOne("LibraryBoardMapper.getTotalCount", search);
	}
	*/
}