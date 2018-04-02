package service.adminService;

import java.util.List;

import dto.adminDto.CarManage;
import util.Paging;

public interface CarCheckListService {
	public List getCarList(Paging paging,CarManage cm);
}
