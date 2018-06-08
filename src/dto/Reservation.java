package dto;

//예약테이블
public class Reservation {
   private int resNum;			//RES_NUM
   private String memId;		//MEM_ID
   private String carNum;		//CAR_NUM
   private String resStart;		//RES_START
   private String resEnd;		//RES_END
   private int couNum;			//COU_NUM
   private String optionList;	//RES_OPTION
   private String carDemage;	//RES_DAMAGE
   private int dcPrice;			//RES_DISPRICE
   private int normalPrice;		//RES_TALPRICE
   private String carName;		//CAR_NAME
   
   public String getCarName() {
	    return carName;
   }
   public void setCarName(String carName) {
      this.carName = carName;
   }
    public int getNormalPrice() {
      return normalPrice;
   }
   public void setNormalPrice(int normalPrice) {
      this.normalPrice = normalPrice;
   }
   public int getDcPrice() {
      return dcPrice;
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
}
