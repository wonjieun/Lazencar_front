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
	
	public List getUserList(Paging paging, QnaManage cm, String mem_id);

	// 검색 버튼 눌렸나 확인하는 메서드
	
	boolean doSearch(QnaManage qm);

	// 문의 작성 함수
	
	public int insertQna(String qna_title, String qna_content, String qna_userId, String qna_cate);

	// 번호매기는 함수
	
	public int getSeq();

	// 차량 수정 및 삭제 메서드
	
	public void updateQna(QnaManage qm);

	public void deleteQna(QnaManage qm);

}
