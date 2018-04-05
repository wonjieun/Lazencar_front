package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Notice;
import service.NoticeService;
import service.NoticeServiceImpl;

@WebServlet("/service/list.do")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	NoticeService service = new NoticeServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String searchItem = request.getParameter("searchItem");		
		String searchWord = request.getParameter("searchWord");
		
		System.out.println("searchItem: " + searchItem);
		System.out.println("searchWord: " + searchWord);
		
		Notice n = new Notice();
		n.setSearchItem(searchItem);
		n.setSearchWord(searchWord);
		
		System.out.println("검색 제목: " + ((Notice)service.getTitle(n).get(0)).getTitle());
		
		request.setAttribute("list", service.getTitle(n));
		
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/Page/notice.html"); 
		rd.forward(request, response);
	}

}
