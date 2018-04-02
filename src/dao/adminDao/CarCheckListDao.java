package dao.adminDao;

import java.util.List;

import dto.adminDto.CarManage;
import util.Paging;

public interface CarCheckListDao {
	// 총 게시물 수 반환
	public int getTotal(CarManage cm);

	// 페이징 처리하여 게시물 리스트 가져오기
	
	public List getAllList(Paging paging);

	public List getSearchList(Paging paging,CarManage cm);

	public List getList(Paging paging,CarManage cm);

	//검색 버튼 눌렸나 확인하는 메서드
	boolean doSearch(CarManage cm);
//	//수정 및 삭제버튼 눌렸나 확인하는 메서드
//	String checkButton(CarManage cm);
//	
//	//차량 수정 및 삭제 메서드
//	public void updateCar(CarManage cm);
//	public void deleteCar(CarManage cm);
}
