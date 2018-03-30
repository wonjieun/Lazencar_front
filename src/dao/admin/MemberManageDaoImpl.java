package dao.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.admin.MemberManage;

public class MemberManageDaoImpl implements MemberManageDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	private List<MemberManage> list = new ArrayList<>();
//	private ResultSet rs = null;

	public MemberManageDaoImpl() {
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
	public List getIdList(MemberManage mem) {
		// 회원계정으로 찾기 시 해당 아이디에 대한 정보 불러오기
		String sql = "SELECT * from TB_MEMBER where MEM_ID=?";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());

			rs = pst.executeQuery();
			
			while(rs.next()) {
				//dto.setter(rs.getter("DB 컬럼명") )
	            mem.setMemId(rs.getString("MEM_ID"));			
	            mem.setMemName(rs.getString("MEM_NAME"));
	            mem.setMemPhone(rs.getString("MEM_PHONE"));
	            mem.setMemJumin(rs.getString("MEM_JUMIN"));
	            mem.setMemEmail(rs.getString("MEM_EMAIL"));
	            mem.setMemAddr(rs.getString("MEM_ADDR"));
//	            mem.setMemLicense(rs.getString("MEM_LICENSE"));
	            list.add(mem);
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public List getJuminList(MemberManage mem) {
		// 출생년도로 찾기 시 해당 출생년도에 해당하는 회원목록 불러오기
		String sql = "SELECT count(*) from TB_MEMBER where MEM_JUMIN=?";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());

			rs = pst.executeQuery();
			
			while(rs.next()) {
				//dto.setter(rs.getter("DB 컬럼명") )
	            mem.setMemId(rs.getString("MEM_ID"));			
	            mem.setMemName(rs.getString("MEM_NAME"));
	            mem.setMemPhone(rs.getString("MEM_PHONE"));
	            mem.setMemJumin(rs.getString("MEM_JUMIN"));
	            mem.setMemEmail(rs.getString("MEM_EMAIL"));
	            mem.setMemAddr(rs.getString("MEM_ADDR"));
//	            mem.setMemLicense(rs.getString("MEM_LICENSE"));
	            list.add(mem);
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List getLicenseList(MemberManage mem) {
		// 면허 여부로 찾기 시 면허 여부에 따른 회원목록 불러오기
		String sql = "SELECT count(*) from TB_MEMBER where MEM_LICENSE=?";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				//dto.setter(rs.getter("DB 컬럼명") )
				mem.setMemId(rs.getString("MEM_ID"));			
				mem.setMemName(rs.getString("MEM_NAME"));
				mem.setMemPhone(rs.getString("MEM_PHONE"));
				mem.setMemJumin(rs.getString("MEM_JUMIN"));
				mem.setMemEmail(rs.getString("MEM_EMAIL"));
				mem.setMemAddr(rs.getString("MEM_ADDR"));
//	            mem.setMemLicense(rs.getString("MEM_LICENSE"));
				list.add(mem);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	/*
	@Override
	public String getPw(MemberManage mem) {
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
*/
}
