package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.Promotion;
import dto.adminDto.PromotionManage;
import util.Paging;

public class PromotionListDaoImpl implements PromotionListDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	private ResultSet rs = null;
	
	public PromotionListDaoImpl() {
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
	public boolean doSearch(PromotionManage dto) {
		if ("clicked".equals(dto.getClicked())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List getList(Paging paging, PromotionManage dto) {

		//검색버튼을 누른다면 정보를 선택해서 보여줌
		if (doSearch(dto) == true) {
				return getSearchList(paging, dto);
		} else if (doSearch(dto) == false){
		//만약에 검색버튼을 누르지 않았을 경우(default) 전체 정보를 우선적으로 보여줌
		return getAllList(paging);
		}
		return getAllList(paging);
	}

	// 페이징 처리해서 게시물 리스트를 가져오기
	@Override
	public List getAllList(Paging paging) {
		List<Promotion> list = new ArrayList<>();
		String sql = "SELECT * FROM (" 
				+ " SELECT rownum rnum, b.* FROM ("
				+ " SELECT EVE_NUM, EVE_NAME, EVE_START, EVE_END,"
				+ " EVE_BANNERIMG, EVE_DETAILIMG"
				+ " FROM TB_EVENT"
				+ "	ORDER BY EVE_NUM DESC"
				+ ") b"
				+ " ORDER BY rnum" 
				+ ") WHERE rnum BETWEEN ? AND ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());

			rs = pst.executeQuery();

			while (rs.next()) {
				Promotion pro = new Promotion();
				pro.setNo(rs.getInt("EVE_NUM"));
				pro.setName(rs.getString("EVE_NAME"));
				pro.setProStartDate(rs.getString("EVE_START"));
				pro.setProEndDate(rs.getString("EVE_END"));
				pro.setBannerImg(rs.getString("EVE_BANNERIMG"));
				pro.setDetailImg(rs.getString("EVE_DETAILIMG"));
				list.add(pro);
			}
			System.out.println("dao의 list : "+list);

			return list;

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
	public List getSearchList(Paging paging, PromotionManage dto) {
		List<Promotion> list = new ArrayList<>();
		String sql = "SELECT * FROM("
					+ " SELECT ROWNUM RNUM, B.* FROM(" 
					+ " SELECT EVE_NUM, EVE_NAME, EVE_START, EVE_END,"
					+ " EVE_BANNERIMG, EVE_DETAILIMG"
					+ " WHERE EVE_NAME LIKE '%' || ? || '%'"
					+ " order by EVE_NAME )B ORDER BY RNUM"
				+ ") WHERE RNUM BETWEEN ? AND ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, paging.getStartNo());
			pst.setInt(2, paging.getEndNo());
			rs = pst.executeQuery();

			while (rs.next()) {
				Promotion pro = new Promotion();
				
				pro.setNo(rs.getInt("EVE_NUM"));
				pro.setName(rs.getString("EVE_NAME"));
				pro.setProStartDate(rs.getString("EVE_START"));
				pro.setProEndDate(rs.getString("EVE_END"));
				pro.setBannerImg(rs.getString("EVE_BANNERIMG"));
				pro.setDetailImg(rs.getString("EVE_DETAILIMG"));
				list.add(pro);
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
	
	@Override
	public int getTotal(PromotionManage dto) {


		String sql = "SELECT COUNT(*) FROM TB_EVENT";
		String sql2 = "SELECT count(*) from TB_EVENT WHERE EVE_NAME"
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
public void updatePromotion(PromotionManage dto) {
	PreparedStatement pst = null;
	String sql1 ="update tb_EVENT set EVE_NAME = ? where EVE_Num=?";
	String sql2 ="update tb_EVENT set EVE_START = ? where EVE_Num=?";
	String sql3 ="update tb_EVENT set EVE_END = ? where EVE_Num=?";
	try {
		if(dto.getKey_promotionName() == "" || dto.getKey_promotionName()==null) {
			pst = conn.prepareStatement(sql1);
			pst.setString(1, dto.getKey_promotionName());
			pst.setString(2, dto.getKey_promotionNum());
			pst.executeUpdate();
		}else if(dto.getKey_promotionStart()==""||dto.getKey_promotionStart()==null) {
			pst = conn.prepareStatement(sql2);
			pst.setString(1, dto.getKey_promotionStart());
			pst.setString(2, dto.getKey_promotionNum());
			pst.executeUpdate();
		}else if(dto.getKey_promotionEnd()==""||dto.getKey_promotionEnd()==null) {
			pst = conn.prepareStatement(sql3);
			pst.setString(1, dto.getKey_promotionEnd());
			pst.setString(2, dto.getKey_promotionNum());
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
	public void deletePromotion(PromotionManage dto) {
		PreparedStatement pst = null;
		String sql = "delete TB_EVENT where EVE_NUM = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getKey_promotionNum());
			pst.executeUpdate();
			
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

}
