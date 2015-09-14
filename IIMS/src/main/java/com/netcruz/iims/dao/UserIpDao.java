package com.netcruz.iims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.netcruz.iims.vo.UserIpVo;

@Repository("userIpDao")
public class UserIpDao {
	@Autowired
	SqlSession sqlSession;
	

	public List<UserIpVo> getList(){
		
		return sqlSession.selectList("UserIpMapper.list");
	}
	
	public UserIpVo getOne(int id){
		return sqlSession.selectOne("UserIpMapper.getOne", id);
	}	
	
	public void insert(UserIpVo vo){
		sqlSession.insert("UserIpMapper.insert", vo);
	}

}