package dto;

//후기
public class Review {
	private int revNum;
	private int revViews; //조회수
	private String memId;
	private String revName;
	private String revContent;
	private String revEmail;
//	private String revFile 
	//revFile 을 File형태로 받는지 Image 형태로 받는지 상의가 필요함 ...
	
	
	public int getRevNum() {
		return revNum;
	}
	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}
	public int getRevViews() {
		return revViews;
	}
	public void setRevViews(int revViews) {
		this.revViews = revViews;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getRevName() {
		return revName;
	}
	public void setRevName(String revName) {
		this.revName = revName;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public String getRevEmail() {
		return revEmail;
	}
	public void setRevEmail(String revEmail) {
		this.revEmail = revEmail;
	}
	
	
}
