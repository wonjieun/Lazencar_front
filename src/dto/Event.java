package dto;

//특가상품
public class Event {
	private int eveNum;
	private String eveName;
	private String eveStart;
	private String eveEnd;
	private byte[] eveBanner;
	private byte[] eveImg;
	
	
	public int getEveNum() {
		return eveNum;
	}
	public void setEveNum(int eveNum) {
		this.eveNum = eveNum;
	}
	public String getEveName() {
		return eveName;
	}
	public void setEveName(String eveName) {
		this.eveName = eveName;
	}
	public String getEveStart() {
		return eveStart;
	}
	public void setEveStart(String eveStart) {
		this.eveStart = eveStart;
	}
	public String getEveEnd() {
		return eveEnd;
	}
	public void setEveEnd(String eveEnd) {
		this.eveEnd = eveEnd;
	}
	public byte[] getEveBanner() {
		return eveBanner;
	}
	public void setEveBanner(byte[] eveBanner) {
		this.eveBanner = eveBanner;
	}
	public byte[] getEveImg() {
		return eveImg;
	}
	public void setEveImg(byte[] eveImg) {
		this.eveImg = eveImg;
	}
	
	
}
