package mybatis.dto;

import java.util.List;

public class tblCommentDTO {
	private int c_num;
	private String c_commenter;
	private String c_content;
	private String c_date;
	
	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public tblCommentDTO() {
		super();
	}	
		
	public String getC_commenter() {
		return c_commenter;
	}
	public void setC_commenter(String c_commenter) {
		this.c_commenter = c_commenter;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	
	
}
