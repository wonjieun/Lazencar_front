package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Payment;
import dto.adminDto.PaymentManage;
import util.Paging;

public class PaymentListDaoImpl implements PaymentListDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;

	public PaymentListDaoImpl() {

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
	public int getTotal(PaymentManage pm) {
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement pst = null;

		String sql = "SELECT COUNT(*) FROM tb_payment";
		String sql2 =
//				"SELECT count(*) from tb_payment where " + pm.getCategory() + " = ?";
				"SELECT count(*) from (" 
				+ " SELECT * " + "  FROM TB_PAYMENT WHERE "
				+ pm.getCategory() + " LIKE '%' || ? || '%')";
		int total = 0;

		try {
			if (doSearch(pm) == false) {
				st = conn.createStatement();
				rs = st.executeQuery(sql);

				rs.next();
				total = rs.getInt(1);
			} else {
				pst = conn.prepareStatement(sql2);
				pst.setString(1, pm.getContent());

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

		List<Payment> list = new ArrayList<>();
		// list = null;
		String sql = "SELECT * FROM (" + " SELECT rownum rnum, b.* FROM ("
				+ " 	SELECT PAY_NUM, PAY_AMOUNT, PAY_EMAIL, PAY_NAME, PAY_PHONE, PAY_STATUS "
				+ " 	FROM TB_PAYMENT" + " 	ORDER BY PAY_NUM DESC" + " ) b" + " ORDER BY rnum"
				+ ") WHERE rnum BETWEEN ? AND ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());

			rs = pst.executeQuery();

			while (rs.next()) {
				Payment pay = new Payment();
				pay.setPayNum(rs.getInt("pay_Num"));
				pay.setPayAmount(rs.getInt("pay_amount"));
				pay.setPayEmail(rs.getString("pay_email"));
				pay.setPayName(rs.getString("pay_name"));
				pay.setPayPhone(rs.getString("pay_phone"));
				pay.setPayStatus(rs.getString("pay_status"));

				list.add(pay);
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
	public List getSearchList(Paging paging, PaymentManage pm) {
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Payment> list = new ArrayList<>();
		String sql = "SELECT * FROM(" + " SELECT ROWNUM RNUM, B.* FROM("
				+ " 	SELECT PAY_NUM,PAY_AMOUNT, PAY_EMAIL, PAY_NAME, PAY_PHONE, PAY_STATUS"
				+ "  FROM TB_PAYMENT WHERE " + pm.getCategory() + " LIKE '%' || ? || '%' order by " + pm.getSort()
				+ " )B" + " ORDER BY RNUM" + ") WHERE RNUM BETWEEN ? AND ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, pm.getContent());
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());
			rs = pst.executeQuery();

			while (rs.next()) {
				Payment pay = new Payment();
				pay.setPayNum(rs.getInt("pay_Num"));
				pay.setPayAmount(rs.getInt("pay_amount"));
				pay.setPayEmail(rs.getString("pay_email"));
				pay.setPayName(rs.getString("pay_name"));
				pay.setPayPhone(rs.getString("pay_phone"));
				pay.setPayStatus(rs.getString("pay_status"));

				list.add(pay);
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
	public List getList(Paging paging, PaymentManage pm) {
		// 검색버튼을 누른다면 카테고리를 구분해서 회원정보를 선택해서 보여줌
		if (doSearch(pm) == true) {
			return getSearchList(paging, pm);
		} else {
			// 만약에 검색버튼을 누르지 않았을 경우(default) 전체 회원정보를 우선적으로 보여줌
			return getAllList(paging);
		}
	}

	@Override
	public boolean doSearch(PaymentManage pm) {
		if ("clicked".equals(pm.getClicked())) {
			return true;
		} else {
			return false;
		}
	}
}
