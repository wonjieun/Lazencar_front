package controller.adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.CouponListDao;
import dao.adminDao.CouponListDaoImpl;
import dto.adminDto.CouponManage;
import service.adminService.CouponListService;
import service.adminService.CouponListServiceImpl;
import util.Paging;

@WebServlet("/admin/couponList.do")
public class CouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CouponListService service = new CouponListServiceImpl();
	CouponListDao dao = new CouponListDaoImpl();
	CouponManage cm = new CouponManage();
			
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		//검색할 키워드 저장 및 확인
		String category = request.getParameter("category");
		String sort = request.getParameter("sort");
		String content = request.getParameter("content");
		String clicked = request.getParameter("clicked");
		
		System.out.println("cate:"+category);
		System.out.println("sort:"+sort);
		System.out.println("content:"+content);
		System.out.println("clicked:"+clicked);
		
		//CouponManage에 저장
		cm.setSort(sort);
		cm.setCategory(category);
		cm.setContent(content);
		cm.setClicked(clicked);

		System.out.println("cm:"+cm.getCategory());
		System.out.println("sort:"+cm.getSort());
		System.out.println("content:"+cm.getContent());
		System.out.println("clicked:"+cm.getClicked());
		
		
		//수정 및 삭제할 키워드 저장 및 확인
		String key_couponNum=request.getParameter("key_couNum");
		String key_couponName=request.getParameter("key_couName");
		String key_couponStart=request.getParameter("key_couStartDate");
		String key_couponEnd=request.getParameter("key_couEndDate");
		String key_ageConst=request.getParameter("key_couAgeConst");
		String key_timeConst=request.getParameter("key_couTimeConst");
		String key_carConst=request.getParameter("key_couCarConst");
		String key_discount=request.getParameter("key_couDiscount");
		String editCoupon=request.getParameter("btnEdit");
		
		if(editCoupon!=null) {
		cm.setKey_couponNum(key_couponNum);
		cm.setKey_couponName(key_couponName);
		cm.setKey_couponStart(key_couponStart);
		cm.setKey_couponEnd(key_couponEnd);
		cm.setKey_ageConst(key_ageConst);
		cm.setKey_timeConst(key_timeConst);
		cm.setKey_carConst(key_carConst);
		cm.setKey_discount(key_discount);
		cm.setEditCoupon(editCoupon);
		
		System.out.println(cm.getKey_couponNum()+","+cm.getKey_couponName()+","
		+cm.getKey_couponStart()+","+cm.getKey_couponEnd()+","+cm.getKey_ageConst()+","
		+cm.getKey_timeConst()+","+cm.getKey_carConst()+","+cm.getKey_discount()+",");
		
		System.out.println(cm.getEditCoupon());
		
		if(editCoupon.equals("deleteCoupon")||editCoupon.equals("updateCoupon")	) {
				service.editCouponData(cm);
			}
		}
		//페이징 ▽
		Paging paging =null;
		List<CouponManage> list = null;

		String pageParam = request.getParameter("pageNo");
		int pageNo=0;
		if(pageParam != null) pageNo = Integer.parseInt(pageParam);
		
		//페이징 로직 처리
		int totalCount = dao.getTotal(cm);
			paging = new Paging(totalCount, pageNo);//총 게시물수와 페이지번호를 이용한 페이징 객체 생성
			list = service.getCouponList(paging,cm); // 페이지에 맞는 게시물 갖고오기.
//		System.out.println("서블릿 리스트출력: "+list.toString());
//		System.out.println("서블릿 dao.getTotal()출력 :"+totalCount);
//		System.out.println("서블릿 paging.getTotalCount() 출력 :"+paging.getTotalCount());
//		System.out.println("서블릿 paging.getStartNo(), getEndNo출력:"+paging.getStartNo()+","+paging.getEndNo());
		request.setAttribute("clicked",clicked);
		request.setAttribute("category",category);
		request.setAttribute("content",content);
		request.setAttribute("sort",sort);
			
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		for(int i=0; i<list.size() ; i++) {
			
			System.out.println("리스트 : "+(list.get(i)));
		}
		request.getRequestDispatcher("/Manage_Page/couponList.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
