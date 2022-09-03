package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.MemberDAO;
import dao.NovelDAO;
import vo.BoardVO;
import vo.MemberVO;
import vo.NovelVO;

public class AdminAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		MemberDAO mDAO = new MemberDAO();
		MemberVO mVO = new MemberVO();
		NovelDAO nDAO=new NovelDAO();
		NovelVO nVO=new NovelVO();
		
		ArrayList<BoardVO>datasL = dao.selectAll_Lstatus(vo); // 추천 많이 받은 게시글
		ArrayList<BoardVO>datasR = dao.selectAll_REPORT(vo); // 신고 많이 받은 게시글
		mVO = mDAO.selectAll_MEMBER_COUNT(mVO);
		nVO = nDAO.selectAll_NOVEL_COUNT(nVO);
		vo = dao.selectAll_BOARD_COUNT(vo);
				
		request.setAttribute("datasL", datasL);
		request.setAttribute("datasR", datasR);
		request.setAttribute("mVO", mVO);
		request.setAttribute("nVO", nVO);
		request.setAttribute("vo", vo);
	
		forward=new ActionForward();
		forward.setPath("/admin.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
