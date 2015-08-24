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
		System.out.println("ipinfodao");
		//vo.setNote(vo.getNote().replace("\r\n","<br>"));
		sqlSession.insert("IpinfoMapper.insert", vo);
	}
	
	public List<IpinfoVo> getList(){
		System.out.println("IpinfoDao.getList");

		return sqlSession.selectList("IpinfoMapper.list");
	}
		
	public IpinfoVo getOne(int id){
		System.out.println("getselect");
		return sqlSession.selectOne("IpinfoMapper.get", id);
	}
	
	public IpinfoVo delete(int id){
		return sqlSession.selectOne("IpinfoMapper.delete",id);
	}
	
	public IpinfoVo update(IpinfoVo vo){
		System.out.println("update infoDao");
		sqlSession.update("IpinfoMapper.update", vo);
		System.out.println("돌아왓나용");
		
		return sqlSession.selectOne("IpinfoMapper.update", vo);
	}

}
