package service.adminService;

import java.util.List;

import dao.adminDao.CouponListDao;
import dao.adminDao.CouponListDaoImpl;
import util.Paging;
import dto.adminDto.CouponManage;

public class CouponListServiceImpl implements CouponListService {
	CouponListDao dao = new CouponListDaoImpl();

	@Override
	public List getCouponList(Paging paging, CouponManage dto) {
		return dao.getList(paging, dto);
	}

	@Override
	public void editCouponData(CouponManage dto) {
		if(dto.getEditCoupon().equals("updateCoupon")) {
			dao.updateCoupon(dto);
		}else if(dto.getEditCoupon().equals("deleteCoupon")) {
			dao.deleteCoupon(dto);
		}
	}
}

