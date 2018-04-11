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
import dto.Notice;
import dto.adminDto.NoticeManage;
import util.Paging;

public class NoticeListDaoImpl implements NoticeListDao {

	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;

	public NoticeListDaoImpl() {

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
	public boolean doSearch(NoticeManage nm) {
		if("clicked".equals(nm.getClicked())) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public List getList(Paging paging, NoticeManage nm) {
		if(doSearch(nm) == true) {
			System.out.println("nmSearch"+doSearch(nm));
			return getSearchList(paging, nm);
		}else {
			return getAllList(paging);
		}
	}
	
	@Override
	public int getTotal(NoticeManage nm) {
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement pst = null;

		String sql = "SELECT COUNT(*) FROM TB_Notice";
		String sql2 = "SELECT count(*) from (" 
				+ " SELECT * " + "  FROM TB_Notice WHERE "
				+ nm.getCategory() + " LIKE '%' || ? || '%')";
		int total = 0;

		try {
			if (doSearch(nm) == false) {
				st = conn.createStatement();
				rs = st.executeQuery(sql);

				rs.next();
				total = rs.getInt(1);
			} else {
				pst = conn.prepareStatement(sql2);
				pst.setString(1, nm.getContent());

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
	public List getAllList(Paging paging) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Notice> list = new ArrayList<>();
		// list = null;
		String sql = "SELECT * FROM (" + " SELECT rownum rnum, b.* FROM ("
				+ " 	SELECT NOT_NUM, NOT_TItle, NOT_CONTENT, NOT_DATE, NOT_EMAIL, NOT_FILE" + " 	FROM TB_NOTICE"
				+ " 	ORDER BY NOT_NUM DESC" + " ) b" + " ORDER BY rnum" + ") WHERE rnum BETWEEN ? AND ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());

			rs = pst.executeQuery();

			while (rs.next()) {
				Notice not = new Notice();
				not.setNotNum(rs.getInt("not_Num"));
				not.setNotTitle(rs.getString("not_TItle"));
				not.setNotContent(rs.getString("not_Content"));
				not.setNotDate(rs.getString("not_Date"));
				not.setNotEmail(rs.getString("not_Email"));
				
				if(rs.getString("not_File") != null) {
					not.setNotFile(rs.getString("not_File"));
				}
				
				list.add(not);
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
	public List getSearchList(Paging paging, NoticeManage nm) {
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList<>();
		String sql = "SELECT * FROM(" + " SELECT ROWNUM RNUM, B.* FROM("
				+ " 	SELECT NOT_NUM, NOT_TItle, NOT_CONTENT, NOT_DATE, NOT_EMAIL, NOT_FILE" + "  FROM TB_NOTICE WHERE "
				+ nm.getCategory() + " LIKE '%' || ? || '%' ORDER BY " + nm.getSort() + " DESC )B" + " ORDER BY RNUM"
				+ ") WHERE RNUM BETWEEN ? AND ?";
		
		
		
		System.out.println("sql = "+sql);
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, nm.getContent());
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());

			rs = pst.executeQuery();

			System.out.println(paging);
			while (rs.next()) {
				Notice not = new Notice();
				not.setNotNum(rs.getInt("not_Num"));
				not.setNotTitle(rs.getString("not_TItle"));
				not.setNotContent(rs.getString("not_Content"));
				not.setNotDate(rs.getString("not_Date"));
				not.setNotEmail(rs.getString("not_Email"));
				not.setNotFile(rs.getString("not_File"));

				list.add(not);
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
	public void updateNotice(NoticeManage nm) {
		PreparedStatement pst = null;

		String sql1 ="update tb_Notice set not_title = ? where not_Num=?";
		String sql2 ="update tb_Notice set not_content = ? where not_Num=?";
		String sql3 ="update tb_notice set not_title = ? , not_content= ? where not_num=?";
		try {
			if(nm.getKey_notContent() == "" || nm.getKey_notContent()==null) {
				pst = conn.prepareStatement(sql1);
				pst.setString(1, nm.getKey_notTitle());
				pst.setString(2, nm.getKey_notNum());
				pst.executeUpdate();
				
			}else if(nm.getKey_notTitle()=="" || nm.getKey_notTitle()==null) {
				pst = conn.prepareStatement(sql2);
				pst.setString(1, nm.getKey_notContent());
				pst.setString(2, nm.getKey_notNum());
				pst.executeUpdate();
			}
			else if(nm.getKey_notContent() != null && nm.getKey_notTitle() != null){
				pst = conn.prepareStatement(sql3);
				pst.setString(1, nm.getKey_notTitle());
				pst.setString(2, nm.getKey_notContent());
				pst.setString(3, nm.getKey_notNum());
				pst.executeUpdate();
			}
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

	@Override
	public void deleteNotice(NoticeManage nm) {
		PreparedStatement pst = null;
		String sql = "DELETE TB_NOTICE WHERE NOT_NUM = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, nm.getKey_notNum());
			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pst != null)
					pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
