package mybatis.dto;

import java.io.Serializable;

public class VisitantDTO implements Serializable {
	private int visit;
	private int num;

	public int getVisit() {
		return visit;
	}

	public void setVisit(int visit) {
		this.visit = visit;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
	
}