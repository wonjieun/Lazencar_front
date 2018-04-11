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
import util.Paging;

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
	public List getList() {
		List<Notice> list = new ArrayList<>();
		String sql = "SELECT * FROM TB_NOTICE";
//		String sql = "SELECT * FROM TB_NOTICE";
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
//			rs.next();
//			System.out.println(rs.getString("NOT_TITLE"));
			while(rs.next()) {
				Notice notice = new Notice();
				// dto.setter(rs.getter("DB 컬럼명") )
				notice.setNotNum(rs.getString("NOT_NUM"));
				notice.setNotTitle(rs.getString("NOT_TITLE"));
				notice.setNotDate(rs.getString("NOT_DATE"));
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List getTitle(Notice n) {
		List<Notice> list = new ArrayList<>();
		String sql = "SELECT * FROM TB_NOTICE"
				+ " WHERE NOT_TITLE LIKE '%' || ? || '%'";
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, n.getSearchWord());
			rs = pst.executeQuery();
//			rs.next();
//			System.out.println(rs.getString("NOT_TITLE"));
			while(rs.next()) {
				Notice notice = new Notice();
			// dto.setter(rs.getter("DB 컬럼명") )
				notice.setNotNum(rs.getString("NOT_NUM"));
				System.out.println("num: " + rs.getString("NOT_NUM"));
				notice.setNotTitle(rs.getString("NOT_TITLE"));
				System.out.println("title: " + rs.getString("NOT_TITLE"));
				notice.setNotDate(rs.getString("NOT_DATE"));
				System.out.println("date: " + rs.getString("NOT_DATE"));
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List getNotice(Notice n) {
		List<Notice> list = new ArrayList<>();
		String sql = "SELECT * FROM TB_NOTICE"
				+ " WHERE NOT_NUM=?";
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, n.getNotNum());
			rs = pst.executeQuery();
//			rs.next();
//			System.out.println(rs.getString("NOT_TITLE"));
			while(rs.next()) {
				Notice notice = new Notice();
			// dto.setter(rs.getter("DB 컬럼명") )
				notice.setNotTitle(rs.getString("NOT_TITLE"));
				System.out.println("title: " + rs.getString("NOT_TITLE"));
				notice.setNotDate(rs.getString("NOT_DATE"));
				System.out.println("date: " + rs.getString("NOT_DATE"));
				notice.setNotContent(rs.getString("NOT_CONTENT"));
				System.out.println("date: " + rs.getString("NOT_CONTENT"));
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
