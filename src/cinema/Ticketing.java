package cinema;

public class Ticketing {
	private String tknum;	//���Ź�ȣ		
	private String memID;	//ȸ��id
	private Boolean discount;	//���ο���
	private String payMethod;	//���� ���
	private int pNum;	//�ο���
	private int total;	//�ѱݾ�
	private String rsvDate;	//���ų�¥ Date??
	private String enno;		//��Ϲ�ȣ
	private String reno;	//�����ȣ
	private String reContent;	//���� ����
	private String revDate;	//���� �ۼ���¥ Date??
	private double score;	//����
	public String getTknum() {
		return tknum;
	}
	public void setTknum(String tknum) {
		this.tknum = tknum;
	}
	public String getMemID() {
		return memID;
	}
	public void setMemID(String memID) {
		this.memID = memID;
	}
	public Boolean getDiscount() {
		return discount;
	}
	public void setDiscount(Boolean discount) {
		this.discount = discount;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(String rsvDate) {
		this.rsvDate = rsvDate;
	}
	public String getEnno() {
		return enno;
	}
	public void setEnno(String enno) {
		this.enno = enno;
	}
	public String getReno() {
		return reno;
	}
	public void setReno(String reno) {
		this.reno = reno;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getRevDate() {
		return revDate;
	}
	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
}
