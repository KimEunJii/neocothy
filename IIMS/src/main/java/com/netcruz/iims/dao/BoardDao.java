package com.netcruz.iims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.netcruz.iims.vo.BoardVo;

@Repository("boardDao")
public class BoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//crud
	public void insert( BoardVo vo ) {
		sqlSession.insert( "BoardMapper.insert", vo );
	}
	
	public List<BoardVo> getList() {
		System.out.println( "BoardDao.getList" );
		return sqlSession.selectList("BoardMapper.list");

	}
}
