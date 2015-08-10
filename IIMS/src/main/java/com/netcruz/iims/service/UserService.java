package com.netcruz.iims.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netcruz.iims.dao.UserDao;
import com.netcruz.iims.vo.UserVo;

@Service("userService")
public class UserService {
	@Autowired
	UserDao userDao;
	
	public UserVo getUser(String user_id, String pw){
		
		UserVo userVo = userDao.getUser(user_id);
		String password = userVo.getPassword();
		
		if(pw.equals(password)){
			return userVo;
		}
		else
			return null;
	}
}
