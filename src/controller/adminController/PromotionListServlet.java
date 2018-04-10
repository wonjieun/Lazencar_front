package controller.adminController;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.PromotionListDao;
import dao.adminDao.PromotionListDaoImpl;
import dto.adminDto.PromotionManage;
import jdk.management.resource.internal.TotalResourceContext;
import service.adminService.PromotionListService;
import service.adminService.PromotionListServiceImpl;
import util.Paging;

@WebServlet("/admin/promotionList.do")
public class PromotionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PromotionListService service = new PromotionListServiceImpl();
	PromotionListDao dao = new PromotionListDaoImpl();
	PromotionManage pm = new PromotionManage();
			
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		//검색할 키워드 저장 및 확인
		String content = request.getParameter("content");
		String clicked = request.getParameter("clicked");
		
		System.out.println("content:"+content);
		System.out.println("clicked:"+clicked);
		
		//PromotionManage에 저장
		pm.setContent(content);
		pm.setClicked(clicked);

		System.out.println("content:"+pm.getContent());
		System.out.println("clicked:"+pm.getClicked());
		
		
		/*
		
		//수정 및 삭제할 키워드 저장 및 확인
		String key_PromotionNum=request.getParameter("key_couNum");
		String key_PromotionName=request.getParameter("key_couName");
		String key_PromotionStart=request.getParameter("key_startDate");
		String key_PromotionEnd=request.getParameter("key_endDate");
		String key_ageConst=request.getParameter("key_ageConst");
		String key_timeConst=request.getParameter("key_timeConst");
		String key_carConst=request.getParameter("key_carConst");
		String key_discount=request.getParameter("key_discount");
		String editPromotion=request.getParameter("btnEdit");
		if(editPromotion!=null) {
		pm.setKey_PromotionNum(key_PromotionNum);
		pm.setKey_PromotionName(key_PromotionName);
		pm.setKey_PromotionStart(key_PromotionStart);
		pm.setKey_PromotionEnd(key_PromotionEnd);
		pm.setKey_ageConst(key_ageConst);
		pm.setKey_timeConst(key_timeConst);
		pm.setKey_carConst(key_carConst);
		pm.setKey_discount(key_discount);
		pm.setEditPromotion(editPromotion);
		
		System.out.println(pm.getKey_PromotionNum()+","+pm.getKey_PromotionName()+","
		+pm.getKey_PromotionStart()+","+pm.getKey_PromotionEnd()+","+pm.getKey_ageConst()+","
		+pm.getKey_timeConst()+","+pm.getKey_carConst()+","+pm.getKey_discount()+",");
		
		System.out.println(pm.getEditPromotion());
		
		if(editPromotion.equals("deletePromotion")||editPromotion.equals("updatePromotion")	) {
				service.editPromotionData(pm);
			}
		}
		
		*/
		
		//페이징 ▽
		Paging paging =null;
		List<PromotionManage> list = null;

		String pageParam = request.getParameter("pageNo");
		int pageNo=0;
		if(pageParam != null) pageNo = Integer.parseInt(pageParam);
		
		//페이징 로직 처리
		int totalCount = dao.getTotal(pm);
		System.out.println(totalCount);
//		if(totalCount != 0) {
			paging = new Paging(totalCount, pageNo);//총 게시물수와 페이지번호를 이용한 페이징 객체 생성
			list = service.getPromotionList(paging,pm); // 페이지에 맞는 게시물 갖고오기.
//			System.out.println(list.get(0));
//		}
//		System.out.println("서블릿 리스트출력: "+list.toString());
//		System.out.println("서블릿 dao.getTotal()출력 :"+totalCount);
//		System.out.println("서블릿 paging.getTotalCount() 출력 :"+paging.getTotalCount());
//		System.out.println("서블릿 paging.getStartNo(), getEndNo출력:"+paging.getStartNo()+","+paging.getEndNo());
		request.setAttribute("clicked",clicked);
		request.setAttribute("content",content);
			
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Manage_Page/promotionList.jsp").forward(request, response);
		System.out.println("리스트 : "+list);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
