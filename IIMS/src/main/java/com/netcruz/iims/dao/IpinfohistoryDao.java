package com.netcruz.iims.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.netcruz.iims.vo.IpinfohistoryVo;




@Repository("ipinfohistoryDao")
public class IpinfohistoryDao {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public void insert(IpinfohistoryVo vo){
		System.out.println("ipinfohistorydao");
		sqlSession.insert("IpinfohistoryMapper.insert", vo);
	}
	
	public List<IpinfohistoryVo> getList(){
		System.out.println("IpinfohistoryDao.getList");

		return sqlSession.selectList("IpinfohistoryMapper.list");
	}
		
	public IpinfohistoryVo getOne(int id){
		System.out.println("getselect");
		return sqlSession.selectOne("IpinfohistoryMapper.get", id);
	}
	
	public IpinfohistoryVo delete(int id){
		return sqlSession.selectOne("IpinfohistoryMapper.delete",id);
	}
	
	public IpinfohistoryVo update(IpinfohistoryVo vo){
		System.out.println("update infohistoryDao");
		sqlSession.update("IpinfohistoryMapper.update", vo);
	
		
		return sqlSession.selectOne("IpinfohistoryMapper.update", vo);
	}

}
