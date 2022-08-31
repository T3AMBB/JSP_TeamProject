package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class UpdateBAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		vo.setBtitle(request.getParameter("btitle"));
		vo.setBcontent(request.getParameter("bcontent"));
		vo.setBid(Integer.parseInt(request.getParameter("bid")));
		
		if(dao.update_B(vo)) {
			forward = new ActionForward();
			forward.setPath("community.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("updateB 오류");
		}
		
		return forward;
	}

}
/*
		if(bDAO.update(bVO)){
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			throw new Exception("update 오류");
		}
*/