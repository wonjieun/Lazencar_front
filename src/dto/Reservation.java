package dto;

//예약테이블
public class Reservation {

	private int resNum;
	private String memId;
	private String carNum;
	private String carDemage;
	private String carOption;
	private String resStart;
	private String resEnd;
	private int couNum;
	private String carName;
	private String optionList;
	private String carDemage;
	
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarDemage() {
		return carDemage;
	}
	public void setCarDemage(String carDemage) {
		this.carDemage = carDemage;
	}
	public String getCarOption() {
		return carOption;
	}
	public void setCarOption(String carOption) {
		this.carOption = carOption;
	}
	public int getResNum() {
		return resNum;
	}
	public void setResNum(int resNum) {
		this.resNum = resNum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getResStart() {
		return resStart;
	}
	public void setResStart(String resStart) {
		this.resStart = resStart;
	}
	public String getResEnd() {
		return resEnd;
	}
	public void setResEnd(String resEnd) {
		this.resEnd = resEnd;
	}
	public int getCouNum() {
		return couNum;
	}
	public void setCouNum(int couNum) {
		this.couNum = couNum;
	}
	public String getOptionList() {
		return optionList;
	}
	public void setOptionList(String optionList) {
		this.optionList = optionList;
	}
	public String getCarDemage() {
		return carDemage;
	}
	public void setCarDemage(String carDemage) {
		this.carDemage = carDemage;
	}
	
}
