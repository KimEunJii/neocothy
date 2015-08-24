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
		IpinfoVo vo = ipinfoDao.getOne(id);
		return vo;
	}
	
	public void update(IpinfoVo vo_update){
		
		System.out.println("upadate ipinfoService");
//		IpinfoVo vo = ipinfoDao.getOne(vo_update.getId());
//		vo.setCategory(vo_update.getCategory());
//		vo.setNetwork(vo_update.getNetwork());
//		vo.setIp(vo_update.getIp());
//		vo.setMask(vo_update.getMask());
//		vo.setUsages(vo_update.getUsages());
//		vo.setEquipment(vo_update.getEquipment());
//		vo.setModel(vo_update.getModel());
//		vo.setUsed(vo_update.getUsed());
//		vo.setOs(vo_update.getOs());
//		vo.setUse_dept(vo_update.getUse_dept());
//		vo.setUser(vo_update.getUser());
//		vo.setUse_term(vo_update.getUse_term());
//		vo.setPer_date(vo_update.getPer_date());
//		vo.setMody_date(vo_update.getMody_date());
//		vo.setNote(vo_update.getNote());
//		vo.setUser_id(vo_update.getUser_id());
		//System.out.println("ipinfoServiceUpdate");
		ipinfoDao.update(vo_update);
	}

}
