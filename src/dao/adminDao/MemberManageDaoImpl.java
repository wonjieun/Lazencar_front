package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.adminDto.MemberManage;
import dto.adminDto.MemberSearch;

public class MemberManageDaoImpl implements MemberManageDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	private ResultSet rs = null;
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

		//검색버튼을 누른다면 카테고리를 구분해서 회원정보를 선택해서 보여줌
		if ("눌림".equals(search.getClicked())) {
			if("회원계정".equals(search.getCate())) {
				return getIdList(search);

			} else if("출생년도".equals(search.getCate())) {
				return getJuminList(search);
			}
		}
		//만약에 검색버튼을 누르지 않았을 경우(default) 전체 회원정보를 우선적으로 보여줌
		return getAllList(search);
	}
	
	  @Override
		public List getAllList(MemberSearch search) {
		  List<MemberManage> list = new ArrayList<>();
			// 전체 회원정보 불러오기
		  	sql = "SELECT * FROM tb_member";
			try {
				pst = conn.prepareStatement(sql);
//				pst.setString(1, mem.getMemId());		요기 어떻게 고치지..

				rs = pst.executeQuery();
				
				while(rs.next()) {
					MemberManage m = new MemberManage();

					//dto.setter(rs.getter("DB 컬럼명") )
		            m.setMemId(rs.getString("MEM_ID"));			
		            m.setMemPw(rs.getString("MEM_PW"));			
		            m.setMemName(rs.getString("MEM_NAME"));
		            m.setMemPhone(rs.getString("MEM_PHONE"));
		            m.setMemJumin(rs.getString("MEM_JUMIN"));
		            m.setMemEmail(rs.getString("MEM_EMAIL"));
		            m.setMemAddr(rs.getString("MEM_ADDR"));
		            list.add(m);
		         }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	
	
	@Override
	public List getIdList(MemberSearch search) {
		List<MemberManage> list = new ArrayList<>();
		// 회원계정으로 찾기 시 해당 아이디에 대한 정보 불러오기
		String sql = "SELECT * FROM tb_member WHERE mem_id LIKE '%' || ? || '%'";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, search.getContent());
			rs = pst.executeQuery();
			
			while(rs.next()) {
				MemberManage m = new MemberManage();

				//dto.setter(rs.getter("DB 컬럼명") )
	            m.setMemId(rs.getString("MEM_ID"));	
	            m.setMemPw(rs.getString("MEM_PW"));
	            m.setMemName(rs.getString("MEM_NAME"));
	            m.setMemPhone(rs.getString("MEM_PHONE"));
	            m.setMemJumin(rs.getString("MEM_JUMIN"));
	            m.setMemEmail(rs.getString("MEM_EMAIL"));
	            m.setMemAddr(rs.getString("MEM_ADDR"));
	            list.add(m);
	            System.out.println("id : " + m.getMemId());

	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public List getJuminList(MemberSearch search) {
		List<MemberManage> list = new ArrayList<>();
		// 출생년도로 찾기 시 해당 출생년도에 해당하는 회원목록 불러오기
		String sql = "SELECT * FROM tb_member WHERE SUBSTR(mem_jumin, 0, 2) = ?";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			System.out.println("93939393939 ----> " + search.getContent().substring(2,4) );
			pst.setString(1, (search.getContent()).substring(2,4));
			rs = pst.executeQuery();
			
			while(rs.next()) {
				MemberManage m = new MemberManage();

				//dto.setter(rs.getter("DB 컬럼명") )
	            m.setMemId(rs.getString("MEM_ID"));	
	            m.setMemPw(rs.getString("MEM_PW"));
	            m.setMemName(rs.getString("MEM_NAME"));
	            m.setMemPhone(rs.getString("MEM_PHONE"));
	            m.setMemJumin(rs.getString("MEM_JUMIN"));
	            m.setMemEmail(rs.getString("MEM_EMAIL"));
	            m.setMemAddr(rs.getString("MEM_ADDR"));
	            list.add(m);
	            
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
		
	
}
