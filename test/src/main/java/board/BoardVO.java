package board;

public class BoardVO {
	private int bid;
	private String mid;
	private String msg;
	private int favcnt;
	private int rcnt;
	private String mname;
	private String searchCondition; // 검색용 JAVA 변수
	private String searchContent; // 검색용 JAVA 변수
	private int cnt; // 메인 페이지에 보여줄 글의 개수 [JAVA] ★★★
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getFavcnt() {
		return favcnt;
	}
	public void setFavcnt(int favcnt) {
		this.favcnt = favcnt;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	@Override
	public String toString() {
		return "BoardVO [bid=" + bid + ", mid=" + mid + ", msg=" + msg + ", favcnt=" + favcnt + ", rcnt=" + rcnt
				+ ", searchCondition=" + searchCondition + ", searchContent=" + searchContent + ", cnt=" + cnt + "]";
	}

}
