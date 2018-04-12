package service.adminService;

import java.util.List;

import dto.adminDto.MemberManage;
import util.Paging;

public interface MemberManageService {
	  public List getList(Paging paging,MemberManage search);

}
