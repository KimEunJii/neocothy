package com.netcruz.iims.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.netcruz.iims.dao.SecureBoardDao;
import com.netcruz.iims.vo.SecureBoardVo;

@Service("secureBoardService")
public class SecureBoardService {
	
	@Autowired
	@Qualifier("secureBoardDao")
	private SecureBoardDao secureBoardDao;
	
	public void setSecureBoardDao(SecureBoardDao secureBoardDao) {
		this.secureBoardDao = secureBoardDao;
	}
	//보안계업무 등록
	public void insertSecureBoard(SecureBoardVo vo) throws Exception{
		secureBoardDao.insertSecureBoard(vo);
	}
	
	//보안계업무 리스트 조회
	public List<SecureBoardVo> getSecureBoardList() throws Exception{
		List<SecureBoardVo> secureBoardList= secureBoardDao.getSecureBoardList();
		return secureBoardList;
	}
	//보안계업무 조회
	public SecureBoardVo getSecureBoard(int id) throws Exception {
		return secureBoardDao.getSecureBoard(id);
	}
	//보안계업무 수정
	public void updateSecureBoard(SecureBoardVo vo) throws Exception{
		secureBoardDao.updateSecureBoard(vo);
	}
	//보안계업무 삭제
	public void deleteSecureBoard(int id) throws Exception{
		secureBoardDao.deleteSecureBoard(id);
	}
	/*
	//보안계업무 리스트 조회
	public Map<String, Object> getSecureBoardList(Search search) throws Exception{
		System.out.println("secureBoardService.java ||||  getSecureBoardList()");
		List<SecureBoardVo> secureBoardList= secureBoardDao.getSecureBoardList(search);
		int totalCount = secureBoardDao.getTotalCount(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", secureBoardList);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	*/
}
