package service;

import java.util.List;

import dto.Member;

public interface LoginService {
	
	// 아이디와 비밀번호가 존재하는지 체크
	public boolean check(Member mem);
	
}
