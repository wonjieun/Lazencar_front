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

public class CarCheckListDaoImpl implements CarCheckListDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;

	// private CarManage cm = new CarManage();
	public CarCheckListDaoImpl() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean doSearch(CarManage cm) {
		if ("clicked".equals(cm.getClicked())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List getList(Paging paging, CarManage cm) {
		// 검색버튼을 누른다면 카테고리를 구분해서 회원정보를 선택해서 보여줌
		if (doSearch(cm) == true) {
			System.out.println("cmsearch" +doSearch(cm));
			return getSearchList(paging, cm);
		} else {
			// 만약에 검색버튼을 누르지 않았을 경우(default) 전체 회원정보를 우선적으로 보여줌
			return getAllList(paging);
		}
	}

	// TB_CAR테이블의 총 자동차 갯수 구하기
	@Override
	public int getTotal(CarManage cm) {
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement pst = null;

		String sql = "SELECT COUNT(*) FROM TB_CAR";
		String sql2 = "SELECT count(*) from (" 
				+ " SELECT CAR_NUM,CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI, CAR_LCD" + "  FROM TB_CAR WHERE "
				+ cm.getCategory() + " LIKE '%' || ? || '%')";
		int total = 0;

		try {
			if (doSearch(cm) == false) {
				st = conn.createStatement();
				rs = st.executeQuery(sql);

				rs.next();
				total = rs.getInt(1);
			} else {
				pst = conn.prepareStatement(sql2);
				pst.setString(1, cm.getContent());

				rs = pst.executeQuery();
				rs.next();
				total = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return total;
	}

	// 페이징 처리해서 게시물 리스트를 가져오기
	@Override
	public List getAllList(Paging paging) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Car> list = new ArrayList<>();
		// list = null;
		String sql = "SELECT * FROM (" + " SELECT rownum rnum, b.* FROM ("
				+ " 	SELECT CAR_NUM, CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI,CAR_LCD" + " 	FROM TB_CAR"
				+ " 	ORDER BY CAR_NUM ASC" + " ) b" + " ORDER BY rnum" + ") WHERE rnum BETWEEN ? AND ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());

			rs = pst.executeQuery();

			while (rs.next()) {
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
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List getSearchList(Paging paging, CarManage cm) {
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Car> list = new ArrayList<>();
		String sql = "SELECT * FROM(" + " SELECT ROWNUM RNUM, B.* FROM("
				+ " 	SELECT CAR_NUM,CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI, CAR_LCD" + "  FROM TB_CAR WHERE "
				+ cm.getCategory() + " LIKE '%' || ? || '%' ORDER BY " + cm.getSort() + " ASC )B" + " ORDER BY RNUM"
				+ ") WHERE RNUM BETWEEN ? AND ?";
		
		
		System.out.println("sql = "+sql);
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, cm.getContent());
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());

			rs = pst.executeQuery();

			System.out.println(paging);
			while (rs.next()) {
				Car car = new Car();
				car.setCarNum(rs.getString("car_Num"));
				car.setCarName(rs.getString("car_Name"));
				car.setCarCategory(rs.getString("car_category"));
				car.setCarCondi(rs.getString("car_Condi"));
				car.setCarLCD(rs.getString("car_LCD"));
				car.setCarOil(rs.getString("car_Oil"));
				
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}


	@Override
	public void updateCar(CarManage cm) {
		PreparedStatement pst = null;

		String sql1 ="update tb_car set car_LCD = ? where car_Num=?";
		String sql2 = "update tb_car set car_Condi = ? where car_Num=?";
		String sql3 ="update tb_car set car_LCD = ?, car_Condi = ? where car_Num=?";
		try {
			if(cm.getKey_carCondi() == "" || cm.getKey_carCondi()==null) {
				pst = conn.prepareStatement(sql1);
				pst.setString(1, cm.getKey_carLCD());
				pst.setString(2, cm.getKey_carNum());
				pst.executeUpdate();
			}else if(cm.getKey_carLCD()==""||cm.getKey_carLCD()==null) {
				pst = conn.prepareStatement(sql2);
				pst.setString(1, cm.getKey_carCondi());
				pst.setString(2, cm.getKey_carNum());
				pst.executeUpdate();
			}else if(cm.getKey_carCondi() != null && cm.getKey_carLCD() != null){
				pst = conn.prepareStatement(sql3);
				pst.setString(1, cm.getKey_carLCD());
				pst.setString(2, cm.getKey_carCondi());
				pst.setString(3, cm.getKey_carNum());
				pst.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pst != null)
					pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteCar(CarManage cm) {
		PreparedStatement pst = null;
		String sql = "delete tb_car where car_num = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, cm.getKey_carNum());
			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pst != null)
					pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
