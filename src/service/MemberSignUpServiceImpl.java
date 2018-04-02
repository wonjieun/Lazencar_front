package service;

import dao.MemberSignUpDao;
import dao.MemberSignUpDaoImpl;
import dto.Member;

public class MemberSignUpServiceImpl implements MemberSignUpService {
	MemberSignUpDao dao = new MemberSignUpDaoImpl();

	@Override
	public void signUp(Member mem) {
		dao.insertAllData(mem);	
	}
}
