package controller.adminController;

import java.io.IOException;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import dao.ReviewDaoImpl;
import dao.adminDao.MemberManageDao;
import dao.adminDao.MemberManageDaoImpl;
import util.Paging;
import dto.Car;
import dto.Review;
import dto.adminDto.CouponManage;
import dto.adminDto.MemberManage;
import service.adminService.MemberManageService;
import service.adminService.MemberManageServiceImpl;

/*
 * Servlet implementation class userManage
 */
@WebServlet("/admin/memberManage.do")
public class MemberManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberManageService service = new MemberManageServiceImpl();
	MemberManageDao dao = new MemberManageDaoImpl();
	MemberManage search = new MemberManage();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	
	  String category = request.getParameter("category"); // select의 name이 cate, option의 value는 category로 받아짐
	  String content = request.getParameter("content");
	  String sort = request.getParameter("sort");
	  String clicked = request.getParameter("searchClicked");
	  
	  System.out.println("cate:"+category);
	  System.out.println("clicked:"+clicked);
	  System.out.println("content:"+content);
	  
	  //MemberSearch에 저장
	  search.setCate(category);
	  search.setContent(content);
	  search.setSort(sort);
	  search.setClicked(clicked);
	  
	  //페이징 ▽
	  Paging paging =null;
	  List<MemberManage> list = null;

	  String pageParam = request.getParameter("pageNo");
	  int pageNo=0;
	  if(pageParam != null) pageNo = Integer.parseInt(pageParam);

	  //페이징 로직 처리
	  int totalCount = dao.getTotal(search);
	  System.out.println(totalCount);
//	  if(totalCount != 0) {
	  paging = new Paging(totalCount, pageNo);//총 게시물수와 페이지번호를 이용한 페이징 객체 생성
	  System.out.println(paging);
	  list = service.getList(paging,search); // 페이지에 맞는 게시물 갖고오기.
//	  }
	  
	  
	  
	  list = service.getList(paging, search);
//	  System.out.println("size : " + list.size());
//	  System.out.println("list : " + list.get(0).getMemId());
	  
	  request.setAttribute("paging", paging);
	  request.setAttribute("list", list);
	  request.getRequestDispatcher("/Manage_Page/memberManage.jsp").forward(request, response);
	  
	}
	
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//페이징 로직 처리
		int pageNo = 0;
		if( req.getParameter("pageNo") != null)
			pageNo = Integer.parseInt( req.getParameter("pageNo") );

		System.out.println("pageNo : " + pageNo);

//		int totalCount = dao.getTotal(search);
//		paging = new Paging(totalCount);//총 게시물수와 페이지번호를 이용한 페이징 객체 생성

		Paging paging = new Paging(dao.getTotal(new MemberManage()), pageNo);

		List<MemberManage> list = null;
		list = service.getList(paging, new MemberManage());
		
		System.out.println(list.size());
		
		System.out.println(paging);
		req.setAttribute("url", req.getRequestURI());
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);

		req.getRequestDispatcher("/Manage_Page/memberManage.jsp").forward(req, resp);
		
		
		
	}
	  
	  
}


