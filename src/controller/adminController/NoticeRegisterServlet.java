package controller.adminController;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import dto.Notice;
import service.adminService.NoticeRegistService;
import service.adminService.NoticeRegistServiceImpl;

@WebServlet("/admin/noticeRegister.do")
public class NoticeRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NoticeRegistService service = new NoticeRegistServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request, response);
		request.getRequestDispatcher("/Manage_Page/noticeRegist.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

//		PrintWriter out = response.getWriter();


		Notice not = new Notice();

		// 1. isMultipartContent -> 파일처리에 유효한 리퀘스트인지 확인하는 작업. 반환 데이터 타입 : boolean
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		// 1_1. Multipart/form-data가 아닐 경우 처리
		if (!isMultipart) {
			System.out.println("<h1>encType이 MutiPart가 아님");
			return;
		}

		// 1_2. Multipart/form-data일 경우 -> 파일이 전송된 경우 파일 처리 방법
		// 디스크기반의 파일 아이템 팩토리 -> 디스크를 기반으로 파일 처리를 도와주는 API
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// 2. 업로드 아이템이 1MB 보다 작을 경우 처리
		int maxMem = 1 * 1024 * 1024; // 1MB
		factory.setSizeThreshold(maxMem);// 메모리사이즈 결정

		// 3. 1MB 이상이라면 임시파일 (디스크)를 만들어 처리 -> 임시파일로 tmpFile로 저장. 디스크기반 처리 임시폴더
		File repository = new File(getServletContext().getRealPath("tmpFile"));
		factory.setRepository(repository);

		// 4. 업로드 허용 가능한 용량이면 업로드 수정
		ServletFileUpload upload = new ServletFileUpload(factory);
		int maxRequest = 200 * 1024 * 1024; // 100MB
		upload.setSizeMax(maxRequest);// 최대허용크기 설정

		// 5. 업로드 데이터 파싱 (추출) -> 임시파일 업로드
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		// 6. 폼필드 처리
		Iterator iter = items.iterator(); // iterator : 반복자
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();

			// 빈파일일 경우 처리 안하고 넘어감
			if (item.getSize() <= 0)
				continue;

			if (item.isFormField()) { // formData(키/값 쌍) 일 경우 폼필드와 값을 가져옴
				System.out.println("폼 필드 : " + item.getFieldName() + ", 값 : " + item.getString("UTF-8") + "<br>");

				if ("notTitle".equals(item.getFieldName()))
					not.setNotTitle(item.getString("UTF-8"));
				if ("notContent".equals(item.getFieldName()))
					not.setNotContent(item.getString("UTF-8"));

				// if( "content".equals(item.getFieldName()) )
				// dto.setName(item.getString("UTF-8"));

			} else { // 파일일 경우 처리
				String contentType = item.getContentType();

				if (contentType.contains("image")) {

					SimpleDateFormat format = new SimpleDateFormat("MMddhhmmss.SSS");

					File up = null;
					String filename = "";
					do {
						Date now = new Date();
						String nowString = format.format(now);

						filename = item.getName() + "_" + nowString;
						System.out.println("filename : " + filename);
						up = new File(getServletContext().getRealPath("upload"), filename);

					} while (up.exists());

					if ("notFile".equals(item.getFieldName())) {
						not.setNotFile(filename);
					}

					// 파일 이동 -> 실제 업로드
					try {
						item.write(up); // realPath에 저장 (실제 업로드)
						item.delete(); // 임시파일 삭제 (tmpFile 혹은 Memory)
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			System.out.println("title:"+not.getNotTitle() + "/ Content:" + not.getNotContent());
			if (not.getNotTitle() != null && not.getNotContent() != null) {
				service.insertNotice(not);
			}
		}
		response.sendRedirect("/admin/noticeRegister.do");
	}
}
