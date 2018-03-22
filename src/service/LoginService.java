package service;

import java.util.List;

import dto.Member;

public interface LoginService {
	
	// user의 ID와 비밀번호가 존재하는지 체크
	public void check(Member user);

}
