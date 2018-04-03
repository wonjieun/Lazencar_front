package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Member;

public class MemberLicenDataDaoImpl implements MemberLicenDataDao {
	
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
//	private Statement st = null;
//	private PreparedStatement pst = null;
	
	public MemberLicenDataDaoImpl(){
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
	public void updateLicenData(Member mem) {
		String sql1 = "SELECT COUNT(*) FROM TB_LICENSE";
		
		
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql1);
			rs = pst.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			if(result==0) {
				String sql3 = "INSERT INTO"
						+ " TB_LICENSE(MEM_NAME, MEM_JUMIN, LICEN_TYPE, LICEN_NUM, LICEN_ISSUEDATE, LICEN_LIMITDATE, LICEN_ADDR)"
						+ " VALUES( ?, ?, ?, ?, ?, ?, ?)";
					pst = conn.prepareStatement(sql3);
					pst.setString(1, mem.getMemName());
					pst.setString(2, mem.getMemJumin());
					pst.setString(3, mem.getLicenType());
					pst.setString(4, mem.getLicenNum());
					pst.setString(5, mem.getLicenIssueDate());
					pst.setString(6, mem.getLicenLimitDate());
					pst.setString(7, mem.getLicenAddr());
					pst.executeUpdate();
				
				
			} else {
					String sql2 = "UPDATE TB_LICENSE SET"
							+ " LICEN_TYPE=?, LICEN_NUM=?, LICEN_ISSUEDATE=?, LICEN_LIMITDATE=?, LICEN_ADDR=?"
							+ " WHERE MEM_JUMIN=?";
					pst = conn.prepareStatement(sql2);
					pst.setString(1, mem.getLicenType());
					pst.setString(2, mem.getLicenNum());
					pst.setString(3, mem.getLicenIssueDate());
					pst.setString(4, mem.getLicenLimitDate());
					pst.setString(5, mem.getLicenAddr());
					pst.setString(6, mem.getMemJumin());
					System.out.println("여기까지..?");
					pst.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	}
	

	
}
