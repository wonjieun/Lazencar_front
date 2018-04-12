package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.PaymentListDao;
import dao.adminDao.PaymentListDaoImpl;
import dto.Payment;
import dto.adminDto.PaymentManage;
import service.adminService.PaymentListService;
import service.adminService.PaymentListServiceImpl;
import util.Paging;

@WebServlet("/admin/paymentList.do")
public class PaymentListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected PaymentListService service = new PaymentListServiceImpl();
	PaymentListDao dao = new PaymentListDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		// 검색할 키워드 저장 및 확인
		String category = request.getParameter("category");
		String sort = request.getParameter("sort");
		String content = request.getParameter("content");
		String clicked = request.getParameter("clicked");
		// System.out.println(category);
		// System.out.println(sort);
		// System.out.println(content);
		// System.out.println(clicked);
		// -- CarManage에 저장
		PaymentManage pm = new PaymentManage();
		pm.setSort(sort);
		pm.setCategory(category);
		pm.setContent(content);
		pm.setClicked(clicked);

		System.out.println("pm:" + pm.getCategory());
		System.out.println("pm:" + pm.getSort());
		System.out.println("pm:" + pm.getContent());
		System.out.println("pm:" + pm.getClicked());

		// 페이징 ▽
		Paging paging = null;
		List<Payment> list = null;

		String pageParam = request.getParameter("pageNo");
		int pageNo = 0;

		if (pageParam != null)
			pageNo = Integer.parseInt(pageParam);

		// 페이징 로직 처리
		int totalCount = dao.getTotal(pm);
		// if(totalCount != 0) {
		paging = new Paging(totalCount, pageNo);// 총 게시물수와 페이지번호를 이용한 페이징 객체 생성
		list = service.getPaymentList(paging, pm); // 페이지에 맞는 게시물 갖고오기.
		for (int i = 0; i < list.size(); i++) {
			System.out.print(list.get(i) + " , ");
		}
		// }
		// System.out.println("서블릿 리스트출력: "+list.toString());
		// System.out.println("서블릿 dao.getTotal()출력 :"+totalCount);
		// System.out.println("서블릿 paging.getTotalCount() 출력 :"+paging.getTotalCount());
		// System.out.println("서블릿 paging.getStartNo(),
		// getEndNo출력:"+paging.getStartNo()+","+paging.getEndNo());
		request.setAttribute("content", content);
		request.setAttribute("category", category);
		request.setAttribute("sort", sort);
		request.setAttribute("clicked", clicked);

		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Manage_Page/paymentList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
