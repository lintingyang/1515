package tw.com.softleader.e5e5.entity;

public class Movie {

	private Long id;
	private String name;
	private String category;
	
	
	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", category=" + category + "]";
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
