package dto.adminDto;

public class ReviewManage {
	private String category;
	private String sort;
	private String content;
	private String clicked;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getClicked() {
		return clicked;
	}
	public void setClicked(String clicked) {
		this.clicked = clicked;
	}
	
	
	private String key_revNum;
	private String editReview;
	
	public String getEditReview() {
		return editReview;
	}
	public void setEditReview(String editReview) {
		this.editReview = editReview;
	}
	public String getKey_revNum() {
		return key_revNum;
	}
	public void setKey_revNum(String key_revNum) {
		this.key_revNum = key_revNum;
	}
}
