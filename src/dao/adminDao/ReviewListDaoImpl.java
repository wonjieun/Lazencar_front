package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Car;
import dto.Review;
import dto.adminDto.ReviewManage;
import util.Paging;

public class ReviewListDaoImpl implements ReviewListDao {

	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	
	public ReviewListDaoImpl() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	@Override
	public boolean doSearch(ReviewManage rm) {
		if ("clicked".equals(rm.getClicked())) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public int getTotal(ReviewManage rm) {
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement pst = null;

		String sql = "SELECT COUNT(*) FROM TB_Review";
		String sql2 = "SELECT count(*) from (" 
				+ " SELECT * " + "  FROM TB_Review WHERE "
				+ rm.getCategory() + " LIKE '%' || ? || '%')";
		int total = 0;

		try {
			if (doSearch(rm) == false) {
				st = conn.createStatement();
				rs = st.executeQuery(sql);

				rs.next();
				total = rs.getInt(1);
			} else {
				pst = conn.prepareStatement(sql2);
				pst.setString(1, rm.getContent());

				rs = pst.executeQuery();
				rs.next();
				total = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return total;
	}

	@Override
	public List getList(Paging paging, ReviewManage rm) {
		if (doSearch(rm) == true) {
			System.out.println("rmsearch" +doSearch(rm));
			return getSearchList(paging, rm);
		} else {
			// 만약에 검색버튼을 누르지 않았을 경우(default) 전체 정보를 우선적으로 보여줌
			return getAllList(paging);
		}
	}

	

	@Override
	public List getAllList(Paging paging) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Review> list = new ArrayList<>();
		// list = null;
		String sql = "SELECT * FROM (" + " SELECT rownum rnum, b.* FROM ("
				+ " 	SELECT *" + " 	FROM tb_review"
				+ " 	ORDER BY rev_num ASC" + " ) b" + " ORDER BY rnum" + ") WHERE rnum BETWEEN ? AND ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());

			rs = pst.executeQuery();

			while (rs.next()) {
				Review rev = new Review();
				rev.setRev_num(rs.getInt("rev_num"));
				rev.setRev_title(rs.getString("rev_title"));
				rev.setRev_userId(rs.getString("mem_id"));
				rev.setRev_content(rs.getString("rev_content"));
				rev.setRev_date(rs.getString("rev_date"));
				rev.setRev_views(rs.getInt("rev_views"));
				
				
				list.add(rev);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List getSearchList(Paging paging, ReviewManage rm) {
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList<>();
		String sql = "SELECT * FROM(" + " SELECT ROWNUM RNUM, B.* FROM("
				+ " 	SELECT *" + "  FROM tb_review WHERE "
				+ rm.getCategory() + " LIKE '%' || ? || '%' ORDER BY " + rm.getSort() + " ASC )B" + " ORDER BY RNUM"
				+ ") WHERE RNUM BETWEEN ? AND ?";
		
		
		System.out.println("sql = "+sql);
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, rm.getContent());
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());

			rs = pst.executeQuery();

			System.out.println(paging);
			while (rs.next()) {
				Review rev = new Review();
				rev.setRev_num(rs.getInt("rev_num"));
				rev.setRev_title(rs.getString("rev_title"));
				rev.setRev_userId(rs.getString("mem_id"));
				rev.setRev_content(rs.getString("rev_content"));
				rev.setRev_date(rs.getString("rev_date"));
				rev.setRev_views(rs.getInt("rev_views"));
				
				
				list.add(rev);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public void deleteReview(ReviewManage rm) {
		PreparedStatement pst = null;
		String sql = "delete tb_review where rev_num = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, rm.getKey_revNum());
			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pst != null)
					pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
