package mybatis.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Comment implements Serializable {
	private Long studentNo;
	private String studentName;
	private String studentTel;
	private String studentEmail;
	private String studentAddr;
	private String studentRegDate;
	
	public long getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(long studentNo) {
		this.studentNo = studentNo;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentTel() {
		return studentTel;
	}
	public void setStudentTel(String studentTel) {
		this.studentTel = studentTel;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public String getStudentAddr() {
		return studentAddr;
	}
	public void setStudentAddr(String studentAddr) {
		this.studentAddr = studentAddr;
	}
	public String getStudentRegDate() {
		return studentRegDate;
	}
	public void setStudentRegDate(String studentRegDate) {
		this.studentRegDate = studentRegDate;
	}
	
	
}
