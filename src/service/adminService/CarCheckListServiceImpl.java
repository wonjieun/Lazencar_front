package service.adminService;

import java.util.List;

import dao.adminDao.CarCheckListDao;
import dao.adminDao.CarCheckListDaoImpl;
import util.Paging;
import dto.adminDto.CarManage;

public class CarCheckListServiceImpl implements CarCheckListService {
	CarCheckListDao dao = new CarCheckListDaoImpl();

	// @Override
	// public List getCarList(Paging paging) {
	@Override
	public List getCarList(Paging paging, CarManage cm) {
//		if(dao.checkButton(cm).equals("update")) {
//			dao.updateCar(cm);
//			return dao.getList(paging, cm);
//		}else if(dao.checkButton(cm).equals("delete")) {
//			dao.deleteCar(cm);
//			return dao.getList(paging, cm);
//		}else
		return dao.getList(paging, cm);
	}
}
