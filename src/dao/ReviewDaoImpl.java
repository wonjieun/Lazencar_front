package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Paging;
import dto.Review;

public class ReviewDaoImpl implements ReviewDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private ResultSet rs;

	public ReviewDaoImpl() {
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
	public String getDate() {
		
		String sql =  "SELECT to_char(sysdate,’yy-mm-dd’) FROM dual";
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()) {
				
				return rs.getString(1);
				
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

		return ""; // 디비 오류나면
	}
	
	@Override
	public int getNext() {
		
		String sql =  "SELECT REV_NUM FROM TB_REVIEW ORDER BY REV_NUM DESC";
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()) {
				
				return rs.getInt(1) + 1;
			}
			
			return 1; // 현재가 첫번째 게시물일 경우
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

		return -1; // 디비 오류나면
	}
	
	@Override
	public int write(String rev_title, String rev_content) {
		
		String sql =  "INSERT INTO TB_REVIEW VALUES (?, ?, ?, ?, sysdate, ?, ?, ?)";
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, getNext());
			pst.setString(2, "김영기");
			pst.setString(3, rev_title);
//			pst.setString(4, rev_date);
			pst.setString(4, rev_content);
			pst.setInt(5, 1);
			pst.setInt(6, 0);
			pst.setInt(7, 1);
			
			return pst.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

		return -1; // 디비 오류나면
	}
	
	// 페이징 처리하여 게시물 리스트 가져오기
	@Override
	public List getList(Paging paging) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Review> list = new ArrayList<>();
		
		String sql =
				"SELECT * FROM ("
				+ " SELECT rownum rnum, b.* FROM ("
				+ " 	SELECT *"
				+ " 	FROM TB_REVIEW"
				+ " 	ORDER BY REV_NUM DESC"
				+ " ) b"
				+ " ORDER BY rnum"
				+ ") WHERE rnum BETWEEN ? AND ?";
					
		try {
			pst = conn.prepareStatement(sql);

			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				Review rev = new Review();
				rev.setRev_num(rs.getInt("REV_NUM"));
				rev.setRev_title(rs.getString("REV_TITLE"));
				rev.setRev_userId(rs.getString("MEM_ID"));
				rev.setRev_date(rs.getString("REV_DATE"));
				rev.setRev_content(rs.getString("REV_CONTENT"));
				rev.setRev_views(rs.getInt("REV_VIEWS"));
				rev.setRev_hit(rs.getInt("REV_HIT"));
				rev.setRev_avail(rs.getInt("REV_AVAILABLE"));
				list.add(rev);
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
	
	// 총 게시물 수 반환
	@Override
	public int getTotal() {
		Statement st = null;
		ResultSet rs = null;

		String sql="SELECT COUNT(*) FROM TB_REVIEW";

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
	
	public Review getReview(int rev_num) {
		
		String sql = "SELECT * FROM TB_REVIEW WHERE REV_NUM = ?";
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, rev_num);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				
				Review rev = new Review();
				rev.setRev_num(rs.getInt("REV_NUM"));
				rev.setRev_title(rs.getString("REV_TITLE"));
				rev.setRev_userId(rs.getString("MEM_ID"));
				rev.setRev_date(rs.getString("REV_DATE"));
				rev.setRev_content(rs.getString("REV_CONTENT"));
				rev.setRev_views(rs.getInt("REV_VIEWS"));
				rev.setRev_hit(rs.getInt("REV_HIT"));
				rev.setRev_avail(rs.getInt("REV_AVAILABLE"));
				return rev;
				
			}
			
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}    
		
		return null;

	}
}
