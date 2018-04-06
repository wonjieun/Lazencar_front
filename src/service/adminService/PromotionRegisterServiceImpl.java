package service.adminService;

import dao.adminDao.PromotionRegisterDao;
import dao.adminDao.PromotionRegisterDaoImpl;
import dto.Promotion;

public class PromotionRegisterServiceImpl implements PromotionRegisterService {
	PromotionRegisterDao dao = new PromotionRegisterDaoImpl();
	@Override
	public void PromotionRegister(Promotion promotion) {
		dao.insertAllData(promotion);
	}

	
}
