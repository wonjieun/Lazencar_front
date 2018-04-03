package dao.adminDao;

import dto.adminDto.PromotionManage;
import java.util.List;
import dto.adminDto.Image;

public interface PromotionRegisterDao {
	
	public void insertAllData(PromotionManage pro);
	public void insertImage(String imgPath);
	
	
	/* 지금은 필요없어!
	public List getImage();
	public Image getImage(int no);
	*/
}