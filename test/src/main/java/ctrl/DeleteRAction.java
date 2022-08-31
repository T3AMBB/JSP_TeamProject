package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.ReplyVO;

public class DeleteRAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		ReplyVO vo = new ReplyVO();
		
		vo.setRid(Integer.parseInt(request.getParameter("rid")));
		if(dao.deleteR(vo)) {
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("deleteR 오류");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		
		return forward;		
	}

}

/*
		if(bDAO.deleteR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}
*/