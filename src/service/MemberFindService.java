package service;

import dto.Member;

public interface MemberFindService {
	public String getMemId(Member mem);
	public String getMemPw(Member mem);
	public String getMsg(Member mem);
	public String getMsg2(Member mem);
}
