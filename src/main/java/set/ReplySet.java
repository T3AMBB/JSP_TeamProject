package set;

import java.util.ArrayList;

import vo.ReplyVO;
import vo.Reply_reVO;

public class ReplySet {

	private ReplyVO replyVO;
	private ArrayList<Reply_reVO> rrList;
	
	public ReplyVO getReplyVO() {
		return replyVO;
	}
	public void setReplyVO(ReplyVO replyVO) {
		this.replyVO = replyVO;
	}
	public ArrayList<Reply_reVO> getrrList() {
		return rrList;
	}
	public void setrrList(ArrayList<Reply_reVO> rrList) {
		this.rrList = rrList;
	}
	
	
}
