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

@WebServlet("/service/notice.do")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NoticeService service = new NoticeServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		String num = request.getParameter("num");
		
		Notice n = new Notice();
		n.setNotNum(num);
		
		request.setAttribute("list", service.getNotice(n));
		
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/Page/noticeView.jsp"); 
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
