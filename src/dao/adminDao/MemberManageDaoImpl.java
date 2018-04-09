package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.Paging;
import dto.adminDto.MemberManage;
import dto.Member;

public class MemberManageDaoImpl implements MemberManageDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	private ResultSet rs = null;
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

	/*필요한 기능
	 정렬 속성!! 조인 필요
	--스칼라 서브쿼리
	SELECT 
	empno, 
	ename, 
	deptno,
    (SELECT dname FROM dept WHERE emp.deptno = dept.deptno) AS dname,
    (SELECT loc FROM dept WHERE emp.deptno = dept.deptno) AS LOCATION
	FROM emp
	ORDER BY deptno, empno;
	*/
	
	@Override
	public boolean doSearch(MemberManage search) {
		if ("눌림".equals(search.getClicked())) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public List getList(Paging paging, MemberManage search) {

		//검색버튼을 누른다면 카테고리를 구분해서 회원정보를 선택해서 보여줌
		if (doSearch(search) == true) {
			if("mem_Id".equals(search.getCate())) {
				return getIdList(paging, search);

			} else if("mem_Jumin".equals(search.getCate())) {
				return getJuminList(paging, search);
			}
		}
		if (doSearch(search) == false){
		//만약에 검색버튼을 누르지 않았을 경우(default) 전체 회원정보를 우선적으로 보여줌
		return getAllList(paging);
		}
		return getAllList(paging);
	}
	@Override
	public List getAllList(Paging paging) {
		List<Member> list = new ArrayList<>();
		// 전체 회원정보 불러오기
		sql = "SELECT * FROM ("
				+ " SELECT ROWNUM rnum, b.* FROM ("
				+ " SELECT MEM_ID, MEM_NAME, MEM_PHONE, MEM_JUMIN, MEM_EMAIL, MEM_ADDR, MEM_LICENSE"
				+ " FROM TB_MEMBER"
				+ " ORDER BY MEM_ID DESC"
				+ ") b"
				+ " ORDER BY rnum"
				+ ") WHERE rnum BETWEEN ? AND ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());

			rs = pst.executeQuery();

			while(rs.next()) {
				Member m = new Member();

				//dto.setter(rs.getter("DB 컬럼명") )
				m.setMemId(rs.getString("MEM_ID"));			
//				m.setMemPw(rs.getString("MEM_PW"));			
				m.setMemName(rs.getString("MEM_NAME"));
				m.setMemPhone(rs.getString("MEM_PHONE"));
				m.setMemJumin(rs.getString("MEM_JUMIN"));
				m.setMemEmail(rs.getString("MEM_EMAIL"));
				m.setMemAddr(rs.getString("MEM_ADDR"));

				list.add(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pst!=null)pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@Override
	public List getIdList(Paging paging, MemberManage search) {
		List<Member> list = new ArrayList<>();
		// 회원계정으로 찾기 시 해당 아이디에 대한 정보 불러오기
		String sql = "SELECT * FROM ("
				+ " SELECT ROWNUM rnum, b.* FROM("
				+ "SELECT MEM_ID, MEM_NAME, MEM_PHONE, MEM_JUMIN, MEM_EMAIL, MEM_ADDR, MEM_LICENSE"
				+ " FROM TB_MEMBER WHERE "+search.getCate()+" LIKE '%' || ? || '%' ORDER BY "+search.getSort()
				+ " )B"
				+ " ORDER BY rnum"
				+ ") WHERE rnum BETWEEN ? AND ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, search.getContent());
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();

				//dto.setter(rs.getter("DB 컬럼명") )
	            m.setMemId(rs.getString("MEM_ID"));	
	            m.setMemName(rs.getString("MEM_NAME"));
	            m.setMemPhone(rs.getString("MEM_PHONE"));
	            m.setMemJumin(rs.getString("MEM_JUMIN"));
	            m.setMemEmail(rs.getString("MEM_EMAIL"));
	            m.setMemAddr(rs.getString("MEM_ADDR"));
	            m.setMemLicense(rs.getBoolean("MEM_LICENSE"));
	            list.add(m);
	            
//	            System.out.println("id : " + m.getMemId());
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pst!=null)pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		return list;
	}
	
	@Override
	public List getJuminList(Paging paging, MemberManage search) {
		List<Member> list = new ArrayList<>();
		// 출생년도로 찾기 시 해당 출생년도에 해당하는 회원목록 불러오기
		String sql = "SELECT ROWNUM RNUM, B.* FROM("
				+ " SELECT MEM_ID, MEM_NAME, MEM_PHONE, MEM_JUMIN, MEM_EMAIL, MEM_ADDR, MEM_LICENSE"
				+ " FROM TB_MEMBER WHERE SUBSTR(mem_jumin, 0, 2) = ?"
				+ " ORDER BY "+search.getSort()
				+ ")B"
				+ "ORDER BY RNUM"
				+ ") WHERE RNUM BETWEEN ? AND ?";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
//			System.out.println("93 ----> " + search.getContent().substring(2,4) );
			pst.setString(1, (search.getContent()).substring(2,4));
			
			pst.setInt(2, paging.getStartNo());
			pst.setInt(3, paging.getEndNo());
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();

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
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pst!=null)pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		return list;
	}

	@Override
	public int getTotal(MemberManage search) {
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		
		String sql = "SELECT COUNT(*) FROM TB_MEMBER";
		String sql2 = "SELECT count(*) from tb_member where "+search.getCate()+" LIKE '%' || ? || '%'";
//		String sql3 = "SELECT count(*) from tb_car where car_category = ?";
//		String sql4 = "SELECT count(*) from tb_car where car_condi = ?";
		int total = 0;
		
		try {
			if(doSearch(search)==false) {
				st=conn.createStatement();
				rs=st.executeQuery(sql);
				
				rs.next();
				total = rs.getInt(1);
			}else {
				pst=conn.prepareStatement(sql2);
				pst.setString(1,search.getContent());
				
				rs=pst.executeQuery();
				rs.next();
				total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return total;
	}
}


	


