package com.netcruz.iims.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netcruz.iims.dao.BlockIpDao;
import com.netcruz.iims.vo.BlockIpVo;



@Service("blockIpService")
public class BlockIpService {
	@Autowired
	BlockIpDao blockIpDao;
	
	public List<BlockIpVo> list(){
		List<BlockIpVo> list = blockIpDao.getList();
		return list;
		
	}
	
	public String blockIp(String block_ip){
		String blockIp =  blockIpDao.getOne(block_ip);
		return blockIp;
	}
	
	public void insert(String block_ip){
		blockIpDao.insert(block_ip);
	}
	
	public void delete(String block_ip){
		blockIpDao.delete(block_ip);
	}

	


}