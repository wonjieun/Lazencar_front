package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Payment;
import dto.Reservation;

public class MakePaymentDao {
	// DB 정보
		private String url = "jdbc:oracle:thin:@localhost:1521:xe";
		private String username = "LAZENCAR";
		private String password = "saveus";

		private Connection conn = null;

		public MakePaymentDao() {
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
		public void insertPayment(int a) {
			PreparedStatement pst = null;
			
			String sql = 
				"insert into tb_payment ("
				+" select r.res_Num,  r.res_disprice, m.mem_email, "
				+" m.mem_name , m.mem_phone , '결제 대기' "
				+" from (tb_reservation)r, (tb_member)m "
				+" where r.mem_id = m.mem_id AND r.res_num=?)";
			
			try {
				
				pst = conn.prepareStatement(sql);
				pst.setInt(1, a);
				pst.executeQuery();
				System.out.println("insert payment 완료");
			} catch (SQLException e) {
				System.out.println("insert payment 실패");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if(pst!=null) pst.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		public int getResNum() {
			Statement st = null;
			ResultSet rs = null;
			int a=0;
			String sql = "select res_num from tb_reservation tb_member where mem_id = tb_member.mem_id order by res_num desc";
			
			try {
				st = conn.createStatement();
				rs = st.executeQuery(sql);
				
				rs.next();
//					res.setResNum(rs.getInt("RES_NUM"));
					a = rs.getInt("res_num");
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return a;
		}
		public void getPayment(Payment pay) {
			PreparedStatement pst = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM TB_PAYMENT WHERE PAY_NUM = ?";
			
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, getResNum());
				
				rs = pst.executeQuery();
				
				rs.next();
				pay.setPayNum(rs.getInt("pay_num"));
				pay.setPayName(rs.getString("pay_name"));
				pay.setPayAmount(rs.getInt("pay_amount"));
				pay.setPayEmail(rs.getString("pay_Email"));
				pay.setPayPhone(rs.getString("pay_phone"));
				pay.setPayStatus(rs.getString("pay_Status"));
				
				System.out.println(pay.getPayAmount());
				System.out.println(pay.getPayEmail());
				System.out.println(pay.getPayName());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		public void updatePayStatus(int payNum) {
			PreparedStatement pst = null;
			String sql = "update tb_payment set pay_status = ?"
					+" where pay_num = ?";
			
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, "결제성공");
				pst.setInt(2, payNum);
				pst.executeUpdate();
				
				System.out.println(payNum+"번 결제정보를 "+"결제 성공으로 상태 변경");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		public void deletePayment(int payNum) {
			PreparedStatement pst = null;
			String sql = "delete tb_payment where pay_num = ?";
			
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, payNum);

				pst.executeUpdate();
				
				System.out.println("결제정보 삭제");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		public void deleteReservation(int payNum) {
			PreparedStatement pst = null;
			String sql = "delete tb_reservation where res_num = ?";
			
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, payNum);

				pst.executeUpdate();
				System.out.println("예약정보 삭제");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
