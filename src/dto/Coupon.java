package dto;

public class Coupon {
	private int no;					//COU_NUM
	private String name;			//COU_NAME
	private String discount;		//COU_DISCOUNT
	private String startDate;		//COU_START_DATE
	private String endDate;			//COU_END_DATE
	private String ageConst;		//COU_AGE_CONST
	private String timeConst;		//COU_TIME_CONST
	private String carConst;		//COU_CAR_CONST
	private String couponImg;		//COU_IMG
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getAgeConst() {
		return ageConst;
	}
	public void setAgeConst(String ageConst) {
		this.ageConst = ageConst;
	}
	public String getTimeConst() {
		return timeConst;
	}
	public void setTimeConst(String timeConst) {
		this.timeConst = timeConst;
	}
	public String getCarConst() {
		return carConst;
	}
	public void setCarConst(String carConst) {
		this.carConst = carConst;
	}
	public String getCouponImg() {
		return couponImg;
	}
	public void setCouponImg(String couponImg) {
		this.couponImg = couponImg;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	

}
