package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.adminDto.MemberManage;
import dto.adminDto.MemberSearch;
import service.adminService.MemberManageService;
import service.adminService.MemberManageServiceImpl;

/*
 * Servlet implementation class userManage
 */
@WebServlet("/admin/userManage.do")
public class MemberManageServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private MemberManageService service = new MemberManageServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json; charset=utf-8");
	
	  String category = request.getParameter("category"); // select의 name이 cate, option의 value는 category로 받아짐
	  String content = request.getParameter("content");
	  String sort = request.getParameter("sort");
	  String clicked = request.getParameter("searchClicked");
	  
	  MemberSearch memSearch = new MemberSearch();
	  
	  memSearch.setCate(category);
	  memSearch.setContent(content);
	  memSearch.setSort(sort);
	  memSearch.setClicked(clicked);
	  
	  System.out.println("1. " + memSearch.getClicked());
	  System.out.println("2. " + memSearch.getCate());
	  System.out.println("3. " + memSearch.getContent());
	  System.out.println("4. " + memSearch.getSort());
	  
	  System.out.println("param : " + content);
	  System.out.println("var : " + content);
	  System.out.println("mem : " + memSearch.getContent());
	  
	  List<MemberManage> list = service.memberManage(memSearch);
	  System.out.println("size : " + list.size());
//	  System.out.println("list : " + list.get(0).getMemId());
	  request.setAttribute("list", list);
	  
	  request.getRequestDispatcher("/Manage_Page/MemberManage.jsp").forward(request, response);
	  
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		List<MemberManage> list = service.memberManage(new MemberSearch());
		
		System.out.println(list.size());
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("/Manage_Page/MemberManage.jsp").forward(req, resp);
	}
	  
	  
}
