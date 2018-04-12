package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Reservation;

public class ReservationCheckDaoImpl implements ReservationCheckDao {

	// DB 정보
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "LAZENCAR";
	private String password = "saveus";

	private Connection conn = null;

	public ReservationCheckDaoImpl() {
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

		String sql="SELECT COUNT(*) FROM tb_reservation"
				+ " WHERE mem_id=?";

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

		List<Reservation> list = new ArrayList<>();
		
		String sql =
				" SELECT res.*, car.car_name"
				+ " FROM tb_reservation res, tb_car car"
				+ " WHERE res.mem_id=?"
				+ " AND res.car_num=car.car_num"
				+ " ORDER BY res_start ASC";
					
		try {
			pst = conn.prepareStatement(sql);

			pst.setString(1, id);
			
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
				reserv.setDcPrice(rs.getInt("res_disprice"));
				reserv.setNormalPrice(rs.getInt("res_talprice"));
				reserv.setCarName(rs.getString("car_name"));
				
				list.add(reserv);
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




	@Override
	public void deleteReserv(String id, int resNum) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		String sql =
				" DELETE "
				+ " FROM tb_reservation"
				+ " WHERE mem_id=?"
				+ " AND res_num=?";
					
		try {
			pst = conn.prepareStatement(sql);

			pst.setString(1, id);
			pst.setInt(2, resNum);
			
			pst.executeUpdate();

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
		
	}
	

}
