package dto.admin;

public class MemberManage {
	// DB의 속성과 일치해야 한다
	private String memId;
	private String memPw;
	private String memName;
	private String memPhone;
	private String memJumin;
	private String memEmail;
	private String memAddr;
	private boolean memLicense;
	
	public String getMemAddr() {
		return memAddr;
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
	
}
