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
		System.out.println(userVo);
	
		if(pw.equals(password)){
			return userVo;
		}
		else
			return null;
	}
	
	
	public UserVo getOne(String user_id) {
		UserVo user=userDao.getUser(user_id);
		
		return user;
	}
}
