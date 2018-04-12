package service.adminService;

import java.util.List;

import dto.Notice;
import dto.adminDto.NoticeManage;
import util.Paging;

public interface NoticeListService {

	public List<Notice> getNotList(Paging paging, NoticeManage nm);

	public void editNotData(NoticeManage nm);
}

