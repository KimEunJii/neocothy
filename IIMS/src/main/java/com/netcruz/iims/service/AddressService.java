package com.netcruz.iims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netcruz.iims.dao.AddressDao;
import com.netcruz.iims.vo.AddressVo;

@Service("addressVo")
public class AddressService {
	@Autowired
	AddressDao addressDao;
	
	public AddressVo registerAddress(int no, String category, String partner, String pm, String pm_phone,
			String pm_email, String task, String equipment, String engineer, String engineer_phone,
			String engineer_email, String test_date, String test_type, String manager,
			String note, String user_id){
		System.out.println("AddressService.registerAddress");
		AddressVo vo = new AddressVo();
		vo.setId(0);
		vo.setCategory(category);
		vo.setPartner(partner);
		vo.setPm(pm);
		vo.setPm_phone(pm_phone);
		vo.setPm_email(pm_email);
		vo.setTask(task);
		vo.setEquipment(equipment);
		vo.setEngineer(engineer_email);
		vo.setEngineer_phone(engineer_phone);
		vo.setEngineer_email(engineer_email);
		vo.setTest_date(test_date);
		vo.setTest_type(test_type);
		vo.setManager(manager);
		vo.setUser_id(user_id);
		
		addressDao.insert(vo);
		return vo;
	}
	
	public List<AddressVo> addressList(){
		List<AddressVo> addressList = addressDao.getList();
		return addressList;
	}
}
