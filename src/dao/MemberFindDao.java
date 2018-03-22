package dao;

import dto.Member;

public interface MemberFindDao {
	
	public boolean checkName(Member mem);
	public boolean checkId(Member mem);
	public boolean checkEmail(Member mem); 
	public boolean checkPhone(Member mem);
	public String getId(Member mem);
	public String getPw(Member mem);
	
}
