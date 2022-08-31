package vo;

public class Reply_reVO {
	
	private int rrid;
	private String rrcontent;
	private String rrdate;
	private String mid;
	private int bid;
	private int rid;
	
	
	public int getRrid() {
		return rrid;
	}
	public void setRrid(int rrid) {
		this.rrid = rrid;
	}
	public String getRrcontent() {
		return rrcontent;
	}
	public void setRrcontent(String rrcontent) {
		this.rrcontent = rrcontent;
	}
	public String getRrdate() {
		return rrdate;
	}
	public void setRrdate(String rrdate) {
		this.rrdate = rrdate;
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
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	@Override
	public String toString() {
		return "Reply_reVO [rrid=" + rrid + ", rrcontent=" + rrcontent + ", rrdate=" + rrdate + ", mid=" + mid
				+ ", bid=" + bid + ", rid=" + rid + "]";
	}

	
}
