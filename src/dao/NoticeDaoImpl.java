package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Notice;

public class NoticeDaoImpl implements NoticeDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	public NoticeDaoImpl() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List getTitle(Notice n) {
		List<Notice> list = new ArrayList<>();
		String sql = "SELECT * FROM TB_NOTICE"
				+ " WHERE NOT_NAME LIKE '%' || ? || '%'";
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, n.getSearchWord());
			rs = pst.executeQuery();
			rs.next();
			System.out.println(rs.getString("NOT_NAME"));
			// dto.setter(rs.getter("DB 컬럼명") )
			n.setTitle(rs.getString("NOT_NAME"));
			list.add(n);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}



