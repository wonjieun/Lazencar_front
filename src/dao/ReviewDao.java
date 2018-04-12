package dao;

import java.util.List;

import dto.Paging;
import dto.Review;

public interface ReviewDao {
	
	// 현재 시간 가져오기
	
	public String getDate();
	
	// 게시글 번호 올라가기

	public int getSeq();
	
	// 게시글 좋아요 수 올라가기

	public int Like();	
	
	// 게시글 조회수 올라가기
	
	public int Hit(int rev_num);
	
	// 글 쓰기

	public int write(String rev_title, String rev_content, String rev_userId);
	
	// 글 수정
	
	public int update(int rev_num, String rev_title, String rev_content);
	
	// 글 삭제
	
	public int delete(int rev_num);
	
	// 총 게시물 수 반환
	
	public int getTotal();
	
	// 페이징 처리하여 게시물 리스트 가져오기
	
	public List getList(Paging paging);
	
	// 다음 글
	
	public int getNext(int rev_num);
	
	// 다음 글
	
	public int getPrev(int rev_num);
	
	// 게시물 클릭시 보여주기
	
	public Review getReview(int rev_num);


	
}
