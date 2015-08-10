package com.netcruz.iims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.netcruz.iims.dao.ManagementDao;
import com.netcruz.iims.vo.ManagementVo;


@Service("managementService")
public class ManagementService {
	@Autowired
	ManagementDao managementDao;
	
	public ManagementVo insertManagement(int no, String category, String date, String equipment, String title,
			String contents, String note, String user_id){
				
		ManagementVo vo = new ManagementVo();
		vo.setId(0);
		vo.setCategory(category);
		vo.setDate(date);
		vo.setEquipment(equipment);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setNote(note);
		vo.setUser_id(user_id);
		
		managementDao.work_insert(vo);
		return vo;
	}
	
	public List<ManagementVo> work_managementList(){
		List<ManagementVo> work_managementList =  managementDao.getList("work");
		return work_managementList;
	}
	
	public List<ManagementVo> error_managementList(){
		List<ManagementVo> work_managementList =  managementDao.getList("error");
		return work_managementList;
	}
	
	public List<ManagementVo> daily_managementList(){
		List<ManagementVo> work_managementList =  managementDao.getList("daily");
		return work_managementList;
	}
	
	public List<ManagementVo> maintain_managementList(){
		List<ManagementVo> work_managementList =  managementDao.getList("maintain");
		return work_managementList;
	}
}