package com.netcruz.iims.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.netcruz.iims.dao.IpinfoDao;
import com.netcruz.iims.vo.IpinfoVo;


@Service("ipinfoService")
public class IpinfoService {
	
	@Autowired
	IpinfoDao ipinfoDao;
	
	public IpinfoVo registerIpinfo(IpinfoVo vo){
		System.out.println("IpinfoService.registerIpinfo");
		
		ipinfoDao.insert(vo);
		return vo;
	}
	
	public List<IpinfoVo> ipinfoList(){
		List<IpinfoVo> ipinfoList = ipinfoDao.getList();
		//System.out.println("[debug]" + ipinfoList.get(1));

		return ipinfoList;
	}
	
	
	public void delete(int id){
		ipinfoDao.delete(id);		
	}
	
	
	public IpinfoVo selectIpinfo(int id){
		IpinfoVo vo = ipinfoDao.getSelect(id);
		return vo;
	}
	
	public void update(IpinfoVo vo){
		
		System.out.println("upadate ipinfoService");
		
		ipinfoDao.update(vo);
	}

}
