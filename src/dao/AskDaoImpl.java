package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Ask;
import dto.Paging;
import dto.Review;

public class AskDaoImpl implements AskDao {
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private ResultSet rs;

	public AskDaoImpl() {
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
	public int getSeq() {
		
		String sql =  "SELECT ASK_NUM FROM TB_ASK ORDER BY ASK_NUM DESC";
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()) {
				
				return rs.getInt(1) + 1;
			}
			
			return 1; // 현재가 첫번째 글 일 경우
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

		return -1; // 디비 오류나면
	}
	
	@Override
	public int ask(String ask_title, String ask_content, String ask_userId) {
		
		String sql =  "INSERT INTO TB_ASK VALUES (?, ?, ?, ?, ?, sysdate)";
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, getSeq());
			pst.setString(2, ask_userId);
			pst.setString(3, ask_title);
			pst.setString(4, ask_content);
			pst.setInt(5, 1234);
			
			return pst.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

		return -1; // 디비 오류나면
	}

	@Override
	public int getTotal() {
		
		Statement st = null;
		ResultSet rs = null;

		String sql="SELECT COUNT(*) FROM TB_ASK";

		int total = 0;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			rs.next();
			
			total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
				if(rs!=null)	rs.close();
				if(st!=null)	st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return total;
	}

	@Override
	public List getList(Paging paging) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Ask> list = new ArrayList<>();
		
		String sql =
				"SELECT * FROM ("
				+ " SELECT rownum rnum, b.* FROM ("
				+ " 	SELECT *"
				+ " 	FROM TB_ASK"
				+ " 	ORDER BY ASK_NUM DESC"
				+ " ) b"
				+ " ORDER BY rnum"
				+ ") WHERE rnum BETWEEN ? AND ?";
					
		try {
			pst = conn.prepareStatement(sql);

			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				Ask ask = new Ask();
				ask.setAsk_num(rs.getInt("Ask_NUM"));
				ask.setAsk_title(rs.getString("Ask_TITLE"));
				ask.setAsk_userId(rs.getString("MEM_ID"));
				ask.setAsk_date(rs.getString("Ask_DATE"));
				ask.setAsk_content(rs.getString("Ask_CONTENT"));
				list.add(ask);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)	rs.close();
				if(pst!=null)	pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;			
	}
}
