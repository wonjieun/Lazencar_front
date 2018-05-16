package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Reservation;
import dto.adminDto.QnaManage;
import util.Paging;
import dto.Car;
import dto.Coupon;
import dto.Damage;
import dto.Etc;
import dto.Qna;

public class ReservManageDaoImpl implements ReservManageDao{
	
	// DB 정보
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "LAZENCAR";
	private String password = "saveus";

	private Connection conn = null;

	public ReservManageDaoImpl() {
		try {
			// Oracle jdbc Driver 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// Connection 객체 생성
			conn = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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

	// 총 쿠폰 리스트 반환
	@Override
	public int getTotal(QnaManage qm) {
		PreparedStatement pst = null;
		Statement st = null;
		ResultSet rs = null;

		String sql = "SELECT COUNT(*) FROM TB_RESERVATION";
		String sql2 = "SELECT count(*) from (" 
				+ " SELECT * " + "  FROM TB_RESERVATION WHERE "
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
	
	// 페이징 처리하여 게시물 리스트 가져오기
	@Override
	public List getAllList(Paging paging) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Reservation> list = new ArrayList<>();
		
		String sql = "SELECT * FROM (" 
				+ " SELECT rownum rnum, b.* FROM ("
				+ " SELECT RES_NUM, MEM_ID, CAR_NUM, RES_OPTION, RES_DAMAGE, RES_START, "
				+ " RES_END, RES_TALPRICE, RES_DISPRICE, COU_NUM "
				+ "	FROM TB_RESERVATION"
				+ " ORDER BY RES_NUM " 
				+ " ) b" 
				+ " ) WHERE rnum BETWEEN ? AND ?";
					
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Reservation reserv = new Reservation();
				reserv.setResNum(rs.getInt("res_num"));
				reserv.setMemId(rs.getString("mem_id"));
				reserv.setCarNum(rs.getString("car_num"));
				reserv.setCouNum(rs.getInt("cou_num"));
				reserv.setCarDemage(rs.getString("res_damage"));
				reserv.setOptionList(rs.getString("res_option"));
				reserv.setResStart(rs.getString("res_start"));
				reserv.setResEnd(rs.getString("res_end"));
				reserv.setNormalPrice(rs.getInt("res_talprice"));
				reserv.setDcPrice(rs.getInt("res_disprice"));
				
				list.add(reserv);
			}
			
			System.out.println();

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
	
	@Override
	public List getSearchList(Paging paging, QnaManage qm) {
		
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Reservation> list = new ArrayList<>();
		
		String sql = "SELECT * FROM(" + " SELECT ROWNUM RNUM, B.* FROM("
				+ " SELECT RES_NUM, MEM_ID, CAR_NUM, RES_OPTION, RES_DAMAGE, RES_START, "
				+ " RES_END, RES_TALPRICE, RES_DISPRICE, COU_NUM " 
				+ " FROM TB_RESERVATION"
				+ " WHERE "	+ qm.getCategory() + " LIKE '%' || ? || '%'"
				+ " ORDER BY " + qm.getSort() + ", RES_NUM )B" 
				+ " ORDER BY RNUM)"
				+ " WHERE RNUM BETWEEN ? AND ?";
		
		System.out.println("sql = "+sql);
		System.out.println(qm.getCategory());
		System.out.println(qm.getContent());
		System.out.println(qm.getSort());
		System.out.println("서치리스트가 돌음");
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, qm.getContent());
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());

			rs = pst.executeQuery();

			System.out.println(paging);

			while (rs.next()) {
				Reservation reserv = new Reservation();
				reserv.setResNum(rs.getInt("res_num"));
				reserv.setMemId(rs.getString("mem_id"));
				reserv.setCarNum(rs.getString("car_num"));
				reserv.setCouNum(rs.getInt("cou_num"));
				reserv.setCarDemage(rs.getString("res_damage"));
				reserv.setOptionList(rs.getString("res_option"));
				reserv.setResStart(rs.getString("res_start"));
				reserv.setResEnd(rs.getString("res_end"));
				reserv.setNormalPrice(rs.getInt("res_talprice"));
				reserv.setDcPrice(rs.getInt("res_disprice"));
				
				list.add(reserv);
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
	
}
