package cinema;

public class Member {
	private String memID;
	private String memPW;
	private String memName;
	private String telno;
	private int reCnt;	//리뷰 개수
	private int tkCnt;	//예매 건수
	
	public String getMemID() {
		return memID;
	}
	public void setMemID(String memID) {
		this.memID = memID;
	}
	public String getMemPW() {
		return memPW;
	}
	public void setMemPW(String memPW) {
		this.memPW = memPW;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public int getReCnt() {
		return reCnt;
	}
	public void setReCnt(int reCnt) {
		this.reCnt = reCnt;
	}
	public void setReCnt(String reCnt) {//혹시몰라 해놓음
		this.reCnt = Integer.parseInt(reCnt);
	}
	public int getTkCnt() {
		return tkCnt;
	}
	public void setTkCnt(int tkCnt) {
		this.tkCnt = tkCnt;
	}
	public void setTkCnt(String tkCnt) {//혹시몰라 해놓음
		this.tkCnt = Integer.parseInt(tkCnt);
	}
	
}
