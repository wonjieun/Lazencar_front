package dao;

import dto.Member;

public interface MemberModifyDataDao {

	public void updateData(Member mem);
	
	public Member getMemData(String id);
	
	
	
}
