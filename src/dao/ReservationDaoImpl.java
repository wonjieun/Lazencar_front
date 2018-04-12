package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Reservation;
import dto.Car;
import dto.Coupon;

public class ReservationDaoImpl implements ReservationDao{
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username ="scott";
	private final String password ="tiger";
	
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	
	public ReservationDaoImpl() {
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
	public List car_list() {
		String sql = "SELECT CAR_NUM, CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI, CAR_LCD" 
				+ " FROM TB_CAR WHERE CAR_CONDI='대기중'";
		
		List list = new ArrayList<>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			//DTO에 저장
			
			while(rs.next()) {
				Car c = new Car();
				//수정전
				c.setCarNum(rs.getString("CAR_NUM"));
				c.setCarName(rs.getString("CAR_NAME"));
				c.setCarCategory(rs.getString("CAR_CATEGORY"));
				c.setCarOil(rs.getString("CAR_OIL"));
				c.setCarCondi(rs.getString("CAR_CONDI"));
				c.setCarLCD(rs.getString("CAR_LCD"));
				list.add(c);
			}
			
			
			return list;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			
				try {
					if(rs != null) rs.close();
					if(pst != null) pst.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		return null;
	}
	public Car carselect(String car) {
		
		Car c = new Car();
		String sql = "SELECT CAR_NUM, CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI, CAR_LCD" 
						+ " FROM TB_CAR WHERE CAR_NAME=?";
		
		try {
			st = conn.createStatement();
			pst = conn.prepareStatement(sql);
			pst.setString(1, car);
			rs = pst.executeQuery();
			
			//DTO에 저장
			while(rs.next()) {
				//수정전
				c.setCarNum(rs.getString("CAR_NUM"));
				c.setCarName(rs.getString("CAR_NAME"));
				c.setCarCategory(rs.getString("CAR_CATEGORY"));
				c.setCarOil(rs.getString("CAR_OIL"));
				c.setCarCondi(rs.getString("CAR_CONDI"));
				c.setCarLCD(rs.getString("CAR_LCD"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			
				try {
					if(rs != null) rs.close();
					if(pst != null) pst.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		return c;
	}

	@Override
	public List coupon_list() {
		String sql = "SELECT COU_NUM, COU_NAME, COU_START, COU_END, COU_DISCOUNT, COU_AGE_CONST, COU_TIME_CONST, COU_CAR_CONST" 
				+ " FROM TB_COUPON";
		
		List list = new ArrayList<>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			//DTO에 저장
			
			while(rs.next()) {
				//수정전
				Coupon p = new Coupon();
				p.setNo(rs.getInt("COU_NUM"));
				p.setName(rs.getString("COU_NAME"));
				p.setDiscount(rs.getString("COU_DISCOUNT"));
				p.setStartDate(rs.getString("COU_START"));
				p.setEndDate(rs.getString("COU_END"));
				p.setAgeConst(rs.getString("COU_AGE_CONST"));
				p.setTimeConst(rs.getString("COU_TIME_CONST"));
				p.setCarConst(rs.getString("COU_CAR_CONST"));
				
				
			
				list.add(p);
			}
			
			
			return list;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			
				try {
					if(rs != null) rs.close();
					if(pst != null) pst.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		return null;
	}
	public Coupon couponselect(String coupon) {
		
		Coupon p = new Coupon();
		String sql = "SELECT COU_NUM, COU_NAME, COU_START, COU_END, COU_DISCOUNT, COU_AGE_CONST, COU_TIME_CONST, COU_CAR_CONST"
				+ " FROM tb_coupon WHERE COU_NAME=?";
		
		try {
			st = conn.createStatement();
			pst = conn.prepareStatement(sql);
			pst.setString(1, coupon);
			rs = pst.executeQuery();
			
			//DTO에 저장
			while(rs.next()) {
				//수정전
				p.setNo(rs.getInt("COU_NUM"));
				p.setName(rs.getString("COU_NAME"));
				p.setDiscount(rs.getString("COU_DISCOUNT"));
				p.setStartDate(rs.getString("COU_START"));
				p.setEndDate(rs.getString("COU_END"));
				p.setAgeConst(rs.getString("COU_AGE_CONST"));
				p.setTimeConst(rs.getString("COU_TIME_CONST"));
				p.setCarConst(rs.getString("COU_CAR_CONST"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			
				try {
					if(rs != null) rs.close();
					if(pst != null) pst.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		return p;
	}
	

	@Override
	public void insertRES(Reservation res, Coupon cou) {
			// TODO Auto-generated method stub
		String sql = "INSERT INTO TB_RESERVATION(RES_NUM, MEM_ID, EVE_NUM, CAR_NUM, OPTION_LIST, RES_START, RES_END)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?)";
	
	try {
		/*pst.setInt(1, 12345);//로그인 가능시 완료
		pst.setString(2, res.getMEM_ID());//로그인 가능시 완료
		pst.setInt(3, res.getEVE_NUM());
		pst.setInt(4, res.getCAR_NUM());
		pst.setString(5, res.getOPTION_LIST());
		pst.setString(6, res.getRES_START());
		pst.setString(7, res.getRES_END());
		pst.setString(8, cou.getCou_name());*/
		
		pst.setInt(1, res.getResNum());
		pst.setString(2, res.getMemId());
		pst.setString(3, res.getCarNum());
		pst.setString(4, res.getResStart());
		pst.setString(5 , res.getResEnd());
		pst.setInt(6, res.getCouNum());
		pst.setString(7, res.getOptionList());
		pst.setString(8, res.getCarDemage());

		pst.executeUpdate();
		
		conn.commit();
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			
	}
}
