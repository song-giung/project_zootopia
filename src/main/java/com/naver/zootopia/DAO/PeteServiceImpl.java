package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.zootopia.model.peteBean;
import com.naver.zootopia.model.peteEpil;
import com.naver.zootopia.model.peteReservation;
import com.naver.zootopia.model.petepilogue;

@Service("peteService")
public class PeteServiceImpl implements PeteService{

	@Autowired
	private PeteDAOImpl peteDAO;
	
	//���� �ñ�� ���ۼ�
	@Override
	public void insertPete(peteBean pt) throws Exception {
		peteDAO.insertPete(pt);
	}
	
	//�� ���
	@Override
	public List<peteBean> getPeteList(Map m) throws Exception {
		List<peteBean> list = peteDAO.getPeteList(m);
		return list;
	}
	
	//�۰���
	@Override
	public int getListCount() throws Exception {
		int result = peteDAO.getListCount();
		return result;
	}
	
	//�˻� �� ����
	@Override
	public int getListCount2(Map m) throws Exception {
		return peteDAO.getListCount2(m);		
	}
	
	//�˻� �� ���
	@Override
	public List<peteBean> getPeteList2(Map m) throws Exception {
		return peteDAO.getPeteList2(m);
	}
	
	//������
	@Override
	public peteBean getPeteCont(int num) throws Exception {
		peteBean detail = peteDAO.getPeteCont(num);
		return detail;
	}
	
	//�� �����ϱ�
	@Override
	public void editPete(peteBean petebean) throws Exception {
		peteDAO.editPete(petebean);
	}
	
	//�� ����
	@Override
	public void deletePete(int pete_num) throws Exception {
		peteDAO.deletePete(pete_num);
	}
	
	/////////////////////////////////////////////////////////
	//peteReservation
	
	//�����ñ�� �����ϱ�
	@Override
	public void peteReservation(peteReservation pr) throws Exception {
		peteDAO.insertReser(pr);
	}
	
	//�����ñ�� ����Ʈ
	@Override
	public List<peteReservation> peteReserList(String join_id) throws Exception {
		return peteDAO.peteReserList(join_id);
	}
	
	/////////////////////////////////////////////////////////
	//insertPetepil
	//�� ���� �Է�
	@Override
	public void insertPetepil(petepilogue pe) throws Exception {
		peteDAO.insertPetepil(pe);
	}
	//������ ����Ʈ
	@Override
	public List<petepilogue> petepilList(String pete_id) throws Exception {
		return peteDAO.petepilList(pete_id);
	}
	
	/////////////////////////////////////////////////////////
	//����� �ı�
	@Override
	public void insertPeteEpil(peteEpil peteepil) throws Exception {
		peteDAO.insertPeteEpil(peteepil);
	}
	//����� �ı� ����Ʈ
	@Override
	public List<peteEpil> selectPeteEpil(String pete_id) throws Exception {
		return peteDAO.selectPeteEpil(pete_id);
	}
	//����� ���� �̱�
	@Override
	public List<peteReservation> peteReserList2(String pete_id) throws Exception {
		return peteDAO.peteReserList2(pete_id);
	}
	/*//�����ϱ� ��ϰ�(�޷¶����� ����)
	@Override
	public com.naver.zootopia.model.peteReservation peteReserDate(String pete_id) throws Exception {
		return peteDAO.peteReserDate(pete_id);
	}*/
	
	/*예약 아이디 중복 체크*/
	@Override
	public int checkReserId(String id) throws Exception {		
		return peteDAO.checkReserId(id);
	}
	
	@Override
	public List<Integer> selectListEpil(String pete_id) {
		return peteDAO.selectListEpil(pete_id);
	}
}