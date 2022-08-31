package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OpinionDAO;
import vo.MemberVO;
import vo.OpinionVO;

public class InsertOAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		OpinionDAO dao = new OpinionDAO();
		OpinionVO vo = new OpinionVO();
		
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		

		vo.setOcontent(request.getParameter("ocontent"));
		vo.setMid(mvo.getMid());
		vo.setOstar(Integer.parseInt(request.getParameter("ostar")));
		
		request.setAttribute("bid", request.getParameter("bid"));
		
		if(dao.insert_O(vo)) {
			forward = new ActionForward();
			forward.setPath("novelBoard.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("insertO ����");
		}
					
		return forward;
	}
	
}

/*
		if(bDAO.insert(bVO)){
			response.sendRedirect("ctrlB.jsp?action=main");
		}
*/