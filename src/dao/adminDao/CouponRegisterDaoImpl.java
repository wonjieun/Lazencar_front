package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.fileupload.FileItem;

import dto.Coupon;

public class CouponRegisterDaoImpl implements CouponRegisterDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	public CouponRegisterDaoImpl(){
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
	public void insertAllData(Coupon dto) {
		String sql = "INSERT INTO TB_COUPON(COU_NUM, COU_NAME, COU_START, COU_END,"
				+ " COU_DISCOUNT, COU_AGE_CONST, COU_TIME_CONST, COU_CAR_CONST, COU_IMG)"
				+ " VALUES(UP_COU_NUM.nextval,?,?,?,?,?,?,?,?)";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getName());
			pst.setString(2, dto.getStartDate());
			pst.setString(3, dto.getEndDate());			
			pst.setString(4, dto.getDiscount());			
			pst.setString(5, dto.getAgeConst());			
			pst.setString(6, dto.getTimeConst());			
			pst.setString(7, dto.getCarConst());			
			pst.setString(8, dto.getCouponImg());			
			pst.executeUpdate();
			
			
			System.out.println("쿠폰명 : "+dto.getName());
			System.out.println("시작일 : "+dto.getStartDate());
			System.out.println("종료일 : "+dto.getEndDate());
			System.out.println("할인율 : "+dto.getDiscount());
			System.out.println("나이 : "+dto.getAgeConst());
			System.out.println("시간 : "+dto.getTimeConst());
			System.out.println("차종 : "+dto.getCarConst());
			System.out.println("이미지 : "+dto.getCouponImg());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pst!=null)	pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	/*
	
	

	public List getImage() {
		Statement st = null;
		String sql = "SELECT EVE_NAME, EVE_SATART_DATE, EVE_END_DATE,"
				+ " EVE_BANNER_IMG, EVE_BANNER_ORG, EVE_DETAIL_IMG, EVE_DETAIL_ORG"
				+ " FROM TB_EVENT ORDER BY EVE_NUM";
		List<PromotionManage> list = new ArrayList<>();
		
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while( rs.next() ) {
				PromotionManage dto = new PromotionManage();
				dto.setName(rs.getString("EVE_NAME"));
				dto.setStartDate(rs.getString("EVE_START_DATE"));
				dto.setEndDate(rs.getString("EVE_END_DATE"));
				dto.setBannerImg(rs.getString("EVE_BANNER_IMG"));
				dto.setBannerOrg(rs.getString("EVE_BANNER_ORG"));
				dto.setDetailImg(rs.getString("EVE_DETAIL_IMG"));
				dto.setDetailImg(rs.getString("EVE_DETAIL_ORG"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null)	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	public PromotionManage getImage(String name) {
		Statement st = null;
		String sql = "SELECT EVE_NAME, EVE_SATART_DATE, EVE_END_DATE,"
				+ " EVE_BANNER_IMG, EVE_BANNER_ORG, EVE_DETAIL_IMG, EVE_DETAIL_ORG"
				+ " FROM TB_EVENT WHERE EVE_NAME="+name;
		
		PromotionManage dto = null;
		
		try {
			st = conn.createStatement();
			
			ResultSet rs = st.executeQuery(sql);
			
			rs.next();
			dto = new PromotionManage();
			dto.setName(rs.getString("EVE_NAME"));
			dto.setStartDate(rs.getString("EVE_START_DATE"));
			dto.setEndDate(rs.getString("EVE_END_DATE"));
			dto.setBannerImg(rs.getString("EVE_BANNER_IMG"));
			dto.setBannerOrg(rs.getString("EVE_BANNER_ORG"));
			dto.setDetailImg(rs.getString("EVE_DETAIL_IMG"));
			dto.setDetailImg(rs.getString("EVE_DETAIL_ORG"));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null)	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	*/
	
	
	
}

