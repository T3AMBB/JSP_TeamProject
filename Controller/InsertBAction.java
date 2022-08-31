package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;
import vo.MemberVO;

public class InsertBAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		vo.setMid(mvo.getMid());
		vo.setBtitle(request.getParameter("btitle"));
		vo.setBcontent(request.getParameter("bcontent"));
		
		if(dao.insert_B(vo)) {
			forward = new ActionForward();
			forward.setPath("community.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("insertB ����");
		}
					
		return forward;
	}
	
}

/*
		if(bDAO.insert(bVO)){
			response.sendRedirect("ctrlB.jsp?action=main");
		}
*/