package dto;

public class Notice {
	private int notNum;
	private String notName;
	private String notContent;
	private String notDate;
	private String notEmail;
	// private Byte[] notFile;
	private String notFile;

	public int getNotNum() {
		return notNum;
	}

	public void setNotNum(int notNum) {
		this.notNum = notNum;
	}

	public String getNotName() {
		return notName;
	}

	public void setNotName(String notname) {
		this.notName = notname;
	}

	public String getNotContent() {
		return notContent;
	}

	public void setNotContent(String notContent) {
		this.notContent = notContent;
	}

	public String getNotDate() {
		return notDate;
	}

	public void setNotDate(String notDate) {
		this.notDate = notDate;
	}

	public String getNotEmail() {
		return notEmail;
	}

	public void setNotEmail(String notEmail) {
		this.notEmail = notEmail;
	}

	public String getNotFile() {
		return notFile;
	}

	public void setNotFile(String notFile) {
		this.notFile = notFile;
	}
}
