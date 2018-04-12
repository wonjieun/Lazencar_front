package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Member;

public class MemberSignUpDaoImpl implements MemberSignUpDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	
	public MemberSignUpDaoImpl(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doSignUp(Member mem) {
		String btn = mem.getBtnName();
		if(btn.equals("btn_signUp")) {
			idDupCheck(mem);
			if(mem.getMemCheck() == true) {
				insertAllData(mem);
				mem.setMsg("회원가입을 성공했습니다.");
			}else {
				mem.setMsg("아이디를 사용할 수 없습니다. 중복된 ID가 존재합니다.");
			}
		}else if(btn.equals("btn_idDupCheck")) {
			idDupCheck(mem);
		}
	}
	@Override
	public void insertAllData(Member mem) {
//		String sql = "INSERT INTO TB_MEMBER(MEM_ID,MEM_PW, MEM_GUBN, MEM_NAME, MEM_PHONE, MEM_JUMIN, MEM_EMAIL, MEM_ADDR)"
		String sql = "INSERT INTO TB_MEMBER(MEM_ID,MEM_PW, MEM_NAME, MEM_PHONE, MEM_JUMIN, MEM_EMAIL, MEM_ADDR,MEM_GUBN)"
				+ " VALUES(?,?,?,?,?,?,?,?)";
		//Id, Pw, Name, Phone, Jumin(int), Email, Addr순서
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			pst.setString(2, mem.getMemPw());
			pst.setString(3, mem.getMemName());
			pst.setString(4, mem.getMemPhone());
			pst.setString(5, mem.getMemJumin());
			pst.setString(6, mem.getMemEmail());
			pst.setString(7, mem.getMemAddr());
			pst.setInt(8, 1);

			
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void idDupCheck(Member mem) {
		String sql = "SELECT COUNT(*) FROM TB_MEMBER WHERE MEM_ID=?";
		
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, mem.getMemId());
			rs = pst.executeQuery();
			
			rs.next();
			int result = rs.getInt(1);
			if(result>0) {
				mem.setMsg("사용 불가능한 ID 입니다.");
				mem.setMemCheck(false);
			}else if(result==0){
				mem.setMsg("사용 가능한 ID 입니다.");
				mem.setMemCheck(true);
				//member의 맴버필드 dupCheck에 0을 넣음 ( 중복값이 없다는 뜻)
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
