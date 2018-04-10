package service.adminService;

import java.util.List;

import dto.adminDto.PromotionManage;
import util.Paging;

public interface PromotionListService {
	public List getPromotionList(Paging paging,PromotionManage dto);
	
	public void editPromotionData(PromotionManage dto);
}
