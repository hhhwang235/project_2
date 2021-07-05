package mybatis.dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class OrdersDTO implements Serializable   {
	private int oMainNum;
	private String oMembers;
	private String oName;
	private String oAddress;
	private String oPhone;
	private String oPort;
	private String oProtMessage;
	private int oNum;
	private int oAmount;
	private int oSumPrice;
	private Timestamp oReg;
	
	public int getoMainNum() {
		return oMainNum;
	}
	public void setoMainNum(int oMainNum) {
		this.oMainNum = oMainNum;
	}
	public String getoMembers() {
		return oMembers;
	}
	public void setoMembers(String oMembers) {
		this.oMembers = oMembers;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getoAddress() {
		return oAddress;
	}
	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}
	public String getoPhone() {
		return oPhone;
	}
	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}
	public String getoPort() {
		return oPort;
	}
	public void setoPort(String oPort) {
		this.oPort = oPort;
	}
	public String getoProtMessage() {
		return oProtMessage;
	}
	public void setoProtMessage(String oProtMessage) {
		this.oProtMessage = oProtMessage;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public int getoAmount() {
		return oAmount;
	}
	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
	}
	public int getoSumPrice() {
		return oSumPrice;
	}
	public void setoSumPrice(int oSumPrice) {
		this.oSumPrice = oSumPrice;
	}
	public Timestamp getoReg() {
		return oReg;
	}
	public void setoReg(Timestamp oReg) {
		this.oReg = oReg;
	}
	
	
	
	
	
}
