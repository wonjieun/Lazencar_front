package dto;

//예약테이블
public class Reservation {

	private int resNum;
	private String memId;
<<<<<<< HEAD
	private String carNum;//차량 번호
	private String resStart;//차량 시작일
	private String resEnd;//차량 반납일
	private int couNum;//쿠폰
	private String optionList;//옵션 선택
	private String carDemage;//차량 보험 선택
	private int dcPrice;//할인 가격 내용
	private int normalPrice;//할인 전 총합계 내용
	private String carName;      //CAR_NAME
	
=======
	private String carNum;
	private String carDemage;
	private String carOption;
	private String resStart;
	private String resEnd;
	private int couNum;
	private String carName;
	private String optionList;

>>>>>>> 8b32c8568a86884a869e0f2d685e0a1ad5437dcd
	public String getCarName() {
		   return carName;
	}
<<<<<<< HEAD
	public int getNormalPrice() {
		return normalPrice;
	}
	public void setNormalPrice(int normalPrice) {
		this.normalPrice = normalPrice;
	}
	public int getDcPrice() {
		return dcPrice;
=======
	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarOption() {
		return carOption;
>>>>>>> 8b32c8568a86884a869e0f2d685e0a1ad5437dcd
	}
	public void setDcPrice(int dcPrice) {
		this.dcPrice = dcPrice;
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
	public void setCarName(String carName) {
		this.carName = carName;
	}
	
}
