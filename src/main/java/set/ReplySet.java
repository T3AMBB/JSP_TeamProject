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
	
	// 댓글 VO, 대댓글 배열 > 댓글Set객체 > 댓글 Set배열 
	// 게시글VO,댓글Set배열 > 보드Set객체 > 보드Set배열
	
	//	게시판 목록에서는 All 이 맞는데 
	//	게시판 누르면 상세가고 거기서 댓글보이잖아요 
	//	그럼 One > 댓글All 
	//	댓글 One > 대댓글 All 시발 어떻게 해 이거
}
