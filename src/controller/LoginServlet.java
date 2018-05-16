package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.Member;
import service.LoginService;
import service.LoginServiceImpl;

@WebServlet("/login/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LoginService service = new LoginServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/Page/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		// 사용자가 입력한 id, pw
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String memEmail = request.getParameter("memEmail");
		String token = request.getParameter("token");
		
//		if(memPw.equals(null))
//			System.out.println(memPw);
		
		// member객체에 id, pw set
		Member mem = new Member();
		mem.setMemId(memId);
		mem.setMemPw(memPw);
		mem.setMemEmail(memEmail);
		service.signUpSNS(mem);
		
		// response data
		boolean check = service.check(mem);
		int gubn = service.getGubn(mem);

		if(token != null) {
			check = true;
			gubn = 1;
		}
		
		System.out.println("----- 입력값 확인 -----");
		System.out.println("아이디: " + mem.getMemId());
		System.out.println("비밀번호: " + mem.getMemPw());
		System.out.println("이메일: " + mem.getMemEmail());
		System.out.println("구분: " + gubn);
		System.out.println("token: " + token);
		System.out.println("check: " + check);
		
		// 객체를 json으로 변경하기
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("check", check);
		jsonObject.addProperty("gubn", gubn);
		jsonObject.addProperty("token", token);
		
		if(check) {
			session.setAttribute("id", mem.getMemId());
			session.setAttribute("token", token);
//			System.out.println("session:"+session.getAttribute("id"));
//			System.out.println("session:"+session.getAttribute("token"));
		}
		out.write(gson.toJson(jsonObject));
	}

}
