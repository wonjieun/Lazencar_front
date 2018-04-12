package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.NoticeListDao;
import dao.adminDao.NoticeListDaoImpl;
import dto.Notice;
import dto.adminDto.NoticeManage;
import service.adminService.NoticeListService;
import service.adminService.NoticeListServiceImpl;
import util.Paging;

/**
 * Servlet implementation class NotListServlet
 */
@WebServlet("/admin/noticeList.do")
public class NotListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected NoticeListService service = new NoticeListServiceImpl();
	protected NoticeManage nm = new NoticeManage();
	protected NoticeListDao dao = new NoticeListDaoImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		// 검색할 키워드 저장 및 확인
		String category = request.getParameter("category");
		String sort = request.getParameter("sort");
		String content = request.getParameter("content");
		String clicked = request.getParameter("clicked");
//		System.out.println(category);
//		System.out.println(sort);
//		System.out.println(content);
//		System.out.println(clicked);
		// -- NoticeManage에 저장

		nm.setSort(sort);
		nm.setCategory(category);
		nm.setContent(content);
		nm.setClicked(clicked);

//		System.out.println("nm:" + nm.getCategory());
//		System.out.println("nm:" + nm.getSort());
//		System.out.println("nm:" + nm.getContent());
//		System.out.println("nm:" + nm.getClicked());
		String key_notNum = request.getParameter("font_notNum");
		String key_notTitle = request.getParameter("edit_notTitle");
		String key_notContent = request.getParameter("edit_notContent");
		String editNotice = request.getParameter("btnEdit");
	
		System.out.println(key_notNum);
		System.out.println(key_notTitle);
		System.out.println(key_notContent);
		System.out.println(editNotice);
		// 수정 및 삭제할 키워드 저장 및 확인
		nm.setKey_notNum(key_notNum);
		nm.setKey_notTitle(key_notTitle);
		nm.setKey_notContent(key_notContent);
		nm.setEditNotice(editNotice);
		
//		System.out.println("abcabc"+nm.getKey_notFile());

		
		if (editNotice != null) {
			if (editNotice.equals("deleteNot") || editNotice.equals("updateNot")) {
				service.editNotData(nm);
			}
		}

		// 페이징 ▽
		Paging paging = null;
		List<Notice> list = null;

		String pageParam = request.getParameter("pageNo");
		int pageNo = 0;
		if (pageParam != null)
			pageNo = Integer.parseInt(pageParam);

		// 페이징 로직 처리

		int totalCount = dao.getTotal(nm);
		System.out.println(nm);
		if (totalCount != 0) {
			paging = new Paging(totalCount, pageNo);
			list = service.getNotList(paging, nm);
		}
		request.setAttribute("content", content);
		request.setAttribute("category", category);
		request.setAttribute("sort", sort);
		request.setAttribute("clicked", clicked);

		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		//
		request.getRequestDispatcher("/Manage_Page/noticeList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/Manage_Page/noticeList.jsp");
//		doGet(request, response);
	}

}
