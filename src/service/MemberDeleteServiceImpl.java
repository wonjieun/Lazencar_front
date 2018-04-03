package service;

import dao.MemberDeleteDao;
import dao.MemberDeleteDaoImpl;
import dto.Member;

public class MemberDeleteServiceImpl implements MemberDeleteService {

	private MemberDeleteDao dao = new MemberDeleteDaoImpl();
	
	@Override
	public boolean delete(Member mem) {
//		System.out.println("test1");
//		System.out.println(dao.deleteData(mem));
		return dao.deleteData(mem);
		
//		dao.deleteLicenData(mem);
//		dao.deleteMemData(mem);
		
		
	}

	
}
