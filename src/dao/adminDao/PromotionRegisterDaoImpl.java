package dao.adminDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileItem;

import dto.Car;
import dto.adminDto.Image;
import dto.adminDto.PromotionManage;

public class PromotionRegisterDaoImpl implements PromotionRegisterDao {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "LAZENCAR";
	private final String password = "saveus";
	private Connection conn = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	
	public PromotionRegisterDaoImpl(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertAllData(PromotionManage pro) {
		String sql = "INSERT INTO TB_EVENT(EVE_NUM, EVE_NAME, EVE_START, EVE_END"
				+ ", EVE_BANNER_IMG, EVE_BANNER_ORG, EVE_DETAIL_IMG, EVE_DETAIL_ORG)"
				+" VALUES(?,?,?,?,?,?,?,?)";
		ResultSet rs = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, pro.getNo());
			pst.setString(2, pro.getName());
			pst.setString(3, pro.getStartDate());
			pst.setString(4, pro.getEndDate());
			pst.setString(5, pro.getBannerImg());
			pst.setString(6, pro.getBannerOrg());
			pst.setString(7, pro.getDetailImg());
			pst.setString(8, pro.getDetailOrg());
			
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertImage(String imgPath) {
		PreparedStatement pst = null;
		String sql = "INSERT INTO image_file (no, image) VALUES(seq_image.nextval, ?)";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, imgPath);
			
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null)	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public List getImage() {
		Statement st = null;
		String sql = "SELECT no, image FROM image_file ORDER BY no";
		List<Image> list = new ArrayList<>();
		
		try {
			st = conn.createStatement();
			
			ResultSet rs = st.executeQuery(sql);
			
			
			while( rs.next() ) {
				Image img = new Image();
				img.setNo(rs.getInt("no"));
				img.setImage(rs.getString("image"));
				
				list.add(img);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null)	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	public Image getImage(int no) {
		Statement st = null;
		String sql = "SELECT no, image FROM image_file WHERE no="+no;
		
		Image img = null;
		
		try {
			st = conn.createStatement();
			
			ResultSet rs = st.executeQuery(sql);
			
			rs.next();
			img = new Image();
			img.setNo(rs.getInt("no"));
			img.setImage(rs.getString("image"));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null)	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return img;
	}

}