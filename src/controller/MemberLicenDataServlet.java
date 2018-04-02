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
import service.MemberLicenDataService;
import service.MemberLicenDataServiceImpl;

@WebServlet("/LicenData.do")
public class MemberLicenDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		MemberLicenDataService service = new MemberLicenDataServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		String memName = request.getParameter("memName");
		String memJumin = request.getParameter("memJumin");
		String licenType = request.getParameter("licenType");
		String licenNum = request.getParameter("licenNum");
		String licenIssueDate = request.getParameter("licenIssueDate");
		String licenLimitDate = request.getParameter("licenLimitDate");
		String licenAddr = request.getParameter("licenAddr");
		
		
		Member mem = new Member();
		mem.setMemName(memName);
		mem.setMemJumin(memJumin);
		mem.setLicenType(licenType);
		mem.setLicenNum(licenNum);
		mem.setLicenIssueDate(licenIssueDate);
		mem.setLicenLimitDate(licenLimitDate);
		mem.setLicenAddr(licenAddr);
		
//		System.out.println("test");
//		System.out.println(mem.getMemName());
		service.LicenData(mem);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		response.getWriter().write(gson.toJson(jsonObject));
	}
}
