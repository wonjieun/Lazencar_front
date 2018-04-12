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
		System.out.println("service : " + dto.getEditCoupon());
		if("updateCoupon".equals(dto.getEditCoupon())) {
			dao.updateCoupon(dto);
		}else if("deleteCoupon".equals(dto.getEditCoupon())) {
			dao.deleteCoupon(dto);
		}
	}
}

