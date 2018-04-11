package service;

import java.util.List;

import dto.Notice;

public interface NoticeService {
	public List getList();
	public List getTitle(Notice n);
	public List getNotice(Notice n);
}