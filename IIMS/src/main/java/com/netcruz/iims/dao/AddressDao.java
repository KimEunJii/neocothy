package com.netcruz.iims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.netcruz.iims.vo.AddressVo;

@Repository("addressDao")
public class AddressDao {
	@Autowired
	SqlSession sqlSession;
	
	//crud
	public void insert(AddressVo vo){
		sqlSession.insert("AddressMapper.insert", vo);
	}
	
	public List<AddressVo> getList(){
		System.out.println("AddressDao.getList");
		return sqlSession.selectList("AddressMapper.list");
	}
}