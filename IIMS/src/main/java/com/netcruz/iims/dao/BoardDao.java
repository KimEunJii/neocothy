package com.netcruz.iims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.netcruz.iims.vo.BoardVo;

@Repository("boardDao")
public class BoardDao {
	
	@Autowired
	SqlSession sqlSessionTemplate;
	
	//crud
	public void insert( BoardVo vo ) {
		sqlSessionTemplate.insert( "BoardMapper.insert", vo );
	}
	
	public List<BoardVo> getList() {
		System.out.println( "BoardDao.getList" );
		return sqlSessionTemplate.selectList("BoardMapper.list");

	}
}
