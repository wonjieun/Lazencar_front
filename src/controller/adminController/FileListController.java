package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.FileDao;
import dto.adminDto.Image;

@WebServlet("/FileList")
@SuppressWarnings("serial")
public class FileListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileDao dao = new FileDao();
		
		List<Image> images = dao.getImage();
		
//		for(Image i : images)
//			System.out.println(i.getImage());
//		for(Video v : videos)
//			System.out.println(v.getVideo());
		
		request.setAttribute("images", images);
		
		request.getRequestDispatcher("/Manage_Page/PromotionList.jsp").forward(request, response);
	}
}
