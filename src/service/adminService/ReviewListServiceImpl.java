package service.adminService;

import java.util.List;

import dao.adminDao.ReviewListDao;
import dao.adminDao.ReviewListDaoImpl;
import dto.adminDto.ReviewManage;
import util.Paging;

public class ReviewListServiceImpl implements ReviewListService {
	ReviewListDao dao = new ReviewListDaoImpl();

	@Override
	public List getRevList(Paging paging, ReviewManage rm) {
		return dao.getList(paging, rm);
	}
	@Override
	public void editRevData(ReviewManage rm) {
		if(rm.getEditReview().equals("deleteReview")) {
			dao.deleteReview(rm);
		}
	}

}
