package mvc.model;

public class Card {
	private String title;
	private String description;
	private String Status;
	private Integer id;
	private Integer userId;
	private String duedate;
	
	public Card(String title, String description, String status, Integer userId, String duedate) {
		this.setTitle(title);
		this.setDescription(description);
		this.setStatus(status);
		this.setUserId(userId);
		this.setDuedate(duedate);
		
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDuedate() {
		return duedate;
	}

	public void setDuedate(String duedate) {
		this.duedate = duedate;
	}
	

}
