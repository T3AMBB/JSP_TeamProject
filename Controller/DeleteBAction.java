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
		
		vo.setBid(Integer.parseInt(request.getParameter("bid"))); // 삭제할 게시글 번호
		
		if(dao.delete_B(vo)) { // 게시글 삭제
			forward = new ActionForward();
			forward.setPath("community.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("deleteB 오류");
		}
		
		return forward;
	}
}

/*
			if(bDAO.delete(bVO)){
				response.sendRedirect("ctrlB.jsp?action=main");
			}
*/