package com.netcruz.iims.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.netcruz.iims.vo.BlockIpVo;
import com.netcruz.iims.vo.IpinfoVo;


@Repository("blockIpDao")
public class BlockIpDao {
	@Autowired
	SqlSession sqlSession;
	

	public List<BlockIpVo> getList(){		

		return sqlSession.selectList("BlockIpMapper.list");
	}
	public String getOne(String block_ip){
		
		return sqlSession.selectOne("BlockIpMapper.getOne",block_ip);
	}
	
	public void insert(String block_ip){
		sqlSession.insert("BlockIpMapper.insert",block_ip);
	}
	
	public void delete(String block_ip){
		sqlSession.delete("BlockIpMapper.delete",block_ip);
	}
	

}