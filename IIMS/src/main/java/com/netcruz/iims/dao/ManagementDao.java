package com.netcruz.iims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.netcruz.iims.vo.ManagementVo;

@Repository("managementDao")
public class ManagementDao {
	@Autowired
	SqlSession sqlSession;
	
	//crud
	public void work_insert(ManagementVo vo){
		sqlSession.insert("ManagementMapper.work_insert",vo);
	}
	
	public List<ManagementVo> getList(String category){
		
		return sqlSession.selectList("ManagementMapper.list",category);
	}
	
	public ManagementVo getOne(int id){
		return sqlSession.selectOne("ManagementMapper.getOne", id);
	}
	
	public ManagementVo delete(int id){
		return sqlSession.selectOne("ManagementMapper.delete", id);
	}
	
	public ManagementVo work_update(ManagementVo vo){
		return sqlSession.selectOne("ManagementMapper.work_update", vo);
	}
}