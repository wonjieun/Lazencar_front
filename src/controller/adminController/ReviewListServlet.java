package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.ReviewListDao;
import dao.adminDao.ReviewListDaoImpl;
import dto.Review;
import dto.adminDto.ReviewManage;
import service.adminService.ReviewListService;
import service.adminService.ReviewListServiceImpl;
import util.Paging;

/**
 * Servlet implementation class NotListServlet
 */
@WebServlet("/admin/reviewList.do")
public class ReviewListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected ReviewListService service = new ReviewListServiceImpl();
	protected ReviewManage rm = new ReviewManage();
	protected ReviewListDao dao = new ReviewListDaoImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		// 검색할 키워드 저장 및 확인
		String category = request.getParameter("category");
		String sort = request.getParameter("sort");
		String content = request.getParameter("content");
		String clicked = request.getParameter("clicked");
		
		// -- NoticeManage에 저장

		rm.setSort(sort);
		rm.setCategory(category);
		rm.setContent(content);
		rm.setClicked(clicked);

//		System.out.println("nm:" + nm.getCategory());
//		System.out.println("nm:" + nm.getSort());
//		System.out.println("nm:" + nm.getContent());
//		System.out.println("nm:" + nm.getClicked());
		String key_revNum = request.getParameter("font_revNum");
		String editReview = request.getParameter("btnEdit");
	
		System.out.println(key_revNum);
		System.out.println(editReview);
		// 수정 및 삭제할 키워드 저장 및 확인
		rm.setKey_revNum(key_revNum);
		rm.setEditReview(editReview);
		

		
		if (editReview != null) {
			if (editReview.equals("deleteReview")) {
				service.editRevData(rm);
			}
		}

		// 페이징 ▽
		Paging paging = null;
		List<Review> list = null;

		String pageParam = request.getParameter("pageNo");
		int pageNo = 0;
		if (pageParam != null)
			pageNo = Integer.parseInt(pageParam);

		// 페이징 로직 처리

		int totalCount = dao.getTotal(rm);
		System.out.println(rm);
		if (totalCount != 0) {
			paging = new Paging(totalCount, pageNo);
			list = service.getRevList(paging, rm);
		}
		request.setAttribute("content", content);
		request.setAttribute("category", category);
		request.setAttribute("sort", sort);
		request.setAttribute("clicked", clicked);

		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Manage_Page/reviewManage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/Manage_Page/reviewManage.jsp");
//		doGet(request, response);
	}

}
