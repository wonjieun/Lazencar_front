package dao.adminDao;

import java.util.List;

import dto.adminDto.MemberManage;
import util.Paging;

public interface MemberManageDao {
	
	//총 회원수 반환
	public int getTotal(MemberManage search);

	//관리자가 검색한 내용을 받아와서 해당 내용에 대한 사용자 정보 받아오기
	public List getAllList(Paging paging);
	public List getIdList(Paging paging,MemberManage search);
	public List getJuminList(Paging paging,MemberManage search); 
	public List memberManage(Paging paging, MemberManage search);
	
	//검색버튼 눌렸는지 확인
	boolean doSearch(MemberManage search);

	
	
	
}


