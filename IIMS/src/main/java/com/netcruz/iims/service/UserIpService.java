package com.netcruz.iims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.netcruz.iims.dao.UserIpDao;
import com.netcruz.iims.vo.UserIpVo;


@Service("userIpService")
public class UserIpService {
	@Autowired
	UserIpDao userIpDao;
	
	
	
	public List<UserIpVo> userIpList(){
		List<UserIpVo> userIpList =  userIpDao.getList();
		return userIpList;
	}

	
	public UserIpVo getUserIp(int id){
		UserIpVo vo = userIpDao.getOne(id);
		return vo;
	}
	
	public UserIpVo insertUserIp(String host_ip, String host_name, String user_id){
		UserIpVo vo = new UserIpVo();
		vo.setHost_ip(host_ip);
		vo.setHost_name(host_name);
		vo.setUser_id(user_id);	
		
		userIpDao.insert(vo);
		return vo;
	}

}