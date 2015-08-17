package com.netcruz.iims.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netcruz.iims.dao.AddressDao;
import com.netcruz.iims.vo.AddressVo;

@Service("addressService")
public class AddressService {
	@Autowired
	AddressDao addressDao;

	public AddressVo registerAddress(AddressVo vo) {
		System.out.println("AddressService.registerAddress");

		addressDao.insert(vo);
		return vo;
	}

	public List<AddressVo> addressList() {
		List<AddressVo> addressList = addressDao.getList();
		return addressList;
	}

	public AddressVo selectAddress(int id) {
		AddressVo addrVo = addressDao.getSelect(id);

		return addrVo;
	}

	public void delete(int id) {
		addressDao.delete(id);
	}

	public void update(AddressVo vo) {
		addressDao.update(vo);
	}

	@Override
	public String toString() {
		return "AddressService [addressDao=" + addressDao + "]";
	}

}
