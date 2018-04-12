package service.adminService;

import java.util.List;

import dto.Notice;
import dto.adminDto.ReviewManage;
import util.Paging;

public interface ReviewListService {

	public void editRevData(ReviewManage rm);

	public List getRevList(Paging paging, ReviewManage rm);
	

}
