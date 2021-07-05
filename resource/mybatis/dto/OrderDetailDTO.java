package mybatis.dto;

import java.io.Serializable;

public class OrderDetailDTO implements Serializable   {
	private String gImage;
	private String gName;
	private String gCommenter;
	private String oMembers;
	private String oName;
	private String oAddress; 
	private String oPhone; 
	private String oPort; 
	private String oPortMessage;
	private String gPrice;
	private String oAmount;
	private String oSumPrice; 
	private String oReg;
	
	public String getgImage() {
		return gImage;
	}
	public void setgImage(String gImage) {
		this.gImage = gImage;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgCommenter() {
		return gCommenter;
	}
	public void setgCommenter(String gCommenter) {
		this.gCommenter = gCommenter;
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
	public String getoPortMessage() {
		return oPortMessage;
	}
	public void setoPortMessage(String oPortMessage) {
		this.oPortMessage = oPortMessage;
	}
	public String getgPrice() {
		return gPrice;
	}
	public void setgPrice(String gPrice) {
		this.gPrice = gPrice;
	}
	public String getoAmount() {
		return oAmount;
	}
	public void setoAmount(String oAmount) {
		this.oAmount = oAmount;
	}
	public String getoSumPrice() {
		return oSumPrice;
	}
	public void setoSumPrice(String oSumPrice) {
		this.oSumPrice = oSumPrice;
	}
	public String getoReg() {
		return oReg;
	}
	public void setoReg(String oReg) {
		this.oReg = oReg;
	}
	
	
	
	
}
