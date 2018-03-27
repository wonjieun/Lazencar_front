package dao;

import dto.Member;

public interface MemberSignUpDao {

	public void insertAllData(Member mem);
	
	public String getId(Member mem);

	public String getPw(Member mem);
	
	public String getName(Member mem);

	public String getJumin(Member mem);

	public String getPhone(Member mem);

	public String getAddr(Member mem);

	public String getEmail(Member mem);

}
