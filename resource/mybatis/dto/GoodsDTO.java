package mybatis.dto;

import java.io.Serializable;

public class GoodsDTO implements Serializable {
	private String gCommenter;
	private int gNum;
	private String gName;  
	private int gAmount;
	private int gPrice;
	private String gMemo;
	private String gImage;
	
	public GoodsDTO() {
		super();
	}

	public GoodsDTO(String gCommenter, int gNum, String gName, int gAmount, int gPrice, String gMemo, String gImage) {
		super();
		this.gCommenter = gCommenter;
		this.gNum = gNum;
		this.gName = gName;
		this.gAmount = gAmount;
		this.gPrice = gPrice;
		this.gMemo = gMemo;
		this.gImage = gImage;
	}

	public String getgCommenter() {
		return gCommenter;
	}

	public void setgCommenter(String gCommenter) {
		this.gCommenter = gCommenter;
	}

	public int getgNum() {
		return gNum;
	}

	public void setgNum(int gNum) {
		this.gNum = gNum;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public int getgAmount() {
		return gAmount;
	}

	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}

	public int getgPrice() {
		return gPrice;
	}

	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}

	public String getgMemo() {
		return gMemo;
	}

	public void setgMemo(String gMemo) {
		this.gMemo = gMemo;
	}

	public String getgImage() {
		return gImage;
	}

	public void setgImage(String gImage) {
		this.gImage = gImage;
	}
	
	
}
