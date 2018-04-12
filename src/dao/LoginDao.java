package dao;

import dto.Member;

public interface LoginDao {
	
	public boolean check(Member m);
	
	public int getGubn(Member m);
	
	public void insertSNSData(Member m); 
	
}
