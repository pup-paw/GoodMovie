package cinema;

public class Member {
	private String memID;
	private String memPW;
	private String memName;
	private String telno;
	private int reCnt;	//���� ����
	private int tkCnt;	//���� �Ǽ�
	
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
	public void setReCnt(String reCnt) {//Ȥ�ø��� �س���
		this.reCnt = Integer.parseInt(reCnt);
	}
	public int getTkCnt() {
		return tkCnt;
	}
	public void setTkCnt(int tkCnt) {
		this.tkCnt = tkCnt;
	}
	public void setTkCnt(String tkCnt) {//Ȥ�ø��� �س���
		this.tkCnt = Integer.parseInt(tkCnt);
	}
	
}
