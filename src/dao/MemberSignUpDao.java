package dao;

import dto.Member;

public interface MemberSignUpDao {

	public void insertAllData(Member mem);
	
	public void idDupCheck(Member mem);
	
	public void doSignUp(Member mem);

}
