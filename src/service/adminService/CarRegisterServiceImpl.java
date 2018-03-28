package service.adminService;

import dao.adminDao.CarRegisterDao;
import dao.adminDao.CarRegisterDaoImpl;
import dto.Car;

public class CarRegisterServiceImpl implements CarRegisterService {
	CarRegisterDao dao = new CarRegisterDaoImpl();
	@Override
	public void carRegister(Car car) {
		dao.insertAllData(car);
	}

	
}
