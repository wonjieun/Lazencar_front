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
import service.MemberModifyDataService;
import service.MemberModifyDataServiceImpl;

@WebServlet("/modifyData.do")
public class MemberModifyDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		MemberModifyDataService service = new MemberModifyDataServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String memName = request.getParameter("memName");
		String memPhone = request.getParameter("memPhone");
		String memAddr = request.getParameter("memAddr");
		String memEmail = request.getParameter("memEmail");
		String memJumin = request.getParameter("memJumin");
		String licenType = request.getParameter("licenType");
		String licenNum = request.getParameter("licenNum");
		String licenIssueDate = request.getParameter("licenIssueDate");
		String licenLimitDate = request.getParameter("licenLimitDate");
		String licenAddr = request.getParameter("licenAddr");
		
		
		Member mem = new Member();
		mem.setMemId(memId);
		mem.setMemPw(memPw);
		mem.setMemName(memName);
		mem.setMemPhone(memPhone);
		mem.setMemAddr(memAddr);
		mem.setMemEmail(memEmail);
		mem.setMemJumin(memJumin);
		mem.setLicenType(licenType);
		mem.setLicenNum(licenNum);
		mem.setLicenIssueDate(licenIssueDate);
		mem.setLicenLimitDate(licenLimitDate);
		mem.setLicenAddr(licenAddr);
		
//		System.out.println("test");
//		System.out.println(mem.getMemName());
		service.modifyData(mem);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		response.getWriter().write(gson.toJson(jsonObject));
	}
}
