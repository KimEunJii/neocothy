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
		sqlSession.insert("ManagementMapper.insert",vo);
	}
	
	public List<ManagementVo> getList(String category){
		
		return sqlSession.selectList("ManagementMapper.list",category);
	}
}