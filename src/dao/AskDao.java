package dao;

import java.util.List;

import dto.Paging;

public interface AskDao {
	
	// 총 게시물 수 반환
	
	public int getTotal();
	
	// 페이징 처리하여 게시물 리스트 가져오기
	
	public List getList(Paging paging);
	
	// 문의 보내기
	
	public int ask(String ask_title, String ask_content, String ask_userId);

	public int getSeq();


	
}
