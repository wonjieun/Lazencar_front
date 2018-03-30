package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Car;

public class CarRegisterDaoImpl implements CarRegisterDao{
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	public CarRegisterDaoImpl(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void insertAllData(Car car) {
		String sql = "INSERT INTO TB_CAR(CAR_NUM, CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI,CAR_LCD)"
				+" VALUES(?,?,?,?,?,?)";
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, car.getCarNum());
			pst.setString(2, car.getCarName());
			pst.setString(3, car.getCarCategory());
			pst.setString(4, car.getCarOil());
			pst.setString(5, car.getCarCondi());
			pst.setString(6, car.getCarLCD());
			
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String getCarLCD(Car car) {
		// TODO Auto-generated method stub
		return car.getCarLCD();
	}

	@Override
	public String getCarName(Car car) {
		// TODO Auto-generated method stub
		return car.getCarName();
	}

	@Override
	public String getCarNum(Car car) {
		// TODO Auto-generated method stub
		return car.getCarNum();
	}

	@Override
	public String getCarCategory(Car car) {
		// TODO Auto-generated method stub
		return car.getCarCategory();
	}

	@Override
	public String getCarOil(Car car) {
		// TODO Auto-generated method stub
		return car.getCarOil();
	}

	@Override
	public String getCarCondi(Car car) {
		// TODO Auto-generated method stub
		return car.getCarCondi();
	}
	
}
