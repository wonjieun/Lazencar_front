package service.adminService;

import dao.adminDao.NoticeRegistDao;
import dao.adminDao.NoticeRegistDaoImpl;
import dto.Notice;

public class NoticeRegistServiceImpl implements NoticeRegistService{

	NoticeRegistDao dao = new NoticeRegistDaoImpl();
	@Override
	public void insertNotice(Notice not) {
		dao.insertAllData(not);
	}
	
}
