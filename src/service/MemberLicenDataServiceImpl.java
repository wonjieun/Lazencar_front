package service;

import dao.MemberLicenDataDao;
import dao.MemberLicenDataDaoImpl;
import dto.Member;

public class MemberLicenDataServiceImpl implements MemberLicenDataService {
	MemberLicenDataDao dao = new MemberLicenDataDaoImpl();

	@Override
	public void LicenData(Member mem) {
		dao.updateLicenData(mem);
	}
}
