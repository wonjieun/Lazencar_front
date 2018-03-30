package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Member;

public class LoginDaoImpl implements LoginDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
//	private ResultSet rs = null;

	public LoginDaoImpl() {
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
	public boolean check(Member mem) {
		String sql = "SELECT count(*) from TB_MEMBER"
				+ " WHERE mem_id=? AND mem_pw=?";
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			pst.setString(2, mem.getMemPw());
			
			rs = pst.executeQuery();
			rs.next();
			
			int result = rs.getInt(1);
			if(result > 0) {
				return true;
			} else {
				return false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	@Override
	public int getGubn(Member m) {
		String sql = "SELECT mem_gubn FROM TB_MEMBER"
				+ " WHERE mem_id=?";
		ResultSet rs = null;
		
		try {
			System.out.println("ID: " + m.getMemId());
			pst = conn.prepareStatement(sql);
			pst.setString(1, m.getMemId());
			
			rs = pst.executeQuery();
			rs.next();
			System.out.println(rs.getInt(1));
			
			// 테이블 조회시 키값이 1번째인 값 리턴
			return rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;		
	}

}
