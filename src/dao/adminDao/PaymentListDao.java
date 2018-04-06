package dao.adminDao;

import java.util.List;

import dto.adminDto.PaymentManage;
import util.Paging;

public interface PaymentListDao {
	// 총 게시물 수 반환
		public int getTotal(PaymentManage pm);

		// 페이징 처리하여 게시물 리스트 가져오기
		
		public List getAllList(Paging paging);

		public List getSearchList(Paging paging,PaymentManage pm);

		public List getList(Paging paging,PaymentManage pm);

		//검색 버튼 눌렸나 확인하는 메서드
		boolean doSearch(PaymentManage pm);
}
