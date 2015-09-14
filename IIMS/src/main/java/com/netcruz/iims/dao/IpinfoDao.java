package com.netcruz.iims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.netcruz.iims.vo.IpinfoVo;




@Repository("ipinfoDao")
public class IpinfoDao {
	@Autowired
	SqlSession sqlSession;
	
	
	public void insert(IpinfoVo vo){
	
		sqlSession.insert("IpinfoMapper.insert", vo);
	}
	
	public List<IpinfoVo> getList(){
		

		return sqlSession.selectList("IpinfoMapper.list");
	}
	
	
	public IpinfoVo getSelect(int id){
		
		return sqlSession.selectOne("IpinfoMapper.get", id);
	}
	
	public IpinfoVo delete(int id){
		return sqlSession.selectOne("IpinfoMapper.delete",id);
	}
	
	public IpinfoVo update(IpinfoVo vo){
		
		return sqlSession.selectOne("IpinfoMapper.update", vo);
	}
	
	public List<IpinfoVo> getExpiredList(IpinfoVo vo){
		return sqlSession.selectList("IpinfoMapper.expiredlist", vo);
	}

}
