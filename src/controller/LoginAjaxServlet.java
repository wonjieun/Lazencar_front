package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.Member;
import service.LoginService;
import service.LoginServiceImpl;


@WebServlet("/login/login.do")
public class LoginAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LoginService service = new LoginServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		String id = request.getParameter("recommendId");
		
		Member user = new Member();
		user.setId(id);
		service.check(user);
		
		// 응답(response) 데이터
		//	1. 전체 추천 수 - service.getTotal()
		//	2. 전체 추천인 리스트 - service.getList()
		int cnt = service.getTotal();
		List<Member> list = service.getList();
		
		Gson gson = new Gson();
//		System.out.println(
//				"cnt toJson : " + gson.toJson(cnt) );
//		System.out.println(
//				"list toJson : " + gson.toJson(list) );
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("cnt", gson.toJson(cnt));
		jsonObject.addProperty("list", gson.toJson(list));
		
//		System.out.println(gson.toJson(jsonObject));
		
		response.getWriter().write(gson.toJson(jsonObject));
				
//		response.getWriter().write("{\"json\":\"test\"}");
		
//		response.getWriter().write(
//				"<h1>test</h1>");
				
	}

}
