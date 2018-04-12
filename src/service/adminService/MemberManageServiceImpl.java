
package service.adminService;

import java.util.List;


import dao.adminDao.MemberManageDao;
import dao.adminDao.MemberManageDaoImpl;
import dto.adminDto.MemberManage;
import util.Paging;

public class MemberManageServiceImpl implements MemberManageService {
	private MemberManageDao dao = new MemberManageDaoImpl();
	
	public List getList(Paging paging, MemberManage search) {
	    return dao.getList(paging, search);

	  }
}
