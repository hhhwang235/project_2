package mybatis.dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class CartDTO implements Serializable {
	private int num;
	private Timestamp cReg;
	private int cNum;
	private String cMembers;
	private int amount;
	
	public Timestamp getcReg() {
		return cReg;
	}
	public void setcReg(Timestamp cReg) {
		this.cReg = cReg;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcMembers() {
		return cMembers;
	}
	public void setcMembers(String cMembers) {
		this.cMembers = cMembers;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
}