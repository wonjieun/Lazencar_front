package dto.adminDto;

public class PromotionManage {
	private int no; // EVE_NUM
	private String name; // EVE_NAME
	private String StartDate; // EVE_START_DATE
	private String EndDate; // EVE_END_DATE
	private String BannerImg; // EVE_BANNER_IMG
	private String DetailImg; // EVE_DETAIL_IMG

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

	public String getStartDate() {
		return StartDate;
	}

	public void setStartDate(String startDate) {
		StartDate = startDate;
	}

	public String getEndDate() {
		return EndDate;
	}

	public void setEndDate(String endDate) {
		EndDate = endDate;
	}

	public String getBannerImg() {
		return BannerImg;
	}

	public void setBannerImg(String bannerImg) {
		BannerImg = bannerImg;
	}

	public String getDetailImg() {
		return DetailImg;
	}

	public void setDetailImg(String detailImg) {
		DetailImg = detailImg;
	}

}
