package service;

import dao.MemberModifyDataDao;
import dao.MemberModifyDataDaoImpl;
import dto.Member;

public class MemberModifyDataServiceImpl implements MemberModifyDataService {
	MemberModifyDataDao dao = new MemberModifyDataDaoImpl();

	@Override
	public void modifyData(Member mem) {
		dao.updateData(mem);
	}
}
