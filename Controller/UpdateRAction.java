package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAO;
import vo.ReplyVO;



public class UpdateRAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		ReplyDAO dao = new ReplyDAO();
		ReplyVO vo = new ReplyVO();
		
		vo.setRcontent(request.getParameter("content"));
		vo.setRid(Integer.parseInt(request.getParameter("rid")));		
		
		if(dao.update_R(vo)) {
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("updateR ¿À·ù");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		request.setAttribute("bid", request.getParameter("bid"));
		
		
		return forward;
	}

}

/*

		if(bDAO.insertR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}

*/