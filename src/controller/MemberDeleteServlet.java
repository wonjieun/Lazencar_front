package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.Member;
import service.MemberDeleteService;
import service.MemberDeleteServiceImpl;

@WebServlet("/delete.do")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberDeleteService service = new MemberDeleteServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		
		// 사용자 지우기위해 pk인 아이디 불러오고 일치확인 위한 pw 입력받아옴
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		
		// member객체에 id, pw set
		Member mem = new Member();
		mem.setMemId(memId);
		mem.setMemPw(memPw);
//		service.delete(mem);
//		System.out.println("test2");
//		System.out.println(service.delete(mem));
		//비밀번호 확인용 변수에 리턴값 저장
		
//		System.out.println("test3");
		boolean check = service.delete(mem);
//		System.out.println(check);
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("check", check); //jason 데이터 입력
		response.getWriter().write(gson.toJson(jsonObject));
	}

}
