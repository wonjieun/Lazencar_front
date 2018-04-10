package service;

import java.util.List;

import dao.NoticeDao;
import dao.NoticeDaoImpl;
import dto.Notice;

public class NoticeServiceImpl implements NoticeService {

	NoticeDao dao = new NoticeDaoImpl();
	
	@Override
	public List getList() {
		return dao.getList();
	}
	
	@Override
	public List getTitle(Notice n) {
		return dao.getTitle(n);
	}
	
	@Override
	public List getNotice(Notice n) {
		return dao.getNotice(n);
	}
}
