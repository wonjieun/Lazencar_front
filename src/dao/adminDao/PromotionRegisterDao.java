package dao.adminDao;

import java.util.List;

import dto.Promotion;

public interface PromotionRegisterDao {
	
	public void insertAllData(Promotion pro);
	
	public boolean existName(String eveName);
	/*
	public List getImage();
	public PromotionManage getImage(String name);
	*/
}