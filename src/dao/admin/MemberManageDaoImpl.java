package dao.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.admin.MemberManage;
import dto.admin.MemberSearch;

public class MemberManageDaoImpl implements MemberManageDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	private List<MemberManage> list = new ArrayList<>();
	private ResultSet rs = null;
	MemberManage mem = new MemberManage();
	MemberSearch search = new MemberSearch();
	private String sql = null;

	public MemberManageDaoImpl() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List memberManage(MemberSearch search) {
		String sql = "SELECT * FROM tb_member WHERE";

		//만약에 검색버튼을 누르지 않았을 경우(default) 전체 회원정보를 우선적으로 보여줌
		getAllList(mem);

		//검색버튼을 누른다면 카테고리를 구분해서 회원정보를 선택해서 보여줌
		if (search.getClicked()=="눌림") {
			if("회원계정"==search.getCate()) {
				getIdList(mem);

			} else if("출생년도"==search.getCate()) {
				getJuminList(mem);
				}
			}

	}
	
	  @Override
		public List getAllList(MemberManage mem) {
			// 전체 회원정보 불러오기
		  	sql = "SELECT * FROM tb_member WHERE 1=1;";
			try {
				pst = conn.prepareStatement(sql);
//				pst.setString(1, mem.getMemId());		요기 어떻게 고치지..

				rs = pst.executeQuery();
				
				while(rs.next()) {
					//dto.setter(rs.getter("DB 컬럼명") )
		            mem.setMemId(rs.getString("MEM_ID"));			
		            mem.setMemPw(rs.getString("MEM_PW"));			
		            mem.setMemName(rs.getString("MEM_NAME"));
		            mem.setMemPhone(rs.getString("MEM_PHONE"));
		            mem.setMemJumin(rs.getString("MEM_JUMIN"));
		            mem.setMemEmail(rs.getString("MEM_EMAIL"));
		            mem.setMemAddr(rs.getString("MEM_ADDR"));
		            list.add(mem);
		         }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	
	
	@Override
	public List getIdList(MemberManage mem) {
		// 회원계정으로 찾기 시 해당 아이디에 대한 정보 불러오기
		String sql = "SELECT * FROM tb_member WHERE mem_id LIKE '%"+search.getContent()+"%';";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				//dto.setter(rs.getter("DB 컬럼명") )
	            mem.setMemId(rs.getString("MEM_ID"));	
	            mem.setMemPw(rs.getString("MEM_PW"));
	            mem.setMemName(rs.getString("MEM_NAME"));
	            mem.setMemPhone(rs.getString("MEM_PHONE"));
	            mem.setMemJumin(rs.getString("MEM_JUMIN"));
	            mem.setMemEmail(rs.getString("MEM_EMAIL"));
	            mem.setMemAddr(rs.getString("MEM_ADDR"));
	            list.add(mem);
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public List getJuminList(MemberManage mem) {
		// 출생년도로 찾기 시 해당 출생년도에 해당하는 회원목록 불러오기
		String sql = "SELECT * FROM tb_member WHERE SUBSTR(mem_jumin, 0, 2) = '" + (search.getContent()).substring(2,3) + "';";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				//dto.setter(rs.getter("DB 컬럼명") )
	            mem.setMemId(rs.getString("MEM_ID"));	
	            mem.setMemPw(rs.getString("MEM_PW"));
	            mem.setMemName(rs.getString("MEM_NAME"));
	            mem.setMemPhone(rs.getString("MEM_PHONE"));
	            mem.setMemJumin(rs.getString("MEM_JUMIN"));
	            mem.setMemEmail(rs.getString("MEM_EMAIL"));
	            mem.setMemAddr(rs.getString("MEM_ADDR"));
	            list.add(mem);
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
		
	
}
