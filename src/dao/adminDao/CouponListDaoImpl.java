package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Coupon;
import dto.adminDto.CouponManage;
import util.Paging;

public class CouponListDaoImpl implements CouponListDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	private ResultSet rs = null;
	
	public CouponListDaoImpl() {
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
	public boolean doSearch(CouponManage dto) {
		if ("clicked".equals(dto.getClicked())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List getList(Paging paging, CouponManage dto) {

		//검색버튼을 누른다면 카테고리를 구분해서 정보를 선택해서 보여줌
		if (doSearch(dto) == true) {
			if("COU_NAME".equals(dto.getCategory())) {
				return getSearchList(paging, dto);

			} else if("COU_DISCOUNT".equals(dto.getCategory())) {
				return getSearchList(paging, dto);
			}
		}
		if (doSearch(dto) == false){
		//만약에 검색버튼을 누르지 않았을 경우(default) 전체 정보를 우선적으로 보여줌
		return getAllList(paging);
		}
		return getAllList(paging);
	}

	// 페이징 처리해서 게시물 리스트를 가져오기
	@Override
	public List getAllList(Paging paging) {
		List<Coupon> list = new ArrayList<>();
		String sql = "SELECT * FROM (" 
				+ " SELECT rownum rnum, b.* FROM ("
				+ " SELECT COU_NUM, COU_NAME, COU_DISCOUNT, COU_START, COU_END,"
				+ " COU_AGE_CONST, COU_TIME_CONST, COU_CAR_CONST, COU_IMG "
				+ " FROM TB_COUPON"
				+ "	ORDER BY COU_NUM DESC"
				+ ") b"
				+ " ORDER BY rnum" 
				+ ") WHERE rnum BETWEEN ? AND ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());

			rs = pst.executeQuery();

			while (rs.next()) {
				Coupon cou = new Coupon();
				cou.setNo(rs.getInt("COU_NUM"));
				cou.setName(rs.getString("COU_NAME"));
				cou.setDiscount(rs.getString("COU_DISCOUNT"));
				cou.setStartDate(rs.getString("COU_START"));
				cou.setEndDate(rs.getString("COU_END"));
				cou.setAgeConst(rs.getString("COU_AGE_CONST"));
				cou.setTimeConst(rs.getString("COU_TIME_CONST"));
				cou.setCarConst(rs.getString("COU_CAR_CONST"));
				cou.setCouponImg(rs.getString("COU_IMG"));
				list.add(cou);
			}

			return list;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	public List getSearchList(Paging paging, CouponManage dto) {
		List<Coupon> list = new ArrayList<>();
		String sql = "SELECT * FROM("
					+ " SELECT ROWNUM RNUM, B.* FROM(" 
					+ " SELECT COU_NUM, COU_NAME, COU_DISCOUNT, COU_START, COU_END," 
					+ " COU_AGE_CONST, COU_TIME_CONST, COU_CAR_CONST, COU_IMG FROM TB_COUPON"
					+ " WHERE " + dto.getCategory() + " LIKE '%' || ? || '%'"
					+ " order by " + dto.getSort() + " )B" + " ORDER BY RNUM"
				+ ") WHERE RNUM BETWEEN ? AND ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getContent());
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());
			rs = pst.executeQuery();

			while (rs.next()) {
				Coupon cou = new Coupon();
				
				cou.setNo(rs.getInt("COU_NUM"));
				cou.setName(rs.getString("COU_NAME"));
				cou.setDiscount(rs.getString("COU_DISCOUNT"));
				cou.setStartDate(rs.getString("COU_START"));
				cou.setEndDate(rs.getString("COU_END"));
				cou.setAgeConst(rs.getString("COU_AGE_CONST"));
				cou.setTimeConst(rs.getString("COU_TIME_CONST"));
				cou.setCarConst(rs.getString("COU_CAR_CONST"));
				cou.setCouponImg(rs.getString("COU_IMG"));

				list.add(cou);
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
	public int getTotal(CouponManage dto) {


		String sql = "SELECT COUNT(*) FROM TB_COUPON";
		String sql2 = "SELECT count(*) from tb_coupon WHERE " + dto.getCategory() 
					+ " LIKE '%' || ? || '%'";
		
		int total = 0;

		try {
			if (doSearch(dto) == false) {
				st = conn.createStatement();
				rs = st.executeQuery(sql);

				rs.next();
				total = rs.getInt(1);
			} else {
				pst = conn.prepareStatement(sql2);
				pst.setString(1, dto.getContent());

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
public void updateCoupon(CouponManage dto) {
	PreparedStatement pst = null;
	String sql1 ="update tb_coupon set COU_NAME = ? where cou_Num=?";
	String sql2 ="update tb_coupon set COU_START = ? where cou_Num=?";
	String sql3 ="update tb_coupon set COU_END = ? where cou_Num=?";
	String sql4 ="update tb_coupon set cou_age_const = ? where cou_Num=?";
	String sql5 ="update tb_coupon set cou_time_const = ? where cou_Num=?";
	String sql6 ="update tb_coupon set cou_car_const = ? where cou_Num=?";
	String sql7 ="update tb_coupon set COU_DISCOUNT = ? where cou_Num=?";
	try {
		if(dto.getKey_couponName() == "" || dto.getKey_couponName()==null) {
			pst = conn.prepareStatement(sql1);
			pst.setString(1, dto.getKey_couponName());
			pst.setString(2, dto.getKey_couponNum());
			pst.executeUpdate();
		}else if(dto.getKey_couponStart()==""||dto.getKey_couponStart()==null) {
			pst = conn.prepareStatement(sql2);
			pst.setString(1, dto.getKey_couponStart());
			pst.setString(2, dto.getKey_couponNum());
			pst.executeUpdate();
		}else if(dto.getKey_couponEnd()==""||dto.getKey_couponEnd()==null) {
			pst = conn.prepareStatement(sql3);
			pst.setString(1, dto.getKey_couponEnd());
			pst.setString(2, dto.getKey_couponNum());
			pst.executeUpdate();
		}else if(dto.getKey_ageConst()==""||dto.getKey_ageConst()==null) {
			pst = conn.prepareStatement(sql4);
			pst.setString(1, dto.getKey_ageConst());
			pst.setString(2, dto.getKey_couponNum());
			pst.executeUpdate();
		}else if(dto.getKey_timeConst()==""||dto.getKey_timeConst()==null) {
			pst = conn.prepareStatement(sql5);
			pst.setString(1, dto.getKey_timeConst());
			pst.setString(2, dto.getKey_couponNum());
			pst.executeUpdate();
		}else if(dto.getKey_carConst()==""||dto.getKey_carConst()==null) {
			pst = conn.prepareStatement(sql6);
			pst.setString(1, dto.getKey_carConst());
			pst.setString(2, dto.getKey_couponNum());
			pst.executeUpdate();
		}else if(dto.getKey_discount()==""||dto.getKey_discount()==null) {
			pst = conn.prepareStatement(sql7);
			pst.setString(1, dto.getKey_discount());
			pst.setString(2, dto.getKey_couponNum());
			pst.executeUpdate();
		}
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

@Override
public void deleteCoupon(CouponManage dto) {
	PreparedStatement pst = null;
	String sql = "delete tb_coupon where cou_num = ?";
	try {
		pst = conn.prepareStatement(sql);
		pst.setString(1, dto.getKey_couponNum());
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
