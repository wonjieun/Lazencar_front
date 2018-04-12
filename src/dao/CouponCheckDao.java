package dao;

import java.util.List;

import dto.Member;
import util.Paging;

public interface CouponCheckDao {
	
	// 총 게시물 수 반환
	public int getTotal(String id);
	
	// 페이징 처리하여 게시물 리스트 가져오기
	public List getList(String id);
}
