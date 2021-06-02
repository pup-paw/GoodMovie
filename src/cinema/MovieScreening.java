package cinema;

public class MovieScreening {
	private String enno;	//등록번호
	private String mno;		//영화 번호
	private int scrno;		//상영 회차
	private String scrDate;	//상영 날짜. Date자료형??
	private String scrTime;		//상여 시간. Time 자료형 ??
	private int fee;		//관람료
	private int pCnt;	//총예매인원수
	private String tname;	//극장 이름
	private String sno;		//상영관번호;
	private String adID;	//관리자id
	public String getEnno() {
		return enno;
	}
	public void setEnno(String enno) {
		this.enno = enno;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public int getScrno() {
		return scrno;
	}
	public void setScrno(int scrno) {
		this.scrno = scrno;
	}
	public String getScrDate() {
		return scrDate;
	}
	public void setScrDate(String scrDate) {
		this.scrDate = scrDate;
	}
	public String getScrTime() {
		return scrTime;
	}
	public void setScrTime(String scrTime) {
		this.scrTime = scrTime;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getpCnt() {
		return pCnt;
	}
	public void setpCnt(int pCnt) {
		this.pCnt = pCnt;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getAdID() {
		return adID;
	}
	public void setAdID(String adID) {
		this.adID = adID;
	}
	
}
