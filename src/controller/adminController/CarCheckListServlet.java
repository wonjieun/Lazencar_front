package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.adminDao.CarCheckListDao;
import dao.adminDao.CarCheckListDaoImpl;
import dto.Car;
import dto.adminDto.CarManage;
import util.Paging;

@WebServlet("/admin/carCheckList.do")
public class CarCheckListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
	CarCheckListDao dao = new CarCheckListDaoImpl();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		String url = request.getRequestURI();
		System.out.println(url);
		//페이징 ▽
		Paging paging =null;
		List<Car> list = null;
		
		String pageParam = request.getParameter("pageNo");
		int pageNo=0;
		if(pageParam != null) pageNo = Integer.parseInt(pageParam);
		
		//페이징 로직 처리
		int totalCount = dao.getTotal();
		if(totalCount != 0) {
			paging = new Paging(totalCount, pageNo);//총 게시물수와 페이지번호를 이용한 페이징 객체 생성
			list = dao.getList(paging); // 페이지에 맞는 게시물 갖고오기.
		}
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.setAttribute("url", url);
		request.getRequestDispatcher("/Manage_Page/carCheckList.jsp").forward(request, response);
		
		
		String searchItem = request.getParameter("searchItem");
		String orderItem = request.getParameter("orderItem");
		
		System.out.println(searchItem);
		System.out.println(orderItem);
		
		//-- CarManage에 저장
		CarManage cm = new CarManage();
		cm.setOrderItem(orderItem);
		cm.setSearchItem(searchItem);
		
//		//-- ajax response --//
		Gson gson = new Gson();

		String msg = "ajax 성공!!!!!1";
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("msg", gson.toJson(msg));
		response.getWriter().write(gson.toJson(jsonObject));
		
		
	}

}
