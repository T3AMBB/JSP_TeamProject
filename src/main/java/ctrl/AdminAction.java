package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.MemberDAO;
import dao.NovelDAO;
import dao.OpinionDAO;
import vo.BoardVO;
import vo.MemberVO;
import vo.NovelVO;
import vo.OpinionVO;

public class AdminAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		System.out.println("어드민액션로그");
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO bVO = new BoardVO();
		MemberDAO mDAO = new MemberDAO();
		MemberVO mVO = new MemberVO();
		NovelDAO nDAO=new NovelDAO();
		NovelVO nVO=new NovelVO();
		OpinionDAO oDAO=new OpinionDAO();
		OpinionVO oVO = new OpinionVO();
		
		ArrayList<BoardVO>datasL = dao.selectAll_Lstatus(bVO); // 추천 많이 받은 게시글
		ArrayList<BoardVO>datasR = dao.selectAll_REPORT(bVO); // 신고 많이 받은 게시글
		mVO = mDAO.selectAll_MEMBER_COUNT(mVO); 
		nVO = nDAO.selectAll_NOVEL_COUNT(nVO); 
		bVO = dao.selectAll_BOARD_COUNT(bVO); 
		ArrayList<OpinionVO> odatas=oDAO.selectAll_MVP_COUNT(oVO);
		
				
		request.setAttribute("datasL", datasL);  // 추천수
		request.setAttribute("datasR", datasR);  // 신고수
		request.setAttribute("mVO", mVO); 		 // 전체 멤버
		request.setAttribute("nVO", nVO);		 // 소설
		request.setAttribute("bVO", bVO);		// 커뮤니티 게시글
		request.setAttribute("odatas", odatas); // 리뷰왕 5명출력
		
		forward=new ActionForward();
		forward.setPath("/admin.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
