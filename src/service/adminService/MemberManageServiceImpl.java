
package service.adminService;

import java.util.List;

import dao.adminDao.MemberManageDao;
import dao.adminDao.MemberManageDaoImpl;
import dto.adminDto.MemberSearch;

public class MemberManageServiceImpl implements MemberManageService {
	private MemberManageDao dao = new MemberManageDaoImpl();
	
	public List memberManage(MemberSearch search) {
	    return dao.memberManage(search);

	  }
}
