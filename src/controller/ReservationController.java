package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MakePaymentDao;
import dto.Car;
import dto.Coupon;
import dto.Damage;
import dto.Etc;
import dto.Reservation;
import service.ReservationService;
import service.ReservationServiceImpl;

@WebServlet("/reservation/reservation.do")
public class ReservationController extends HttpServlet {

	private ReservationService res_service = new ReservationServiceImpl();
	MakePaymentDao dao = new MakePaymentDao();
	Car car = new Car();
	Damage damage = new Damage();
	Etc etc = new Etc();
	int payNum = 0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		// String carName = request.getParameter("CAR_NAME");
		List<Car> carList = res_service.car_list();
		request.setAttribute("carList", carList);

		// System.out.println(carList.size());
		List<Coupon> couponList = res_service.coupon_list();
		request.setAttribute("couponList", couponList);

		// System.out.println(damageList.size());
		List<Damage> damageList = res_service.damage_list();
		request.setAttribute("damageList", damageList);

		// System.out.println(etcList.size());
		List<Etc> etcList = res_service.etc_list();
		request.setAttribute("etcList", etcList);

		
		request.getRequestDispatcher("/Page/reservation_res.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		Reservation res = new Reservation();
		Coupon cou = new Coupon();

		// 확인
		System.out.println("MEM_ID : " + request.getParameter("MEM_ID"));// 차량 번호
		System.out.println(request.getParameter("CAR_NUM"));// 차량 번호
		System.out.println(request.getParameter("RES_START"));// 차량 시작일
		System.out.println(request.getParameter("RES_END"));// 차량 반납일
		System.out.println(request.getParameter("COU_NAME"));// 쿠폰
		System.out.println(request.getParameter("CaptionSend"));// 옵션 선택
		System.out.println(request.getParameter("carcondi"));// 차량 보험 선택
		System.out.println(request.getParameter("NORMAL_PRICE"));// 할인 전 총합계 내용
		System.out.println(request.getParameter("DC_PRICE"));// 할인 가격 내용

		// res.setResNum(Integer.parseInt(request.getParameter("")));
		res.setMemId(request.getParameter("MEM_ID"));
		res.setCarNum(request.getParameter("CAR_NUM"));
		res.setResStart(request.getParameter("RES_START"));
		res.setResEnd(request.getParameter("RES_END"));
		res.setCouNum(Integer.parseInt(request.getParameter("COU_NAME")));
		res.setOptionList(request.getParameter("CaptionSend"));
		res.setCarDemage(request.getParameter("carcondi"));
		res.setNormalPrice(Integer.parseInt(request.getParameter("NORMAL_PRICE")));
		res.setDcPrice(Integer.parseInt(request.getParameter("DC_PRICE")));

		ReservationService res_service = new ReservationServiceImpl();
		res_service.insertRES(res);
		// 예약이 입력된 후 실행

		payNum = dao.getResNum();
		System.out.println("payNum : " + payNum);
		System.out.println("res.getDcPrice():" + res.getDcPrice());
		dao.insertPayment(payNum);
		// 컨트롤러 res 출력
		System.out.println("reservationContorll res 출력" + res.getMemId());
		
//		response.sendRedirect("/reservation/payment.do");
		request.getRequestDispatcher("/reservation/payment.do").forward(request, response);
	}

}
