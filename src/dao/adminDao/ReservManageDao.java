package dao.adminDao;

import java.util.List;

import dto.Car;
import dto.Reservation;
/*
 * 미 완 성
 */
import dto.adminDto.QnaManage;
import util.Paging;


public interface ReservManageDao {
	
	public int getTotal(QnaManage qm);

	// 페이징 처리하여 게시물 리스트 가져오기

	public List getAllList(Paging paging);

	public List getSearchList(Paging paging, QnaManage qm);

	public List getList(Paging paging, QnaManage qm);

	// 검색 버튼 눌렸나 확인하는 메서드
	
	boolean doSearch(QnaManage qm);

}
