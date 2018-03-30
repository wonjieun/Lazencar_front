package dto;

public class Coupon {
	private String couName;
	private String couConst; // 제약사항.. 읽어올때 20/5/All 
	//이런식으로 받아와서 split(/)해서 리스트로 넣어서 따로처리
	private String couStart;
	private String couEnd;
	private byte[] couImage;
	private int couNum;
	private int couDiscount;
	
	
	public int getCouNum() {
		return couNum;
	}
	public void setCouNum(int couNum) {
		this.couNum = couNum;
	}
	public int getCouDiscount() {
		return couDiscount;
	}
	public void setCouDiscount(int couDiscount) {
		this.couDiscount = couDiscount;
	}
	public String getCouName() {
		return couName;
	}
	public void setCouName(String couName) {
		this.couName = couName;
	}
	public String getCouConst() {
		return couConst;
	}
	public void setCouConst(String couConst) {
		this.couConst = couConst;
	}
	public String getCouStart() {
		return couStart;
	}
	public void setCouStart(String couStart) {
		this.couStart = couStart;
	}
	public String getCouEnd() {
		return couEnd;
	}
	public void setCouEnd(String couEnd) {
		this.couEnd = couEnd;
	}
	public byte[] getCouImage() {
		return couImage;
	}
	public void setCouImage(byte[] couImage) {
		this.couImage = couImage;
	}
}
