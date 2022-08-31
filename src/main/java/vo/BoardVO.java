package vo;

public class BoardVO {

   private int bid;
   private String btitle;
   private String bcontent;
   private String bdate;
   private String mid;
   private String searchCondition;
   private String searchContent;
   private int lid;
   private int bcnt; // 페이징 처리를 위한 변수
   private int cnt_r; // report
   private int cnt_l; // lstatus
   private int cnt_n;
   
   
   
   
   public int getLid() {
	return lid;
}
public void setLid(int lid) {
	this.lid = lid;
}
public int getCnt_n() {
	return cnt_n;
}
public void setCnt_n(int cnt_n) {
	this.cnt_n = cnt_n;
}
public int getCnt_r() {
      return cnt_r;
   }
   public void setCnt_r(int cnt_r) {
      this.cnt_r = cnt_r;
   }
   public int getCnt_l() {
      return cnt_l;
   }
   public void setCnt_l(int cnt_l) {
      this.cnt_l = cnt_l;
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
   public int getBcnt() {
      return bcnt;
   }
   public void setBcnt(int bcnt) {
      this.bcnt = bcnt;
   }
   public int getBid() {
      return bid;
   }
   public void setBid(int bid) {
      this.bid = bid;
   }
   public String getBtitle() {
      return btitle;
   }
   public void setBtitle(String btitle) {
      this.btitle = btitle;
   }
   public String getBcontent() {
      return bcontent;
   }
   public void setBcontent(String bcontent) {
      this.bcontent = bcontent;
   }
   public String getBdate() {
      return bdate;
   }
   public void setBdate(String bdate) {
      this.bdate = bdate;
   }
   public String getMid() {
      return mid;
   }
   public void setMid(String mid) {
      this.mid = mid;
   }
   @Override
public String toString() {
	return "BoardVO [bid=" + bid + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bdate=" + bdate + ", mid=" + mid
			+ ", searchCondition=" + searchCondition + ", searchContent=" + searchContent + ", lid=" + lid + ", bcnt="
			+ bcnt + ", cnt_r=" + cnt_r + ", cnt_l=" + cnt_l + ", cnt_n=" + cnt_n + "]";
}


   
   
   
}