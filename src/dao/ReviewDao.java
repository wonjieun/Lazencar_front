package dao;

import java.util.List;

import dto.Paging;
import dto.Review;

public interface ReviewDao {
	
	// 현재 시간 가져오기
	
	public String getDate();
	
	// 게시글 번호 올라가기

	public int getNext();	
	
	// 글쓰기

	public int write(String rev_title, String rev_content);
	
	// 총 게시물 수 반환
	public int getTotal();
	
	// 페이징 처리하여 게시물 리스트 가져오기
	public List getList(Paging paging);
	
	// 게시물 클릭시 보여주기
	public Review getReview(int rev_num);

	
}
