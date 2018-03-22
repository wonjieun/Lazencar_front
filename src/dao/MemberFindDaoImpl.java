package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Member;

public class MemberFindDaoImpl implements MemberFindDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
//	private ResultSet rs = null;

	public MemberFindDaoImpl() {
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
	public boolean checkName(Member mem) {
		// 아이디 찾기에서 이름을 기준으로 있나 없나 체크.
		String sql = "SELECT count(*) from TB_MEMBER where MEM_NAME=?";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemName());

			rs = pst.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			if(result >0) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public String getId(Member mem) {
		String sql = "select mem_Id from TB_MEMBER where mem_name=?";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemName());
			rs = pst.executeQuery();
			while(rs.next())
			{
				mem.setMemId(rs.getString("MEM_ID"));
			}
			return mem.getMemId();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	@Override
	public boolean checkEmail(Member mem) {
		// 아이디찾기에서 Email를 기준으로 있나없나 체크
		String sql = "SELECT count(*) from tb_member where mem_Email=?";
		ResultSet rs = null;

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemEmail());
			rs = pst.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			if(result >0) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public boolean checkId(Member mem) {
		// 비밀번호 찾기에서 Id를 기준으로 있나없나 체크(아직 미구현)
		String sql = "SELECT count(*) from tb_member where mem_Id=?";
		ResultSet rs = null;

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			rs = pst.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			if(result >0) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean checkPhone(Member mem) {
		String sql = "SELECT count(*) from tb_member where mem_Phone=?";
		ResultSet rs = null;
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemPhone());
			rs = pst.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			if(result >0) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	

	@Override
	public String getPw(Member mem) {
		String sql = "select mem_Pw from TB_MEMBER where mem_Id=?";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			rs = pst.executeQuery();
			while(rs.next())
			{
				mem.setMemPw(rs.getString("MEM_PW"));
			}
			return mem.getMemPw();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
