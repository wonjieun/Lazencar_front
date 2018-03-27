
package service;

import dao.MemberFindDao;
import dao.MemberFindDaoImpl;
import dto.Member;

public class MemberFindServiceImpl implements MemberFindService {

	private MemberFindDao dao = new MemberFindDaoImpl();
	public String memPw = null;
	public String msg = null;

	@Override
	public String getMemId(Member mem) {
		System.out.println(dao.checkName(mem));
		System.out.println(dao.checkEmail(mem));
		if (dao.checkName(mem) == true && dao.checkEmail(mem) == true) {
			// checkName&checkEmail이 true일때 아이디값 가져오기
			dao.getId(mem);
			System.out.println(dao.getId(mem));
			return dao.getId(mem);
		} else {
			return null;
		}
	}

	// 아이디찾기 메시지
	public String getMsg(Member mem) {
		if (dao.checkName(mem) && dao.checkEmail(mem)) {
			// checkName&checkEmail이 true일때 아이디값 가져오기
			return msg = "아이디 찾기 성공";
		} else {
			return msg = "이메일이나 이름이 등록된 정보와 일치하지 않습니다.";
		}
	}

	// 비밀번호찾기 메시지
	public String getMsg2(Member mem) {
		if (dao.checkId(mem) && dao.checkEmail(mem) && dao.checkPhone(mem)) {
			// checkId&checkEmail&checkPhone이 true일때 메시지값 "" 반환하기
			return msg = "비밀번호 찾기 성공";
		}
		else {
			return msg = "이름이나 이메일, 핸드폰번호가 등록된 정보와 일치하지 않습니다.";
		}
	}

	@Override
	public String getMemPw(Member mem) {
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
