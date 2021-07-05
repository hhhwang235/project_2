package mybatis.dto;

import java.io.Serializable;

public class GradeDTO implements Serializable  {
	private String gradeName; 
	private String gradeMemo;
	private int gradeMinScore; 
	private int gradeMaxScore; 
	private String gradeImage;
	
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getGradeMemo() {
		return gradeMemo;
	}
	public void setGradeMemo(String gradeMemo) {
		this.gradeMemo = gradeMemo;
	}
	public int getGradeMinScore() {
		return gradeMinScore;
	}
	public void setGradeMinScore(int gradeMinScore) {
		this.gradeMinScore = gradeMinScore;
	}
	public int getGradeMaxScore() {
		return gradeMaxScore;
	}
	public void setGradeMaxScore(int gradeMaxScore) {
		this.gradeMaxScore = gradeMaxScore;
	}
	public String getGradeImage() {
		return gradeImage;
	}
	public void setGradeImage(String gradeImage) {
		this.gradeImage = gradeImage;
	}
	
	
	
}
