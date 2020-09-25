package vo; //반환형 결과가 있는 메서드

public class Category {
	private int CategoryId;
	private String CategoryName;
	private String CategoryPic;
	private String CategoryCk;
	
	public int getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	public String getCategoryPic() {
		return CategoryPic;
	}
	public void setCategoryPic(String categoryPic) {
		CategoryPic = categoryPic;
	}
	public String getCategoryCk() {
		return CategoryCk;
	}
	public void setCategoryCk(String categoryCk) {
		CategoryCk = categoryCk;
	}
}
