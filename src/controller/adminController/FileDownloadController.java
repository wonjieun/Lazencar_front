package controller.adminController;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.PromotionRegisterDao;
import dto.adminDto.Image;

@WebServlet("/FileDownload")
@SuppressWarnings("serial")
public class FileDownloadController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PromotionRegisterDao dao = new PromotionRegisterDao();

		String type = request.getParameter("type");
		String no = request.getParameter("no");
		
		Image i = null;
		File file = null;
		InputStream is = null;
		
		response.reset();
		
		if(type.equals("i")) {
			i = dao.getImage(Integer.parseInt(no));
			file = new File(getServletContext().getRealPath("/upload/"+i.getImage()));
			is = new FileInputStream(file);

			response.setHeader("Content-Length", String.valueOf(file.length()));
			response.setHeader("Content-Disposition",
					"attachment;fileName="+new String( file.getName().getBytes("UTF-8"), "8859_1")+";");
		}
		response.setContentType("application/octet-stream");
		
		OutputStream os = response.getOutputStream();
		
		byte[] buf = new byte[4096];
		int len = -1;
		
		while((len = is.read(buf)) != -1) {
			os.write(buf, 0, len);
		}
		
		os.flush();
		is.close();
		os.close();
	}
	
}
