package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Coupon;
import dto.Member;
import util.Paging;

public class CouponCheckDaoImpl implements CouponCheckDao {

	// DB 정보
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "LAZENCAR";
	private String password = "saveus";

	private Connection conn = null;

	public CouponCheckDaoImpl() {
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


	// 총 쿠폰 리스트 반환
	@Override
	public int getTotal(String id) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		String sql="SELECT COUNT(*) FROM tb_mem_coupon mcp, tb_member mem"
				+ " WHERE mcp.mem_id=mem.mem_id"
				+ " AND mem.mem_id=?";

		int total = 0;
		try {
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, id);
			
			rs = pst.executeQuery();
			
			
			rs.next();
			
			total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
				if(rs!=null)	rs.close();
				if(pst!=null)	pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return total;
	}
	
	// 페이징 처리하여 게시물 리스트 가져오기
	@Override
	public List getList(String id) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Coupon> list = new ArrayList<>();
		
		String sql =
				" SELECT"
				+ " cp.cou_num, cp.cou_discount, cp.cou_name, cp.cou_start, cp.cou_end, cp.cou_const"
				+ " FROM"
				+ " tb_coupon cp, tb_mem_coupon mcp, tb_member mem"
				+ " WHERE cp.cou_num=mcp.cou_num"
				+ " AND mem.mem_id=mcp.mem_id"
				+ " AND mem.mem_id=?"
				+ " ORDER BY cou_start ASC";
					
		try {
			pst = conn.prepareStatement(sql);

			pst.setString(1, id);
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Coupon coupon = new Coupon();
				coupon.setCouNum(rs.getInt("cou_num"));
				coupon.setCouName(rs.getString("cou_name"));
				coupon.setCouConst(rs.getString("cou_const"));
				coupon.setCouDiscount(rs.getInt("cou_discount"));
				coupon.setCouStart(rs.getString("cou_start"));
				coupon.setCouEnd(rs.getString("cou_end"));
				
				list.add(coupon);
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
