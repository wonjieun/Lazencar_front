package dao.adminDao;

import dto.Car;

public interface CarRegisterDao {


	public void insertAllData(Car car);
	
	public String getCarLCD(Car car);

	public String getCarName(Car car);
	
	public String getCarNum(Car car);

	public String getCarCategory(Car car);

	public String getCarOil(Car car);

	public String getCarCondi(Car car);

}
