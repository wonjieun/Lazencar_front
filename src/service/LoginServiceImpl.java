package service;

import dao.LoginDao;
import dao.LoginDaoImpl;
import dto.Member;

public class LoginServiceImpl implements LoginService {

	private LoginDao dao = new LoginDaoImpl();
	
	@Override
	public boolean check(Member mem) {
		if( dao.check(mem) ) {
			return true;
		}
		return false;
	}
	
	@Override
	public int getGubn(Member m) {
		return dao.getGubn(m);
	}
}
