package cinema;
import java.util.Date;
public class Movie {
	private String mno;	//영화번호
	private String title;	//영화 제목
	private int rgrCost;	//정상가
	private int earlyCost;	//조조 할인가
	private int weekendCost;	//주말가격
	private String genre;	//장르
	private int runtime;	//러닝타임
	private double avgScore;	//평균평점
	private Date strDate;		//상영 시작일 (date자료형 어떻게 불러오는건지 생각해봐야됨)
	private Date endDate;		//상영 종료일
	private int rcnt;		//리뷰개수
	private String summary;		//줄거리
	private String director;	//감독
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRgrCost() {
		return rgrCost;
	}
	public void setRgrCost(int rgrCost) {
		this.rgrCost = rgrCost;
	}
	public void setRgrCost(String rgrCost) {
		this.rgrCost = Integer.parseInt(rgrCost);
	}
	public int getEarlyCost() {
		return earlyCost;
	}
	public void setEarlyCost(int earlyCost) {
		this.earlyCost = earlyCost;
	}
	public void setEarlyCost(String earlyCost) {
		this.earlyCost = Integer.parseInt(earlyCost);
	}
	public int getWeekendCost() {
		return weekendCost;
	}
	public void setWeekendCost(int weekendCost) {
		this.weekendCost = weekendCost;
	}
	public void setWeekendCost(String weekendCost) {
		this.weekendCost = Integer.parseInt(weekendCost);
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public double getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}
	public Date getStrDate() {
		return strDate;
	}
	public void setStrDate(Date strDate) {
		this.strDate = strDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public void setRcnt(String rcnt) {
		this.rcnt = Integer.parseInt(rcnt);
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	
}
