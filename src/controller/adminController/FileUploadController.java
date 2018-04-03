package controller.adminController;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.adminDao.PromotionRegisterDao;
import dao.adminDao.PromotionRegisterDaoImpl;
import service.adminService.CarRegisterService;
import service.adminService.CarRegisterServiceImpl;

@WebServlet("/admin/promotionRegister.do")
@SuppressWarnings("serial")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CarRegisterService service = new CarRegisterServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Manage_Page/promotionRegister.jsp").forward(req, resp);			//main.jsp에서 forward를 통해 받는다.
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if( !isMultipart ) {
			out.println("멀티파티 아님");
			return;
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		int maxMem = 1 * 1024 * 1024; // 1MB
		factory.setSizeThreshold(maxMem);//메모리사이즈 결정

		//디스크기반 처리 임시폴더
		File repository = new File(getServletContext().getRealPath("tmpFile"));
		factory.setRepository(repository);

		ServletFileUpload upload = new ServletFileUpload(factory);
		int maxRequest = 200 * 1024 * 1024; // 100MB
		upload.setSizeMax(maxRequest);//최대허용크기 설정

		List<FileItem> items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		Iterator iter = items.iterator();
		while(iter.hasNext()) {
			FileItem item = (FileItem) iter.next();

			// 빈파일
			if(item.getSize() <= 0) continue;
			
			if(item.isFormField()) {
				out.print("폼 필드 : " + item.getFieldName() + ", 값 : " + item.getString("UTF-8") + "<br>");
			} else {
				String fileName = item.getName();
				String contentType = item.getContentType();

				PromotionRegisterDao dao = new PromotionRegisterDaoImpl();

				if(contentType.contains("image")) {
//					System.out.println("name:" + "/upload/"+up.getName());

					// 중복된 파일이름에 대한 처리 필요
//					있으면 파일이름 + _new Date
					
					
					File up = new File(getServletContext().getRealPath("upload"), fileName);
					try {
						item.write( up );
					} catch (Exception e) {
						e.printStackTrace();
					}

					dao.insertImage(up.getName());
				}
				
			}
		}

		response.sendRedirect("/admin/promotionList.do");
	}
}
