package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.ReservManageDao;
import dao.adminDao.ReservManageDaoImpl;
import dto.Reservation;
import dto.adminDto.MemberManage;
import dto.adminDto.QnaManage;
import util.Paging;

@WebServlet("/admin/reservationManage.do")
public class ReservationManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected QnaManage qm = new QnaManage();
	ReservManageDao dao = new ReservManageDaoImpl();
//	MemberManage search = new MemberManage();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	
	  String category = request.getParameter("category"); // select의 name이 cate, option의 value는 category로 받아짐
	  String content = request.getParameter("content");
	  String sort = request.getParameter("sort");
	  String clicked = request.getParameter("clicked");
	  
//	  System.out.println("cate:"+category);
//	  System.out.println("clicked:"+clicked);
//	  System.out.println("content:"+content);
	  
	  qm.setCategory(category);
	  qm.setContent(content);
	  qm.setSort(sort);
	  qm.setClicked(clicked);
	  
	 String key_qnaNum = request.getParameter("key_qnaNum");
	 String edit_qnaAnswer = request.getParameter("edit_qnaAnswer");
	 String editQna = request.getParameter("btnEdit");
	
	  //페이징 ▽
	  Paging paging =null;
	  List<Reservation> list = null;

	  String pageParam = request.getParameter("pageNo");
	  int pageNo=0;
	  if(pageParam != null) 
		  pageNo = Integer.parseInt(pageParam);

	  //페이징 로직 처리
	  int totalCount = dao.getTotal(qm);
//	  System.out.println(totalCount);
	  	if (totalCount != 0) {
			paging = new Paging(totalCount, pageNo);
			list = dao.getList(paging, qm);
		}
//	  System.out.println("size : " + list.size());
//	  System.out.println("list : " + list.get(0).getMemId());
	  
	  request.setAttribute("clicked",clicked);
	  request.setAttribute("category",category);
	  request.setAttribute("content",content);
	  request.setAttribute("sort",sort);
	  
	  System.out.println(content);
	
	  request.setAttribute("paging", paging);
	  request.setAttribute("list", list);
	  
	  request.getRequestDispatcher("/Manage_Page/reservationCheck.jsp").forward(request, response);
	  
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}


