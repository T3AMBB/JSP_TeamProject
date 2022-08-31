package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Reply_reDAO;
import vo.MemberVO;
import vo.Reply_reVO;



public class InsertRRAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		Reply_reDAO dao = new Reply_reDAO();
		Reply_reVO vo = new Reply_reVO();
		
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		vo.setRrcontent(request.getParameter("content"));
		vo.setMid(mvo.getMid());
		vo.setBid(Integer.parseInt(request.getParameter("bid")));	
		
		if(dao.insert_RR(vo)) {
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("insertRR ����");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		request.setAttribute("bid", request.getParameter("bid"));
		request.setAttribute("rcnt", request.getParameter("rcnt"));
		
		return forward;
	}

}

/*

		if(bDAO.insertR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}

*/