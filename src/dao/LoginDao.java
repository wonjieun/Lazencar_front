package dao;

import dto.Member;

public interface LoginDao {
	
	public boolean checkId(Member mem);
	public boolean checkPw(Member mem);
	
	public boolean check(Member mem);
	
	public String getId(Member mem);
	public String getPw(Member mem);
}
