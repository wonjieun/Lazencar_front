package dto;

public class Promotion {
	private int no;					//EVE_NUM
	private String name;			//EVE_NAME
	private String proStartDate;		//EVE_START_DATE
	private String proEndDate;			//EVE_END_DATE
	private String bannerImg;		//EVE_BANNER_IMG
	private String detailImg;		//EVE_DETAIL_IMG
	
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
	public String getProStartDate() {
		return proStartDate;
	}
	public void setProStartDate(String prostartDate) {
		proStartDate = prostartDate;
	}
	public String getProEndDate() {
		return proEndDate;
	}
	public void setProEndDate(String proendDate) {
		proEndDate = proendDate;
	}
	public String getBannerImg() {
		return bannerImg;
	}
	public void setBannerImg(String bannerimg) {
		bannerImg = bannerimg;
	}
	public String getDetailImg() {
		return detailImg;
	}
	public void setDetailImg(String detailimg) {
		detailImg = detailimg;
	}
	
	
	}
