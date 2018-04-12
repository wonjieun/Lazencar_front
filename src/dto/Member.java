package dto;

public class Member {
	// DB의 속성과 일치해야 한다
	private String memId;
	private String memPw;
	private Number memGubn;
	private String memName;
	private String memPhone;
	private String memPhone1;
	private String memPhone2;
	private String memPhone3;
	private String memJumin;
	private String memJumin1;
	private String memJumin2;
	private String memEmail;
	private String memEmail1;
	private String memEmail2;
	private String memZip;
	private String memAddr;
	private String memAddr1;
	private String memAddr2;
	private String licenType;
	private String licenNum;
	private String licenIssueDate;
	private String licenIssueDateY;
	private String licenIssueDateM;
	private String licenIssueDateD;
	private String licenLimitDate;
	private String licenLimitDateY;
	private String licenLimitDateM;
	private String licenLimitDateD;
	private String licenZip;
	private String licenAddr;
	private String licenAddr1;
	private String licenAddr2;


	public String getLicenZip() {
		return licenZip;
	}

	public void setLicenZip(String licenZip) {
		this.licenZip = licenZip;
	}


	public String getLicenType() {
		return licenType;
	}

	public void setLicenType(String licenType) {
		this.licenType = licenType;
	}

	public String getLicenNum() {
		return licenNum;
	}

	public void setLicenNum(String licenNum) {
		this.licenNum = licenNum;
	}

	public String getLicenIssueDate() {
		return licenIssueDate;
	}

	public void setLicenIssueDate(String licenIssueDate) {
		this.licenIssueDate = licenIssueDate;
	}

	public String getLicenIssueDateY() {
		return licenIssueDateY;
	}

	public void setLicenIssueDateY(String licenIssueDateY) {
		this.licenIssueDateY = licenIssueDateY;
	}

	public String getLicenIssueDateM() {
		return licenIssueDateM;
	}

	public void setLicenIssueDateM(String licenIssueDateM) {
		this.licenIssueDateM = licenIssueDateM;
	}

	public String getLicenIssueDateD() {
		return licenIssueDateD;
	}

	public void setLicenIssueDateD(String licenIssueDateD) {
		this.licenIssueDateD = licenIssueDateD;
	}

	public String getLicenLimitDate() {
		return licenLimitDate;
	}

	public void setLicenLimitDate(String licenLimitDate) {
		this.licenLimitDate = licenLimitDate;
	}

	public String getLicenLimitDateY() {
		return licenLimitDateY;
	}

	public void setLicenLimitDateY(String licenLimitDateY) {
		this.licenLimitDateY = licenLimitDateY;
	}

	public String getLicenLimitDateM() {
		return licenLimitDateM;
	}

	public void setLicenLimitDateM(String licenLimitDateM) {
		this.licenLimitDateM = licenLimitDateM;
	}

	public String getLicenLimitDateD() {
		return licenLimitDateD;
	}

	public void setLicenLimitDateD(String licenLimitDateD) {
		this.licenLimitDateD = licenLimitDateD;
	}

	public String getLicenAddr() {
		return licenAddr;
	}

	public void setLicenAddr(String licenAddr) {
		this.licenAddr = licenAddr;
	}

	public String getLicenAddr1() {
		return licenAddr1;
	}

	public void setLicenAddr1(String licenAddr1) {
		this.licenAddr1 = licenAddr1;
	}

	public String getLicenAddr2() {
		return licenAddr2;
	}

	public void setLicenAddr2(String licenAddr2) {
		this.licenAddr2 = licenAddr2;
	}

	public String getMemZip() {
		return memZip;
	}

	public void setMemZip(String memZip) {
		this.memZip = memZip;
	}

	public String getMemAddr1() {
		return memAddr1;
	}

	public void setMemAddr1(String memAddr1) {
		this.memAddr1 = memAddr1;
	}

	public String getMemAddr2() {
		return memAddr2;
	}

	public void setMemAddr2(String memAddr2) {
		this.memAddr2 = memAddr2;
	}

	private boolean memLicense;
	
	//아이디 중복 검사를 위해 추가한 멤버필드
	private String btnName;
	private String msg;
	private boolean memCheck;
  
	public String getBtnName() {
		return btnName;
	}
	public void setBtnName(String btnName) {
		this.btnName = btnName;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	//아이디 중복검사 끝
	
	public String getMemAddr() {
		return memAddr;
	}

	public String getMemPhone1() {
		return memPhone1;
	}

	public void setMemPhone1(String memPhone1) {
		this.memPhone1 = memPhone1;
	}
	
	public String getMemPhone2() {
		return memPhone2;
	}

	public void setMemPhone2(String memPhone2) {
		this.memPhone2 = memPhone2;
	}

	public String getMemPhone3() {
		return memPhone3;
	}

	public void setMemPhone3(String memPhone3) {
		this.memPhone3 = memPhone3;
	}


	public String getMemJumin1() {
		return memJumin1;
	}

	public void setMemJumin1(String memJumin1) {
		this.memJumin1 = memJumin1;
	}

	public String getMemJumin2() {
		return memJumin2;
	}

	public void setMemJumin2(String memJumin2) {
		this.memJumin2 = memJumin2;
	}

	public String getMemEmail1() {
		return memEmail1;
	}

	public void setMemEmail1(String memEmail1) {
		this.memEmail1 = memEmail1;
	}

	public String getMemEmail2() {
		return memEmail2;
	}

	public void setMemEmail2(String memEmail2) {
		this.memEmail2 = memEmail2;
	}

	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemJumin() {
		return memJumin;
	}

	public void setMemJumin(String memJumin) {
		this.memJumin = memJumin;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public boolean isMemLicense() {
		return memLicense;
	}

	public void setMemLicense(boolean memLicense) {
		this.memLicense = memLicense;
	}

	public Number getMemGubn() {
		return memGubn;
	}

	public void setMemGubn(Number memGubn) {
		this.memGubn = memGubn;
	}
  
	public boolean getMemCheck() {
		return memCheck;
	}
	public void setMemCheck(boolean memCheck) {
		this.memCheck = memCheck;
	}
  
}
