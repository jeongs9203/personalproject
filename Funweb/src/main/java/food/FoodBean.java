package food;
/*
 *  CREATE TABLE food (
 *  photo VARCHAR(50),
 *	kind VARCHAR(16),
 *	price INT,
 *	name VARCHAR(30)
 *	);
 * 
 * 
 */
public class FoodBean {
	private String photo;
	private String kind;
	private int price;
	private String name;
	
	

	@Override
	public String toString() {
		return "FoodBean [photo=" + photo + ", kind=" + kind + ", price=" + price + ", name=" + name + "]";
	}
	

	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
