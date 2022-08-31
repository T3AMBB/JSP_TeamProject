package fav;

public class FavVO {
	private int fid;
	private String mid;
	private int bid;
	private int fav;
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
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
	public int getFav() {
		return fav;
	}
	public void setFav(int fav) {
		this.fav = fav;
	}
	@Override
	public String toString() {
		return "FavVO [fid=" + fid + ", mid=" + mid + ", bid=" + bid + ", fav=" + fav + "]";
	}
	
}
