package dao.adminDao;

import java.util.List;

import util.Paging;

public interface CarCheckListDao {
	// 총 게시물 수 반환
		public int getTotal();
		
		// 페이징 처리하여 게시물 리스트 가져오기
		public List getList(Paging paging);
}
