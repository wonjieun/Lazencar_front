package service.adminService;

import java.util.List;

import dao.adminDao.NoticeListDao;
import dao.adminDao.NoticeListDaoImpl;
import dto.Notice;
import dto.adminDto.NoticeManage;
import util.Paging;

public class NoticeListServiceImpl implements NoticeListService {
	NoticeListDao dao = new NoticeListDaoImpl();
	
	@Override
	public List getNotList(Paging paging, NoticeManage nm) {
		return dao.getList(paging, nm);
	}

	@Override
	public void editNotData(NoticeManage nm) {
		if(nm.getEditNotice().equals("updateNot")) {
			dao.updateNotice(nm);
		}else if(nm.getEditNotice().equals("deleteNot")) {
			dao.deleteNotice(nm);
		}
	}
	
	

}
