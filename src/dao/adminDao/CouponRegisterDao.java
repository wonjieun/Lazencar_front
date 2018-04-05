package dao.adminDao;

import dto.Coupon;

public interface CouponRegisterDao {
	
	public void insertAllData(Coupon dto);
	
	public boolean existName(String couName);
	
	/*
	public List getImage();
	public PromotionManage getImage(String name);
	*/
}