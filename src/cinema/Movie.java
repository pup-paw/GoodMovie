package cinema;
import java.util.Date;
public class Movie {
	private String mno;	//��ȭ��ȣ
	private String title;	//��ȭ ����
	private int rgrCost;	//����
	private int earlyCost;	//���� ���ΰ�
	private int weekendCost;	//�ָ�����
	private String genre;	//�帣
	private int runtime;	//����Ÿ��
	private double avgScore;	//�������
	private Date strDate;		//�� ������ (date�ڷ��� ��� �ҷ����°��� �����غ��ߵ�)
	private Date endDate;		//�� ������
	private int rcnt;		//���䰳��
	private String summary;		//�ٰŸ�
	private String director;	//����
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
