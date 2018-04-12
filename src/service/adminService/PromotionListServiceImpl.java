package service.adminService;

import java.util.List;

import dao.adminDao.PromotionListDao;
import dao.adminDao.PromotionListDaoImpl;
import util.Paging;
import dto.adminDto.PromotionManage;

public class PromotionListServiceImpl implements PromotionListService {
	PromotionListDao dao = new PromotionListDaoImpl();

	@Override
	public List getPromotionList(Paging paging, PromotionManage dto) {
		return dao.getList(paging, dto);
	}

	@Override
	public void editPromotionData(PromotionManage dto) {
		if("updatePromotion".equals(dto.getEditPromotion())) {
			dao.updatePromotion(dto);
		}else if("deletePromotion".equals(dto.getEditPromotion())) {
			dao.deletePromotion(dto);
		}
	}
	
	
}

