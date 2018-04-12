package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.QnaListDao;
import dao.adminDao.QnaListDaoImpl;
import dto.Qna;
import dto.adminDto.QnaManage;
import service.adminService.QnaListService;
import service.adminService.QnaListServiceImpl;
import util.Paging;

/**
 * Servlet implementation class NotListServlet
 */
@WebServlet("/admin/qnaList.do")
public class QNAListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected QnaListService service = new QnaListServiceImpl();
	protected QnaManage qm = new QnaManage();
	protected QnaListDao dao = new QnaListDaoImpl();

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
		// -- qnaManage에 저장

		qm.setSort(sort);
		qm.setCategory(category);
		qm.setContent(content);
		qm.setClicked(clicked);

//		System.out.println("qm:" + qm.getCategory());
//		System.out.println("qm:" + qm.getSort());
//		System.out.println("qm:" + qm.getContent());
//		System.out.println("qm:" + qm.getClicked());
		String key_qnaNum = request.getParameter("key_qnaNum");
		String edit_qnaAnswer = request.getParameter("edit_qnaAnswer");
		String editQna = request.getParameter("btnEdit");
	
		System.out.println(key_qnaNum);
		System.out.println(edit_qnaAnswer);
		System.out.println(editQna);
		
		// 수정 및 삭제할 키워드 저장 및 확인
		qm.setKey_qnaNum(key_qnaNum);
		qm.setEdit_qnaAnswer(edit_qnaAnswer);
		qm.setEditQna(editQna);
		
		
		if (editQna != null) {
			if ("deleteQna".equals(editQna) || "updateQna".equals(editQna)) {
				service.editQnaData(qm);
			}
		}

		// 페이징 ▽
		Paging paging = null;
		List<Qna> list = null;

		String pageParam = request.getParameter("pageNo");
		int pageNo = 0;
		if (pageParam != null)
			pageNo = Integer.parseInt(pageParam);

		// 페이징 로직 처리

		int totalCount = dao.getTotal(qm);
		System.out.println(qm);
		if (totalCount != 0) {
			paging = new Paging(totalCount, pageNo);
			list = service.getQnaList(paging, qm);
		}
		request.setAttribute("content", content);
		request.setAttribute("category", category);
		request.setAttribute("sort", sort);
		request.setAttribute("clicked", clicked);

		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		//
		request.getRequestDispatcher("/Manage_Page/qnaList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/Manage_Page/qnaList.jsp");
//		doGet(request, response);
	}

}
