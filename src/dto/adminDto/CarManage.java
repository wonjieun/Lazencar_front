package dto.adminDto;

public class CarManage {
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
	

	
	//Car 클래스와 명칭이 겹쳐서 수정및 삭제용으로 key를 붙여서 만들었음..
	private String key_carNum;
	private String key_carCondi;
	private String key_carLCD;
	private String editCar;
	
	public String getKey_carNum() {
		return key_carNum;
	}
	public void setKey_carNum(String key_carNum) {
		this.key_carNum = key_carNum;
	}
	public String getKey_carCondi() {
		return key_carCondi;
	}
	public void setKey_carCondi(String key_carCondi) {
		this.key_carCondi = key_carCondi;
	}
	public String getKey_carLCD() {
		return key_carLCD;
	}
	public void setKey_carLCD(String key_carLCD) {
		this.key_carLCD = key_carLCD;
	}
	public String getEditCar() {
		return editCar;
	}
	public void setEditCar(String editCar) {
		this.editCar = editCar;
	}
}
