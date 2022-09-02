package vo;

public class LlikeVO {

	private int lid;
	private String mid;
	private int bid;
	private int lstatus;
	private int nlstatus;
	private int report;
	private boolean flag; // 좋아요 싫어요 기준
	

	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getLstatus() {
		return lstatus;
	}
	public void setLstatus(int lstatus) {
		this.lstatus = lstatus;
	}
	public int getNlstatus() {
		return nlstatus;
	}
	public void setNlstatus(int nlstatus) {
		this.nlstatus = nlstatus;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	@Override
	public String toString() {
		return "LlikeVO [lid=" + lid + ", mid=" + mid + ", bid=" + bid + ", lstatus=" + lstatus + ", nlstatus="
				+ nlstatus + ", report=" + report + ", flag=" + flag + "]";
	}
	
	
}
