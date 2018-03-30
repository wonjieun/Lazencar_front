package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.admin.MemberManage;
import service.MemberFindService;
import service.MemberFindServiceImpl;

/**
 * Servlet implementation class userManage
 */
@WebServlet("/admin/userManage.do")
public class MemberManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberManageServlet service = new MemberManageServlet();
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		String memId = request.getParameter("memId");
		String memJumin = request.getParameter("memJumin");
		boolean memLicense = request.getParameter("memLicense") != null;
		
		MemberManage mem = new MemberManage();
		
		mem.setMemId(memId);
		mem.setMemJumin(memJumin);
		mem.setMemLicense(memLicense);
		
		System.out.println("----입력값 확인 ----");
		System.out.println("아이디 : "+mem.getMemId());
		System.out.println("주민번호 : "+mem.getMemJumin());
		System.out.println("면허 여부 : " + mem.isMemLicense());		
		
		Gson gson = new Gson();
		
	
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("memId", gson.toJson(service.getMemId(mem)));
		jsonObject.addProperty("memJumin", gson.toJson(service.getJumin(mem)));
		jsonObject.addProperty("memLicense", gson.toJson(service.getLicense(mem)));
		response.getWriter().write(gson.toJson(jsonObject));
		
	
	}

}
