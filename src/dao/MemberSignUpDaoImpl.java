package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Member;

public class MemberSignUpDaoImpl implements MemberSignUpDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	public MemberSignUpDaoImpl(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void insertAllData(Member mem) {
		String sql = "INSERT INTO TB_MEMBER(MEM_ID,MEM_PW, MEM_NAME, MEM_PHONE, MEM_JUMIN, MEM_EMAIL, MEM_ADDR,MEM_GUBN)"
				+ " VALUES(?,?,?,?,?,?,?,?)";
		//Id, Pw, Name, Phone, Jumin(int), Email, Addr순서
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			pst.setString(2, mem.getMemPw());
			pst.setString(3, mem.getMemName());
			pst.setString(4, mem.getMemPhone());
			pst.setString(5, mem.getMemJumin());
			pst.setString(6, mem.getMemEmail());
			pst.setString(7, mem.getMemAddr());
			pst.setInt(8, 1);
			
			
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public String getId(Member mem) {
		return mem.getMemId();
	}
	@Override
	public String getPw(Member mem) {
		// TODO Auto-generated method stub
		return mem.getMemPw();
	}
	@Override
	public String getName(Member mem) {
		// TODO Auto-generated method stub
		return mem.getMemName();
	}
	@Override
	public String getJumin(Member mem) {
		// TODO Auto-generated method stub
		return mem.getMemJumin();
	}
	@Override
	public String getPhone(Member mem) {
		// TODO Auto-generated method stub
		return mem.getMemPhone();
	}
	@Override
	public String getAddr(Member mem) {
		// TODO Auto-generated method stub
		return mem.getMemAddr();
	}
	@Override
	public String getEmail(Member mem) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
