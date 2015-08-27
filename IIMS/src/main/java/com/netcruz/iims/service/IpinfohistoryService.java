package com.netcruz.iims.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.netcruz.iims.dao.IpinfohistoryDao;
import com.netcruz.iims.vo.IpinfohistoryVo;


@Service("ipinfohistoryService")
public class IpinfohistoryService {
	
	@Autowired
	IpinfohistoryDao ipinfohistoryDao;
	
	public IpinfohistoryVo registerIpinfohistory(IpinfohistoryVo vo){
		System.out.println("IpinfohistoryService.registerIpinfohistory");
		
	
		ipinfohistoryDao.insert(vo);
		return vo;
	}
	
	public List<IpinfohistoryVo> ipinfohistoryList(){
		List<IpinfohistoryVo> ipinfohistoryList = ipinfohistoryDao.getList();
		//System.out.println("[debug]" + ipinfoList.get(1));

		return ipinfohistoryList;
	}
	
	
	public void delete(int id){
		ipinfohistoryDao.delete(id);		
	}
	
	
	public IpinfohistoryVo selectIpinfohistory(int id){
		IpinfohistoryVo vo = ipinfohistoryDao.getOne(id);
		return vo;
	}
	
	public void update(IpinfohistoryVo vo_update){
		
		System.out.println("upadate ipinfohistoryService");

		ipinfohistoryDao.update(vo_update);
	}

}
