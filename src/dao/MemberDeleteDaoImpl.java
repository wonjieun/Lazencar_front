package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Member;

public class MemberDeleteDaoImpl implements MemberDeleteDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	
	private Connection conn = null;
	private Statement st = null;
//	private PreparedStatement pst = null;
//	private ResultSet rs = null;

	public MemberDeleteDaoImpl() {
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
	public void deleteMemData(Member mem) {
		String sql = "DELETE from TB_MEMBER"
				+ " WHERE mem_id=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			
			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean deleteData(Member mem) {
		String sql = "SELECT MEM_PW FROM TB_MEMBER"
					+ " WHERE MEM_ID=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String dbPw = "";	//db내 비번 저장 변수
		
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			
			rs = pst.executeQuery();
			if(rs.next()) {
				dbPw = rs.getString("MEM_PW");
				if(dbPw.equals(mem.getMemPw())) {
					//비밀번호 일치 & 삭제 진행
//					deleteLicenData(mem);
					deleteMemData(mem);
//					System.out.println("test4");
//					System.out.println("여기 통과는 하겠지?");
					return true;
					
				} else {
					//비밀번호 불일치
//					System.out.println("test5");
//					System.out.println("설마 여기도 통과?");
					return false;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return true;
		
	}

	

	@Override
	public void deleteLicenData(Member mem) {
		String sql = "DELETE from TB_LICENSE"
				+ " WHERE mem_id=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			
			
			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}


	
	
}
