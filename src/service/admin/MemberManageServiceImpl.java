
package service.admin;

import controller.admin.MemberManageServlet;
import dao.admin.MemberManageDao;
import dao.admin.MemberManageDaoImpl;
import dto.admin.MemberManage;

public class MemberManageServiceImpl implements MemberManageService {

	private MemberManageDao dao = new MemberManageDaoImpl();
	private MemberManageServlet service = new MemberManageServlet();

	private String memId;
	private String memJumin;
	private String memLicence;
		
	@Override
	public void checkCate (MemberManage mem) {
		//어떤 카테고리를 선택했는지 조건검사 후 DAO로 넘겨줌
		
		if (//관리자가 			) {
			// checkName&checkEmail이 true일때 아이디값 가져오기
			System.out.println(dao.getId(mem));
			return dao.getIdList(mem);
		} else 
			
		{
			return null;
		}
	}

	// 아이디찾기 메시지
	public String getMsg(MemberManage mem) {
		if (dao.checkName(mem) && dao.checkEmail(mem)) {
			// checkName&checkEmail이 true일때 아이디값 가져오기
			return msg = "아이디 찾기 성공";
		} else {
			return msg = "이메일이나 이름이 등록된 정보와 일치하지 않습니다.";
		}
	}

	// 비밀번호찾기 메시지
	public String getMsg2(MemberManage mem) {
		if (dao.checkId(mem) && dao.checkEmail(mem) && dao.checkPhone(mem)) {
			// checkId&checkEmail&checkPhone이 true일때 메시지값 "" 반환하기
			return msg = "비밀번호 찾기 성공";
		}
		else {
			return msg = "이름이나 이메일, 핸드폰번호가 등록된 정보와 일치하지 않습니다.";
		}
	}

	@Override
	public String getMemPw(MemberManage mem) {
		System.out.println("아이디체크" + dao.checkId(mem));
		System.out.println("이메일체크" + dao.checkEmail(mem));
		System.out.println("폰번체크" + dao.checkPhone(mem));

		if (dao.checkId(mem) == true && dao.checkEmail(mem) == true && dao.checkPhone(mem) == true) {
			// checkName&checkEmail이 true일때 아이디값 가져오기
			dao.getPw(mem);
			System.out.println(dao.getPw(mem));
			return dao.getPw(mem);
		} else {
			return null;
		}
	}

}
