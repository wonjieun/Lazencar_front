package controller.adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.Car;
import service.adminService.CarRegisterService;
import service.adminService.CarRegisterServiceImpl;

/**
 * Servlet implementation class CarRegisterServlet
 */
@WebServlet("/admin/carRegister.do")
public class CarRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		CarRegisterService service = new CarRegisterServiceImpl();
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doPost(req,resp);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		String carNum = request.getParameter("carNum");
		String carName = request.getParameter("carName");
		String carCategory = request.getParameter("carCategory");
		String carOil = request.getParameter("carOil");
		String carCondi = request.getParameter("carCondi");
		String carLCD = request.getParameter("carLCD");
		
		
		System.out.println("차량이름 :"+ carName);
		System.out.println("차량번호 :"+ carNum);
		System.out.println("차량종류  :"+ carCategory);
		System.out.println("유종 : "+carOil);
		System.out.println("차량상태 :"+carCondi);
		System.out.println("차량LCD :"+carLCD);
		
		
		Car car = new Car();
		car.setCarName(carName);
		car.setCarNum(carNum);
		car.setCarCategory(carCategory);
		car.setCarCondi(carCondi);
		car.setCarOil(carOil);
		car.setCarLCD(carLCD);
		
		Gson gson = new Gson();

		String msg = "ajax 성공!!!!!1";
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("msg", gson.toJson(msg));
		response.getWriter().write(gson.toJson(jsonObject));
		service.carRegister(car);
	
//		request.getRequestDispatcher("/Manage_Page/carRegister.jsp").forward(request, response);
	}
}
