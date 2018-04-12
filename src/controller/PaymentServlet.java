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
import dto.Payment;
import dto.Reservation;
import service.ReservationService;
import service.ReservationServiceImpl;

@WebServlet("/reservation/payment.do")
public class PaymentServlet extends HttpServlet {
	MakePaymentDao dao = new MakePaymentDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		Payment pay = new Payment();
		
		dao.getPayment(pay);
		
		System.out.println("payAmount : "+pay.getPayAmount());
		String title = pay.getPayName()+pay.getPayNum();
		request.setAttribute("pay", pay);
		
		request.setAttribute("amount", pay.getPayAmount());
		request.setAttribute("phone", pay.getPayPhone());
		request.setAttribute("email", pay.getPayEmail());
		request.setAttribute("title",title );
		request.setAttribute("name", pay.getPayName());

		System.out.println("결제 상태 바꾸기 시작");
		String result = null;
		result = request.getParameter("result");
		System.out.println(result);
		if(result != null) {
			System.out.println("result:" +result);
			if(result.equals("결제 완료")) {
				dao.updatePayStatus(pay.getPayNum());
				System.out.println("결제데이터 넘버"+pay.getPayNum()+"번 상태 결제완료로 변경함.");
			}else if(result.equals("결제 실패")) {
				dao.deletePayment(pay.getPayNum());
				dao.deleteReservation(pay.getPayNum());
				System.out.println("결제데이터 넘버"+pay.getPayNum()+"번의 결제,예약데이터 삭제함.");
			}else {
				System.out.println("result값 가져오기 실패 또는 값 오류");
			}
		}
		
//		response.sendRedirect("/Page/payment.jsp");
		request.getRequestDispatcher("/Page/payment.jsp").forward(request, response);
	}

}
