package dao.adminDao;

import java.util.List;

import dto.adminDto.QnaManage;
import util.Paging;

public interface QnaListDao {

	public int getTotal(QnaManage qm);

	// 페이징 처리하여 게시물 리스트 가져오기

	public List getAllList(Paging paging);

	public List getSearchList(Paging paging, QnaManage cm);

	public List getList(Paging paging, QnaManage cm);

	// 검색 버튼 눌렸나 확인하는 메서드
	boolean doSearch(QnaManage qm);

	// 차량 수정 및 삭제 메서드
	public void updateQna(QnaManage qm);

	public void deleteQna(QnaManage qm);
}
