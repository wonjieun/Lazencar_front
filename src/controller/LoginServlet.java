package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import dto.Member;
import service.LoginService;
import service.LoginServiceImpl;

@WebServlet("/login/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LoginService service = new LoginServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		// 사용자가 입력한 id, pw
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		
		// member객체에 id, pw set
		Member mem = new Member();
		mem.setMemId(memId);
		mem.setMemPw(memPw);
		service.check(mem);
		
		// response data
		boolean check = service.check(mem);
		
		System.out.println("----- 입력값 확인 -----");
		System.out.println("아이디: " + mem.getMemId());
		System.out.println("비밀번호: " + mem.getMemPw());
		
		// 객체를 json으로 변경하기
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		// gson.toJson(check) - 자바스크립트 기준 Json형식으로 바꿨다. jsp에서 다시 파싱 필요
		// check - 기본 타입만 가능하다
		// 기본타입 외에 요소들은 JsonElement에 넣어주어야 한다.
		// 어떤 타입이던지 JsonObject로 감싸야 한다.
		JsonObject e = new JsonObject();
		JsonArray a = new JsonArray();
		// 배열
		a.add("Array test");
		jsonObject.add("array", a);
		
		// { key: value } Object
		// { object: {"Object test":123} }
		e.addProperty("Object test", 123);
		System.out.println(gson.toJson(e));  // {"Object test":123}
		jsonObject.add("object", e);
		System.out.println(gson.toJson(e));  // {"Object test":123}
		System.out.println(gson.toJson(jsonObject));
		
		// { check: check(boolean) }
		// jsonObject.addProperty("check", gson.toJson(check));
		jsonObject.addProperty("check", check);
		// session 생성
		// session은 클라이언트가 알지 못하는 클래스 이다.
		// jsp or servlet에 반응한다.
		if(check) {
			HttpSession session = request.getSession();
			session.setAttribute("id", mem.getMemId());
			
			// ajax와 sendRedirect 모두 response를 할 수 없다.
//			response.sendRedirect("/Page/p01_main.html");
			
		}
		// ajax 응답을 하면서 해당 servlet의 역할은 종료하기 때문에
		// session은 ajax 응답 하기 전에 적어주어야 한다.
		// ajax 응답
		out.write(gson.toJson(jsonObject));
	}

}
