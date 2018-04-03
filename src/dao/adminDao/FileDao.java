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

import dto.adminDto.Image;

public class FileDao {
	private static FileDao instance = new FileDao();

	public static FileDao getInstance() {
		return instance;
	}

	Connection conn = null;
	public Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "LAZENCAR";
		String pass = "saveus";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void insertImage(String imgPath) {
		PreparedStatement pst = null;
		String sql = "INSERT INTO image_file (no, image) VALUES(seq_image.nextval, ?)";
		
		try {
			conn = getConnection();
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
			conn = getConnection();
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
			conn = getConnection();
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