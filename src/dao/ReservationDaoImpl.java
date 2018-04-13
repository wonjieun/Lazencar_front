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
import dto.Damage;
import dto.Etc;

public class ReservationDaoImpl implements ReservationDao{
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username ="lazencar";
	private final String password ="saveus";
	
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
		String sql = "SELECT CAR_NUM, CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI, CAR_LCD, CAR_PRICE" 
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
				c.setCarPrice(rs.getInt("CAR_PRICE"));
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
		String sql = "SELECT CAR_NUM, CAR_NAME, CAR_CATEGORY, CAR_OIL, CAR_CONDI, CAR_LCD, CAR_PRICE" 
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
				c.setCarPrice(rs.getInt("CAR_PRICE"));
				
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
	
	//시작1
	@Override
	public List damage_list() {
		String sql = "SELECT CAR_DAMAGESEL, CAR_DAMAGEPRICE" 
				+ " FROM TB_SELOPTION";
		
		List list = new ArrayList<>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			//DTO에 저장
			
			while(rs.next()) {
				Damage d = new Damage();
				//수정전
				d.setCarDamageSel(rs.getString("CAR_DAMAGESEL"));
				d.setCarDamagePrice(rs.getInt("CAR_DAMAGEPRICE"));
				list.add(d);
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
	public Damage damageselect(String damage) {
		
		Damage d = new Damage();
		//수정전
		
		String sql = "SELECT CAR_DAMAGESEL, CAR_DAMAGEPRICE" 
						+ " FROM TB_SELOPTION WHERE CAR_DAMAGESEL=?";
		
		try {
			st = conn.createStatement();
			pst = conn.prepareStatement(sql);
			pst.setString(1, damage);
			rs = pst.executeQuery();
			
			//DTO에 저장
			while(rs.next()) {
				//수정전
				d.setCarDamageSel(rs.getString("CAR_DAMAGESEL"));
				d.setCarDamagePrice(rs.getInt("CAR_DAMAGEPRICE"));
				
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
		return d;
	}
	
	//끝1

	//시작2
	@Override
	public List etc_list() {
		String sql = "SELECT CAR_ETCCATEGORY, CAR_ETCPRICE" 
				+ " FROM TB_SELETC";
		
		List list = new ArrayList<>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			//DTO에 저장
			
			while(rs.next()) {
				Etc t = new Etc(); 
				//수정전
				t.setEtcSelect(rs.getString("CAR_ETCCATEGORY"));
				t.setEtcPrice(rs.getInt("CAR_ETCPRICE"));
				list.add(t);
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
	public Etc etcselect(String etc) {
		
		Etc t = new Etc(); 
		//수정전
		
		String sql = "SELECT CAR_DAMAGESEL, CAR_DAMAGEPRICE" 
						+ " FROM TB_SELOPTION WHERE CAR_DAMAGESEL=?";
		
		try {
			st = conn.createStatement();
			pst = conn.prepareStatement(sql);
			pst.setString(1, etc);
			rs = pst.executeQuery();
			
			//DTO에 저장
			while(rs.next()) {
				//수정전
				t.setEtcSelect(rs.getString("CAR_ETCCATEGORY"));
				t.setEtcPrice(rs.getInt("CAR_ETCPRICE"));
				
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
		return t;
	}
	//끝2
	
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
	public void insertRES(Reservation res) {
		//초기화 해주기위해 지역변수에 따로 지정헀음.
		PreparedStatement pst = null;
		
			// TODO Auto-generated method stub/- 수정전
		//180412 - DB 테이블 수정 및 다시 작성
		String sql = "INSERT INTO TB_RESERVATION(RES_NUM, MEM_ID, CAR_NUM, RES_OPTION, RES_DAMAGE, RES_TALPRICE, RES_DISPRICE, COU_NUM, RES_START, RES_END)"
				+ " VALUES (SEQ_TB_RESERVATION.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	try {
		
//		pst.setInt(1, res.getResNum());//예약 번호 DB 존재
		System.out.println("reservationdaoimpl res 출력"+ res.getMemId());
		
		pst = conn.prepareStatement(sql);
		
		
		pst.setString(1, res.getMemId());//멤버 아이디 DB 존재
		pst.setString(2, res.getCarNum());//차량 번호DB 존재
		pst.setString(3, res.getOptionList());//옵션 선택DB 존재
		pst.setString(4, res.getCarDemage());//차량 보험 선택DB 존재
		pst.setInt(5, res.getNormalPrice());//할인 전 총합계 내용DB 존재
		pst.setInt(6, res.getDcPrice());//할인 가격 내용DB 존재
		pst.setInt(7, res.getCouNum());//쿠폰
		pst.setString(8, res.getResStart());//차량 시작일DB 존재
		pst.setString(9, res.getResEnd());//차량 반납일DB 존재
		
		pst.executeUpdate();
		
		conn.commit();
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			
	}
}
