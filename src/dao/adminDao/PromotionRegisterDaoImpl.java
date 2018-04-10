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
			pst.setString(2, pro.getProStartDate());
			pst.setString(3, pro.getProEndDate());			
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
	
	
}

