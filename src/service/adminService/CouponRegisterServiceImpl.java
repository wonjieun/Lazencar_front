package service.adminService;

import dao.adminDao.CouponRegisterDao;
import dao.adminDao.CouponRegisterDaoImpl;
import dto.Coupon;

public class CouponRegisterServiceImpl implements CouponRegisterService {
	CouponRegisterDao dao = new CouponRegisterDaoImpl();
	@Override
	public void CouponRegister(Coupon coupon) {
		dao.insertAllData(coupon);
	}

	
}
