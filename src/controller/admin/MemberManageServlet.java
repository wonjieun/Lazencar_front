package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.admin.MemberManage;
import dto.admin.MemberSearch;
import service.admin.MemberManageService;
import service.admin.MemberManageServiceImpl;

/*
 * Servlet implementation class userManage
 */
@WebServlet("/admin/userManage.do")
public class MemberManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberManageService service = new MemberManageServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
	
	  String category = request.getParameter("category"); // select의 name이 cate, option의 value는 category로 받아짐
	  String content = request.getParameter("search_content");
	  String sort = request.getParameter("sort");
	  String clicked = request.getParameter("searchClicked");
	  
	  MemberSearch memSearch = new MemberSearch();
	  
	  memSearch.setCate(category);
	  memSearch.setContent(content);
	  memSearch.setSort(sort);
	  memSearch.setClicked(clicked);
	  
	  
	  List<MemberManage> list = service.memberManage(memSearch);
	  
	  request.setAttribute("list", list);
	  
	  request.getRequestDispatcher("/Manage_Page/MemberManage.jsp").forward(request, response);
	  
	}
	  
	  
}
