package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.Member;
import service.MemberFindService;
import service.MemberFindServiceImpl;

/**
 * Servlet implementation class MemberFindServlet
 */
@WebServlet("/login/findId.do")
//아이디값 받아오는 서블릿만들기
public class MemberFindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberFindService service = new MemberFindServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/Page/find.jsp").forward(req, resp);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		String memName = request.getParameter("memName");
		String memEmail = request.getParameter("memEmail");
		
		Member mem = new Member();
		mem.setMemName(memName);
		mem.setMemEmail(memEmail);
		System.out.println("----입력값 확인 ----");
		System.out.println("이름 : "+mem.getMemName());
		System.out.println("이메일 : "+mem.getMemEmail());
		
		
		Gson gson = new Gson();
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("memId", gson.toJson(service.getMemId(mem)));
		jsonObject.addProperty("msg", gson.toJson(service.getMsg(mem)));
		jsonObject.addProperty("memEmail", gson.toJson(mem.getMemEmail()));
		response.getWriter().write(gson.toJson(jsonObject));
	}

}
