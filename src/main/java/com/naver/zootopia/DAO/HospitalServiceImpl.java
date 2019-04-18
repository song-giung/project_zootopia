package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.zootopia.model.HospitalBean;

@Service("hospitalService")
public class HospitalServiceImpl implements HospitalService{
	
	@Resource(name="hospitalDAO")
	private HospitalDAOImpl hospitalDAO;
	

	@Override
	public void insertHospital(HospitalBean hospitalbean) throws Exception {
		// TODO Auto-generated method stub
		hospitalDAO.insertHospital(hospitalbean);
		
	}

	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return hospitalDAO.getListCount();
	}

	@Override
	public List<HospitalBean> getHospitalList(Map m) throws Exception {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalList(m);
	}

	@Override
	public HospitalBean getHospitalCont(int num) throws Exception {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalCont(num);
	}

	@Override
	public void editHospital(HospitalBean hospitalbean) throws Exception {
		// TODO Auto-generated method stub
		hospitalDAO.editHospital(hospitalbean);
		
	}

	@Override
	public void deleteHospital(int hospital_num) throws Exception {
		// TODO Auto-generated method stub
		hospitalDAO.deleteHospital(hospital_num);
	}

	@Override
	public int getListCount3(Map m) throws Exception {
		// TODO Auto-generated method stub
		return hospitalDAO.getListCount3(m);
	}

	@Override
	public List<HospitalBean> getHospitalList3(Map m) throws Exception {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalList3(m);
	}
}
