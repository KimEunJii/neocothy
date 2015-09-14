package com.netcruz.iims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.netcruz.iims.vo.SecureBoardVo;

@Repository("secureBoardDao")
public class SecureBoardDao {
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
	public SecureBoardDao() {
		System.out.println(this.getClass());
	}
	
	///Method
	public void insertSecureBoard(SecureBoardVo vo) throws Exception{
		sqlSession.insert("SecureBoardMapper.insertSecureBoard", vo);
	}
	
	public List<SecureBoardVo> getSecureBoardList() throws Exception{
		System.out.println("SecureBoardDao.getSecureBoardList");
		return sqlSession.selectList("SecureBoardMapper.getSecureBoardList");
	}
	
	
	public SecureBoardVo getSecureBoard(int id) throws Exception {
		return sqlSession.selectOne("SecureBoardMapper.getSecureBoard", id);
	}
	
	public void updateSecureBoard(SecureBoardVo vo) throws Exception{
		sqlSession.update("SecureBoardMapper.updateSecureBoard", vo);
	}
	
	public void deleteSecureBoard(int id) throws Exception{
		sqlSession.delete("SecureBoardMapper.deleteSecureBoard", id);
	}
	/*
	public List<SecureBoardVo> getSecureBoardList(Search search) throws Exception{
		System.out.println("SecureBoardDao.getSecureBoardList");
		return sqlSession.selectList("SecureBoardMapper.getSecureBoardList", search);
	}
	public int getTotalCount(Search search) throws Exception {
		System.out.println("SecureBoardDao.getTotalCount");
		return sqlSession.selectOne("SecureBoardMapper.getTotalCount", search);
	}
	*/
	
}