package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationCheckDao;
import dao.ReservationCheckDaoImpl;
import dto.Reservation;
import dto.Member;

@SuppressWarnings("serial")
@WebServlet("/reservCheck.do")
public class ReservationCheckServlet extends HttpServlet {
	
	private ReservationCheckDao dao = new ReservationCheckDaoImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String memId = session.getAttribute("id").toString();
//		String memId = request.getParameter("id");
		Member mem = new Member();
		mem.setMemId(memId);
		System.out.println(memId);
		List<Reservation> list = null;	// 예약리스트
		list = dao.getList(memId);		// 아이디기준 예약 리스트 받아오기
		// 예약 총 리스트 개수
		int totalCount = dao.getTotal(memId);	// 총 게시물 수
//		System.out.println(list);
//		System.out.println(totalCount);
		// 쿠폰리스트 모델로써 전달
		request.setAttribute("resList", list);
		request.setAttribute("resTotal", totalCount);
		request.getRequestDispatcher("/Page/reservationCheck2.jsp").forward(request, response);
		
//		Gson gson = new Gson();
//		JsonObject jsonObject = new JsonObject();
//		String jsonlist = gson.toJson(list);
//		System.out.println(jsonlist);
//		jsonObject.addProperty("list", jsonlist);
//		jsonObject.addProperty("total", totalCount);
//		response.getWriter().write(gson.toJson(jsonObject));
//		System.out.println(jsonObject);
//		// list 페이지 불러오기
	}
}
