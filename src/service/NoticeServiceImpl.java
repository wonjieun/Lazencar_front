package service;

import java.util.List;

import dao.NoticeDao;
import dao.NoticeDaoImpl;
import dto.Notice;

public class NoticeServiceImpl implements NoticeService {

	NoticeDao dao = new NoticeDaoImpl();
	
	@Override
	public List getTitle(Notice n) {
		return dao.getTitle(n);
	}
}
