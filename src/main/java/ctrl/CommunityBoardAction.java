package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.LlikeDAO;
import set.BoardSet;
import vo.BoardVO;
import vo.LlikeVO;
import vo.MemberVO;

public class CommunityBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		LlikeVO lvo = new LlikeVO(); 
		LlikeDAO lDAO = new LlikeDAO(); 
		
//		vo.setSearchContent(searchContent);
//		vo.setSearchCondition(searchCondition);
		
		vo.setBid(Integer.parseInt(request.getParameter("bid"))); // 게시글 번호
		BoardSet data = dao.sql_selectOne_BoardOne(vo); // 게시글 상세 페이지 데이터
		
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		if(mvo != null) {
			lvo.setMid(mvo.getMid()); // 현재 접속한 멤버 id
			lvo.setBid(Integer.parseInt(request.getParameter("bid")));
			lvo = lDAO.selectOne(lvo);
		}
		
		if(data != null) {
			request.setAttribute("data", data);
			request.setAttribute("lvo", lvo);
			forward=new ActionForward();
			forward.setPath("/communityBoard.jsp");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("CBselectOne 오류");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		request.setAttribute("bid", request.getParameter("bid"));
		request.setAttribute("rcnt", request.getParameter("rcnt"));
		

		return forward;
	}

}
