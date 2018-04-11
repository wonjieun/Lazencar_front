package service.adminService;

import java.util.List;

import dto.adminDto.CouponManage;
import util.Paging;

public interface CouponListService {
	public List getCouponList(Paging paging,CouponManage dto);
	
	public void editCouponData(CouponManage dto);
}
