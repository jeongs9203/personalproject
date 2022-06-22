package shop;


public class ShopBean {
	private String photo;
	
	private String id;
	private String product_id;
	private int qty;
	private int price;
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ShopBean [photo=" + photo + ", id=" + id + ", product_id=" + product_id + ", qty=" + qty + ", price="
				+ price + "]";
	}
	
	
	
}
