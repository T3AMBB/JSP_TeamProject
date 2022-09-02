package vo;

public class NovelVO {

	private int nid;
	private String ntitle;
	private String ncontent;
	private String nimg;
	private String ngenre;
	private String nwriter;
	private String searchCondition;
	private String searchContent;
	private double avg; // 별점 평균을 뽑기위한 변수
	private int ncnt; // 페이징처리를 위한 변수
	
	
	
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
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

	public int getNcnt() {
		return ncnt;
	}
	public void setNcnt(int ncnt) {
		this.ncnt = ncnt;
	}
	public String getNwriter() {
		return nwriter;
	}
	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNimg() {
		return nimg;
	}
	public void setNimg(String nimg) {
		this.nimg = nimg;
	}
	public String getNgenre() {
		return ngenre;
	}
	public void setNgenre(String ngenre) {
		this.ngenre = ngenre;
	}
	@Override
	public String toString() {
		return "NovelVO [nid=" + nid + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", nimg=" + nimg + ", ngenre="
				+ ngenre + ", nwriter=" + nwriter + ", searchCondition=" + searchCondition + ", searchContent="
				+ searchContent + ", avg=" + avg + ", ncnt=" + ncnt + "]";
	}
	
	
}
