package mybatis.dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class testDTO implements Serializable  {
	private String member;
	private String name;
	private int price;
	private String image;
	private String Goods;
	private String commenter;
	private Timestamp reg;
	private int amount;
	
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getGoods() {
		return Goods;
	}
	public void setGoods(String goods) {
		Goods = goods;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
	
}
