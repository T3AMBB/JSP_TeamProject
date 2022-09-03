package vo;

public class OpinionVO {
	
	private int oid;
	private int nid;
	private String ocontent;
	private String mid;
	private String odate;
	private int ostar;
	private String title; // novel과 조인 후 어느 리뷰에 작성했는지 확인하기 위한 임시변수
	private int cnt; // 페이징처리를 위한 cnt
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getOcontent() {
		return ocontent;
	}
	public void setOcontent(String ocontent) {
		this.ocontent = ocontent;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getOstar() {
		return ostar;
	}
	public void setOstar(int ostar) {
		this.ostar = ostar;
	}
	@Override
	public String toString() {
		return "OpinionVO [oid=" + oid + ", ocontent=" + ocontent + ", odate=" + odate + ", mid=" + mid + ", nid=" + nid
				+ ", ostar=" + ostar + ", title=" + title + ", cnt=" + cnt + "]";
	}
	
	
}
