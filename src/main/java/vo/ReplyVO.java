package vo;

public class ReplyVO {

	private int rid;
	private String rcontent;
	private String rdate;
	private String mid;
	private int bid;
	
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
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
	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", rcontent=" + rcontent + ", rdate=" + rdate + ", mid=" + mid + ", bid=" + bid
				+ "]";
	}

	
	
}
