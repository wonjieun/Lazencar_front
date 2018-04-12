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

@WebServlet("/sessionClose.do")
public class SessionControllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.invalidate();
		
//		response.sendRedirect("/Page/main.jsp");
//		Gson gson = new Gson();
//		JsonObject jsonObject = new JsonObject();
//		response.getWriter().write(gson.toJson(jsonObject));
//		request.getRequestDispatcher("/Page/main.jsp").forward(request, response);
	}

}
