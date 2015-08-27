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
	
		return sqlSession.selectList("AddressMapper.list");
	}
	
	public AddressVo getSelect(int id){

		return sqlSession.selectOne("AddressMapper.get", id);
	}
	
	public AddressVo delete(int id){
		return sqlSession.selectOne("AddressMapper.delete", id);
	}
	
	public AddressVo update(AddressVo vo){
		return sqlSession.selectOne("AddressMapper.update", vo);
	}
}
