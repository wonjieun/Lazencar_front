package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Notice;

public class NoticeRegistDaoImpl implements NoticeRegistDao{
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	
	private Connection conn = null;
	public NoticeRegistDaoImpl(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertAllData(Notice not) {
		PreparedStatement pst = null;
		
		String sql = "INSERT INTO TB_NOTICE(NOT_NUM, NOT_TITLE, NOT_CONTENT, NOT_DATE, NOT_FILE)"
				+ " VALUES(UP_NOT_NUM.NEXTVAL, ?,?,SYSDATE,?)";
		
		try {
			
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, not.getNotTitle());
			pst.setString(2, not.getNotContent());
			pst.setString(3, not.getNotFile());
			
			pst.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
