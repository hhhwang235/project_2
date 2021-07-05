package mybatis.dto;

import java.io.Serializable;

public class PortDTO implements Serializable  {
	private String pName;
	private String pMemo;
	private int pPrice;
	
	public String getpName() {
		return pName;
	}
	public void setpName(String pNmae) {
		this.pName = pNmae;
	}
	public String getpMemo() {
		return pMemo;
	}
	public void setpMemo(String pMemo) {
		this.pMemo = pMemo;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	
	
	
}
