package service.adminService;

import dao.adminDao.PromotionRegisterDao;
import dao.adminDao.PromotionRegisterDaoImpl;
import dto.adminDto.PromotionManage;

public class PromotionRegisterServiceImpl implements PromotionRegisterService {
	PromotionRegisterDao dao = new PromotionRegisterDaoImpl();
	@Override
	public void promotionRegister(PromotionManage pro) {
		dao.insertAllData(pro);
	}

	
}
