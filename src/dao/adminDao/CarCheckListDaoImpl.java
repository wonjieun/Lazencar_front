package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Car;
import dto.adminDto.CarManage;
import util.Paging;

public class CarCheckListDaoImpl implements CarCheckListDao{
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	
	public CarCheckListDaoImpl(){
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//TB_CAR테이블의 총 자동차 갯수 구하기
	@Override
	public int getTotal() {
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) FROM TB_CAR";
		
		int total = 0;
		
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return total;
	}

	//페이징 처리해서 게시물 리스트를 가져오기
	@Override
	public List getList(Paging paging) {
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		List<Car> list = new ArrayList<>();
		
		String sql = 
				"SELECT * FROM ("
				+ " SELECT rownum rnum, b.* FROM ("
				+ " 	SELECT CAR_NUM, CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI,CAR_LCD"
				+ " 	FROM TB_CAR"
				+ " 	ORDER BY CAR_NUM DESC"
				+ " ) b"
				+ " ORDER BY rnum"
				+ ") WHERE rnum BETWEEN ? AND ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Car car = new Car();
				car.setCarNum(rs.getString("car_Num"));
				car.setCarCategory(rs.getString("car_category"));
				car.setCarCondi(rs.getString("car_Condi"));
				car.setCarLCD(rs.getString("car_LCD"));
				car.setCarOil(rs.getString("car_Oil"));
				car.setCarName(rs.getString("car_Name"));
				
				list.add(car);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
				try {
					if(rs!=null)rs.close();
					if(pst!=null)pst.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return list;
	}

}
