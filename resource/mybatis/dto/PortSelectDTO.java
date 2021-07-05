package mybatis.dto;

import java.io.Serializable;

public class PortSelectDTO implements Serializable     {
	private String pCompanyName;
	private String portPrice;
	private String excludedAreaPrice;
	private String portwayName;
	
	public String getpCompanyName() {
		return pCompanyName;
	}
	public void setpCompanyName(String pCompanyName) {
		this.pCompanyName = pCompanyName;
	}
	public String getPortPrice() {
		return portPrice;
	}
	public void setPortPrice(String portPrice) {
		this.portPrice = portPrice;
	}
	public String getExcludedAreaPrice() {
		return excludedAreaPrice;
	}
	public void setExcludedAreaPrice(String excludedAreaPrice) {
		this.excludedAreaPrice = excludedAreaPrice;
	}
	public String getPortwayName() {
		return portwayName;
	}
	public void setPortwayName(String portwayName) {
		this.portwayName = portwayName;
	}
	
	
}
