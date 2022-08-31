package set;


import java.util.ArrayList;

import vo.BoardVO;

public class BoardSet {

	private BoardVO boardVO;
	private ArrayList<ReplySet> replySet;
	
	
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	public ArrayList<ReplySet> getReplySet() {
		return replySet;
	}
	public void setReplySet(ArrayList<ReplySet> replySet) {
		this.replySet = replySet;
	}

	
}
