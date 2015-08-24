package com.netcruz.iims.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.netcruz.iims.vo.UserVo;

@Repository("userDao")
public class UserDao {
	@Autowired
	SqlSession sqlSession;
	
	public UserVo getUser(String user_id){
	
		return sqlSession.selectOne("UserMapper.getUser",user_id);
	}
}
