package dao.admin;

import java.util.List;

import dto.admin.MemberManage;
import dto.admin.MemberSearch; 

public interface MemberManageDao {
	
	//관리자가 검색한 내용을 받아와서 해당 내용에 대한 사용자 정보 받아오기
	
	public List getAllList(MemberSearch search);
	public List getIdList(MemberSearch search);
	public List getJuminList(MemberSearch search); 
	public List memberManage(MemberSearch search);
	
	
	
//	public String getId(MemberManage mem);
//	public String getName(MemberManage mem);
//	public String getPhone(MemberManage mem);
//	public String getJumin(MemberManage mem);
//	public String getEmail(MemberManage mem);
//	public String getAddr(MemberManage mem);
//	public String getLicense(MemberManage mem);
	
	
}
