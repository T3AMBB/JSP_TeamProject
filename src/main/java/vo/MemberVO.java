package vo;

public class MemberVO {
	private String mid;
	private String mpw;
	private String mname;
	private String nickname;
	private String mphone;
	private String memail;
	private String role;
	private int report; // 신고를 뽑기 위한 변수
	private int cnt; // 관리자에서 회원 전체 뽑을 시 페이징을 위한 임시 변수

	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", nickname=" + nickname + ", mphone="
				+ mphone + ", memail=" + memail + ", role=" + role + ", report=" + report + ", cnt=" + cnt + "]";
	}
	
	
}
