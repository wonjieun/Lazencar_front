
package service.admin;

import java.util.List;

import dao.admin.MemberManageDao;
import dao.admin.MemberManageDaoImpl;
import dto.admin.MemberSearch;

public class MemberManageServiceImpl implements MemberManageService {
	private MemberManageDao dao = new MemberManageDaoImpl();
	
	public List memberManage(MemberSearch search) {
	    return dao.memberManage(search);

	  }
}
