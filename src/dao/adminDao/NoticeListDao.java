package dao.adminDao;

import java.util.List;

import dto.adminDto.NoticeManage;
import util.Paging;

public interface NoticeListDao {

	public int getTotal(NoticeManage nm);

	// 페이징 처리하여 게시물 리스트 가져오기

	public List getAllList(Paging paging);

	public List getSearchList(Paging paging, NoticeManage cm);

	public List getList(Paging paging, NoticeManage cm);

	// 검색 버튼 눌렸나 확인하는 메서드
	boolean doSearch(NoticeManage cm);

	// 차량 수정 및 삭제 메서드
	public void updateNotice(NoticeManage cm);

	public void deleteNotice(NoticeManage cm);
}
