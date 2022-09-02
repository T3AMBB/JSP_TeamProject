package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OpinionDAO;
import vo.OpinionVO;

public class DeleteOAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		OpinionDAO dao = new OpinionDAO();
		OpinionVO vo = new OpinionVO();
		
		vo.setOid(Integer.parseInt(request.getParameter("oid"))); // 삭제할 리뷰 번호
				
		request.setAttribute("nid", request.getParameter("nid")); // 페이징 유지할 소설 번호
		
		if(dao.delete_O(vo)) { // 리뷰 삭제
			forward = new ActionForward();
			forward.setPath("novelBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("deleteO 오류");
		}
					
		return forward;
	}
	
}

/*
		if(bDAO.insert(bVO)){
			response.sendRedirect("ctrlB.jsp?action=main");
		}
*/