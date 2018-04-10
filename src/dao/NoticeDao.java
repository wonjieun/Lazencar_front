package dao;

import java.util.List;

import dto.Notice;
import util.Paging;

public interface NoticeDao {
	public List getList();
	public List getTitle(Notice n);
	public List getNotice(Notice n);
}
