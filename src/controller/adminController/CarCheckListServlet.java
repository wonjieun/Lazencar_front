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
import service.adminService.CarCheckListService;
import service.adminService.CarCheckListServiceImpl;
import util.Paging;

@WebServlet("/admin/carCheckList.do")
public class CarCheckListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected CarCheckListService service = new CarCheckListServiceImpl();
	protected CarManage cm = new CarManage();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/json; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		//검색할 키워드 저장 및 확인
		String category = request.getParameter("category");
		String sort = request.getParameter("sort");
		String content = request.getParameter("content");
		String clicked = request.getParameter("clicked");
		System.out.println(category);
		System.out.println(sort);
		System.out.println(content);
		System.out.println(clicked);
		//-- CarManage에 저장
		
		cm.setSort(sort);
		cm.setCategory(category);
		cm.setContent(content);
		cm.setClicked(clicked);

		System.out.println("cm:"+cm.getCategory());
		System.out.println("cm:"+cm.getSort());
		System.out.println("cm:"+cm.getContent());
		System.out.println("cm:"+cm.getClicked());
		
		//수정 및 삭제할 키워드 저장 및 확인
		String key_carNum=request.getParameter("font_carNum");
		String key_carCondi=request.getParameter("font_carCondi");
		String key_carLCD=request.getParameter("car_LCD");
		String editCar=request.getParameter("btnEdit");
		if(editCar!=null) {
		cm.setKey_carNum(key_carNum);
		cm.setKey_carCondi(key_carCondi);
		cm.setKey_carLCD(key_carLCD);
		cm.setEditCar(editCar);
		System.out.println(cm.getKey_carNum()+","+cm.getKey_carCondi()+","+cm.getKey_carLCD());
		System.out.println(cm.getEditCar());
			if(editCar.equals("deleteCar")
					||editCar.equals("updateCar")
			) {
				service.editCarData(cm);
			}
		}
		//페이징 ▽
		Paging paging =null;
		List<Car> list = null;
		
		String pageParam = request.getParameter("pageNo");
		int pageNo=0;
		if(pageParam != null) pageNo = Integer.parseInt(pageParam);
		
		//페이징 로직 처리
		
		int totalCount = dao.getTotal(cm);
		System.out.println(cm);
		if(totalCount != 0) {
			paging = new Paging(totalCount, pageNo);
			list = service.getCarList(paging,cm); 
		}
//		System.out.println("서블릿 리스트출력: "+list.toString());
//		System.out.println("서블릿 dao.getTotal()출력 :"+totalCount);
//		System.out.println("서블릿 paging.getTotalCount() 출력 :"+paging.getTotalCount());
//		System.out.println("서블릿 paging.getStartNo(), getEndNo출력:"+paging.getStartNo()+","+paging.getEndNo());
		request.setAttribute("content", content);
		request.setAttribute("category", category);
		request.setAttribute("sort", sort);
		request.setAttribute("clicked",clicked);
		
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Manage_Page/carCheckList.jsp").forward(request, response);
		
		
		
		
		
		////		req.getRequestDispatcher("/Manage_Page/carCheckList.jsp").forward(req, resp);
//		
//		doPost(req,resp);
	}
	CarCheckListDao dao = new CarCheckListDaoImpl();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/json; charset=utf-8");
//		request.setCharacterEncoding("UTF-8");
//		
//		//검색할 키워드 저장 및 확인
//		String category = request.getParameter("category");
//		String sort = request.getParameter("sort");
//		String content = request.getParameter("content");
//		String clicked = request.getParameter("clicked");
//		System.out.println(category);
//		System.out.println(sort);
//		System.out.println(content);
//		System.out.println(clicked);
//		//-- CarManage에 저장
//		
//		cm.setSort(sort);
//		cm.setCategory(category);
//		cm.setContent(content);
//		cm.setClicked(clicked);
//
//		System.out.println("cm:"+cm.getCategory());
//		System.out.println("cm:"+cm.getSort());
//		System.out.println("cm:"+cm.getContent());
//		System.out.println("cm:"+cm.getClicked());
//		
//		//수정 및 삭제할 키워드 저장 및 확인
//		String key_carNum=request.getParameter("font_carNum");
//		String key_carCondi=request.getParameter("font_carCondi");
//		String key_carLCD=request.getParameter("car_LCD");
//		String editCar=request.getParameter("btnEdit");
//		if(editCar!=null) {
//		cm.setKey_carNum(key_carNum);
//		cm.setKey_carCondi(key_carCondi);
//		cm.setKey_carLCD(key_carLCD);
//		cm.setEditCar(editCar);
//		System.out.println(cm.getKey_carNum()+","+cm.getKey_carCondi()+","+cm.getKey_carLCD());
//		System.out.println(cm.getEditCar());
//			if(editCar.equals("deleteCar")
//					||editCar.equals("updateCar")
//			) {
//				service.editCarData(cm);
//			}
//		}
//		//페이징 ▽
//		Paging paging =null;
//		List<Car> list = null;
//		
//		String pageParam = request.getParameter("pageNo");
//		int pageNo=0;
//		if(pageParam != null) pageNo = Integer.parseInt(pageParam);
//		
//		//페이징 로직 처리
//		
//		int totalCount = dao.getTotal(cm);
//		System.out.println(cm);
//		if(totalCount != 0) {
//			paging = new Paging(totalCount, pageNo);
//			list = service.getCarList(paging,cm); 
//		}
////		System.out.println("서블릿 리스트출력: "+list.toString());
////		System.out.println("서블릿 dao.getTotal()출력 :"+totalCount);
////		System.out.println("서블릿 paging.getTotalCount() 출력 :"+paging.getTotalCount());
////		System.out.println("서블릿 paging.getStartNo(), getEndNo출력:"+paging.getStartNo()+","+paging.getEndNo());
////		request.setAttribute("content", content);
////		request.setAttribute("category", category);
////		request.setAttribute("sort", sort);
//		
//		request.setAttribute("paging", paging);
//		request.setAttribute("list", list);
//		request.getRequestDispatcher("/Manage_Page/carCheckList.jsp").forward(request, response);
	}
}
