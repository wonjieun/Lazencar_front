package dao.admin;

import java.util.List;

import dto.admin.MemberManage; 

public interface MemberManageDao {
	
	//관리자가 검색한 내용을 받아와서 해당 내용에 대한 사용자 정보 받아오기
	
	public List getIdList(MemberManage mem);
	public List getJuminList(MemberManage mem); 
	public List getLicenseList(MemberManage mem);
//	public String getId(MemberManage mem);
//	public String getName(MemberManage mem);
//	public String getPhone(MemberManage mem);
//	public String getJumin(MemberManage mem);
//	public String getEmail(MemberManage mem);
//	public String getAddr(MemberManage mem);
//	public String getLicense(MemberManage mem);
	
	
}
