package dao.adminDao;

import java.util.List;

import dto.adminDto.ReviewManage;
import util.Paging;

public interface ReviewListDao {

	public List getAllList(Paging paging);

	public List getSearchList(Paging paging, ReviewManage rm);

	boolean doSearch(ReviewManage rm);

	public int getTotal(ReviewManage rm);

	public List getList(Paging paging, ReviewManage rm);

	public void deleteReview(ReviewManage rm);

}
