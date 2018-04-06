package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.fileupload.FileItem;

import dto.Promotion;

public class PromotionRegisterDaoImpl implements PromotionRegisterDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	public PromotionRegisterDaoImpl(){
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
	public void insertAllData(Promotion pro) {
		String sql = "INSERT INTO TB_EVENT(EVE_NUM, EVE_NAME, EVE_START, EVE_END, EVE_BANNER_IMG, EVE_DETAIL_IMG)"
				+ " VALUES(UP_COU_NUM.nextval,?,?,?,?,?)";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, pro.getName());
			pst.setString(2, pro.getStartDate());
			pst.setString(3, pro.getEndDate());			
			pst.setString(4, pro.getBannerImg());			
			pst.setString(5, pro.getDetailImg());			
			pst.executeUpdate();
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
	
	
	@Override
	public boolean existName(String eveName) {
		String sql = "SELECT COUNT(*) FROM TB_EVENT WHERE eve_name = '" + eveName + "'";
		
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);

			rs.next();
			
			if( rs.getInt(1) > 0 )	return true;
			else return false;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(st!=null)	st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
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

