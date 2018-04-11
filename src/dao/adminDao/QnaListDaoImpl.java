package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Qna;
import dto.adminDto.QnaManage;
import util.Paging;

public class QnaListDaoImpl implements QnaListDao {

	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;

	public QnaListDaoImpl() {

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
	public boolean doSearch(QnaManage qm) {
		if ("clicked".equals(qm.getClicked())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List getList(Paging paging, QnaManage qm) {
		if (doSearch(qm) == true) {
			System.out.println("qmSearch" + doSearch(qm));
			return getSearchList(paging, qm);
		} else {
			return getAllList(paging);
		}
	}

	@Override
	public int getTotal(QnaManage qm) {
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement pst = null;

		String sql = "SELECT COUNT(*) FROM TB_QNA";
		String sql2 = "SELECT count(*) from (" 
				+ " SELECT * " + "  FROM TB_QNAS WHERE "
				+ qm.getCategory() + " LIKE '%' || ? || '%')";
		int total = 0;

		try {
			if (doSearch(qm) == false) {
				st = conn.createStatement();
				rs = st.executeQuery(sql);

				rs.next();
				total = rs.getInt(1);
			} else {
				pst = conn.prepareStatement(sql2);
				pst.setString(1, qm.getContent());

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

		List<Qna> list = new ArrayList<>();
		// list = null;
		String sql = "SELECT * FROM (" + " SELECT rownum rnum, b.* FROM ("
				+ " SELECT QNA_NUM, MEM_ID, QNA_DATE, QNA_CATE, QNA_TITLE, QNA_CONTENT, "
				+ " QNA_ANSWER, QNA_IMG, MEM_EMAIL, QNA_COMPLETED "
				+ "	FROM TB_QNA"
				+ " ORDER BY QNA_NUM DESC" 
				+ " ) b" 
				+ " ORDER BY rnum" 
				+ ") WHERE rnum BETWEEN ? AND ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());

			rs = pst.executeQuery();

			while (rs.next()) {
				Qna dto = new Qna();
				dto.setQnaNum(rs.getInt("QNA_NUM"));
				dto.setMemId(rs.getString("MEM_ID"));
				dto.setQnaDate(rs.getString("QNA_DATE"));
				dto.setQnaCate(rs.getString("QNA_CATE"));
				dto.setQnaTitle(rs.getString("QNA_TITLE"));
				dto.setQnaContent(rs.getString("QNA_CONTENT"));
				dto.setQnaAnswer(rs.getString("QNA_ANSWER"));
				dto.setMemEmail(rs.getString("MEM_EMAIL"));
				dto.setQnaCompleted(rs.getString("QNA_COMPLETED"));
				
				if(rs.getString("QNA_IMG") != null) {
					dto.setQnaImg(rs.getString("QNA_IMG"));
				}
				
				list.add(dto);
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
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List getSearchList(Paging paging, QnaManage qm) {
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList<>();
		String sql = "SELECT * FROM(" + " SELECT ROWNUM RNUM, B.* FROM("
				+ " SELECT QNA_NUM, MEM_ID, QNA_DATE, QNA_CATE, QNA_TITLE, QNA_CONTENT, "
				+ " QNA_ANSWER, QNA_IMG, MEM_EMAIL, QNA_COMPLETED " 
				+ " FROM TB_QNA"
				+ " WHERE "	+ qm.getCategory() + " LIKE '%' || ? || '%'"
				+ " ORDER BY " + qm.getSort() + " DESC )B" 
				+ " ORDER BY RNUM)"
				+ " WHERE RNUM BETWEEN ? AND ?";

//			try {

		
		System.out.println("sql = "+sql);
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, qm.getContent());
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());

			rs = pst.executeQuery();

			System.out.println(paging);

			while (rs.next()) {
				Qna dto = new Qna();
				dto.setQnaNum(rs.getInt("QNA_NUM"));
				dto.setMemId(rs.getString("MEM_ID"));
				dto.setQnaDate(rs.getString("QNA_DATE"));
				dto.setQnaCate(rs.getString("QNA_CATE"));
				dto.setQnaTitle(rs.getString("QNA_TITLE"));
				dto.setQnaContent(rs.getString("QNA_CONTENT"));
				dto.setQnaAnswer(rs.getString("QNA_ANSWER"));
				dto.setMemEmail(rs.getString("MEM_EMAIL"));
				dto.setQnaCompleted(rs.getString("QNA_COMPLETED"));

				if (rs.getString("QNA_IMG") != null) {
					dto.setQnaImg(rs.getString("QNA_IMG"));
				}

				list.add(dto);
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
				e.printStackTrace();
			}
		}
			return list;
	}

	@Override
	public void updateQna(QnaManage qm) {
		PreparedStatement pst = null;

		String sql1 = "update tb_QNA set QNA_ANSWER = ? where qna_Num=?";
		try {
			if (qm.getEdit_qnaAnswer() == "" || qm.getEdit_qnaAnswer() == null) {
				pst = conn.prepareStatement(sql1);
				pst.setString(1, qm.getEdit_qnaAnswer());
				pst.setString(2, qm.getKey_qnaNum());
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
	public void deleteQna(QnaManage qm) {
		PreparedStatement pst = null;
		String sql = "DELETE TB_QNA WHERE QNA_NUM = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, qm.getKey_qnaNum());
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
