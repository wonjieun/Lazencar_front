package dao;

import dto.Member;

public interface MemberDeleteDao {
	
	public boolean deleteData(Member mem);
	public void deleteMemData(Member mem);
	public void deleteLicenData(Member mem);
	
	
}
