package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Reservation;
import dto.Car;
import dto.Coupon;
import service.ReservationService;
import service.ReservationServiceImpl;

@WebServlet("/reservation/reservation.do")
public class ReservationController extends HttpServlet {
		
	private ReservationService res_service = new ReservationServiceImpl();
	Car car = new Car();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
//		String carName = request.getParameter("CAR_NAME");
		
		List<Car> carList = res_service.car_list();
		request.setAttribute("carList", carList);
		
//		System.out.println(carList.size());
		List<Coupon> couponList = res_service.coupon_list();
		request.setAttribute("couponList", couponList);
		
		request.getRequestDispatcher("/Page/reservation_res.jsp").forward(request, response);
		
		
		//차 이름으로 정보를 받아오기
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		Reservation res = new Reservation();
		Coupon cou = new Coupon();
		
		//확인
		System.out.println(request.getParameter("CAR_NUM"));
		System.out.println(request.getParameter("RES_START"));
		System.out.println(request.getParameter("RES_END"));
		System.out.println(request.getParameter("CaptionSend"));
		System.out.println(request.getParameter("carcondi"));
		
		//수정전
		res.setResNum(Integer.parseInt(request.getParameter("")));
		res.setMemId(request.getParameter(""));
		res.setCarNum(request.getParameter("CAR_NUM"));
		res.setResStart(request.getParameter("RES_START"));
		res.setResEnd(request.getParameter("RES_END"));
		cou.setNo(Integer.parseInt(request.getParameter("COU_NAME")));
		res.setOptionList(request.getParameter("CaptionSend"));
		res.setCarDemage(request.getParameter("carcondi"));
		
		ReservationService res_service = new ReservationServiceImpl();
		res_service.insertRES(res, cou);
		
	}

}
