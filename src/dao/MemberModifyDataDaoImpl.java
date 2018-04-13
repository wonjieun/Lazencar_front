package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Member;

public class MemberModifyDataDaoImpl implements MemberModifyDataDao {
	
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
//	private Statement st = null;
//	private PreparedStatement pst = null;
	
	public MemberModifyDataDaoImpl(){
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
	public Member getMemData(String id) {
		String sql = "SELECT *"
				+ " FROM TB_MEMBER"
				+ " WHERE MEM_ID=?";
		Member member = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			
			
			rs = pst.executeQuery();
			if(rs.next()) {
				String mail = rs.getString("MEM_EMAIL");
				int idx = mail.indexOf("@");
				String MEM_MAIL1 = mail.substring(0,idx);
				String MEM_MAIL2 = mail.substring(idx+1);
				
				String jumin = rs.getString("MEM_JUMIN");
				String MEM_JUMIN1 = jumin.substring(0, 6);
				String MEM_JUMIN2 = jumin.substring(6, 12);
//				
				String phone = rs.getString("MEM_PHONE");
				String MEM_PHONE1 = phone.substring(0, 3);
				String MEM_PHONE2 = phone.substring(3, 7);
				String MEM_PHONE3 = phone.substring(7, 11);
				
				String addr = rs.getString("MEM_ADDR");
				String[] addrsp = addr.split("/");
				String MEM_ZIP = addrsp[0];
				String MEM_ADDR1 = addrsp[1];
				String MEM_ADDR2 = addrsp[2];
				
				member = new Member();
				
				member.setMemId(rs.getString("MEM_ID"));
				member.setMemPw(rs.getString("MEM_PW"));
				member.setMemName(rs.getString("MEM_NAME"));
				member.setMemPhone1(MEM_PHONE1);
				member.setMemPhone2(MEM_PHONE2);
				member.setMemPhone3(MEM_PHONE3);
				member.setMemJumin1(MEM_JUMIN1);
				member.setMemJumin2(MEM_JUMIN2);
				member.setMemEmail1(MEM_MAIL1);
				member.setMemEmail2(MEM_MAIL2);
				member.setMemZip(MEM_ZIP);
				member.setMemAddr1(MEM_ADDR1);
				member.setMemAddr2(MEM_ADDR2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
				try {
					if(pst != null) pst.close();
					if(rs != null) rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		return member;
	}
	

	
	public void updateData(Member mem) {
		String sql = "UPDATE TB_MEMBER SET"
				+ " MEM_PW=?, MEM_PHONE=?, MEM_EMAIL=?, MEM_ADDR=?"
				+ " WHERE MEM_ID=?";
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemPw());
			pst.setString(2, mem.getMemPhone());
			pst.setString(3, mem.getMemEmail());
			pst.setString(4, mem.getMemAddr());
			pst.setString(5, mem.getMemId());
			
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
