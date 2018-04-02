package service.adminService;

import java.util.List;

import dto.adminDto.MemberManage;
import util.Paging;

public interface MemberManageService {
	  public List memberManage(Paging paging,MemberManage search);

}
