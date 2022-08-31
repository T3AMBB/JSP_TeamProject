package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;



public class DeleteBAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		vo.setBid(Integer.parseInt(request.getParameter("bid")));
		
		if(dao.delete_B(vo)) {
			forward = new ActionForward();
			forward.setPath("community.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("deleteB ¿À·ù");
		}
		
		return forward;
	}
}

/*
			if(bDAO.delete(bVO)){
				response.sendRedirect("ctrlB.jsp?action=main");
			}
*/