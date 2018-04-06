package dao.adminDao;

import java.util.List;

import dto.adminDto.CouponManage;
import util.Paging;

public interface CouponListDao {
	
	// 총 게시물 수 반환
	public int getTotal(CouponManage dto);

	// 페이징 처리하여 게시물 리스트 가져오기
	
	public List getAllList(Paging paging);

	public List getSearchList(Paging paging,CouponManage dto);

	public List getList(Paging paging,CouponManage dto);

	//검색 버튼 눌렸나 확인하는 메서드
	boolean doSearch(CouponManage dto);
	//차량 수정 및 삭제 메서드
	public void updateCoupon(CouponManage dto);
	public void deleteCoupon(CouponManage dto);
}


