package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Reply_reDAO;
import vo.Reply_reVO;



public class UpdateRRAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		Reply_reDAO dao = new Reply_reDAO();
		Reply_reVO vo = new Reply_reVO();
		
		vo.setRrcontent(request.getParameter("content")); // 수정할 대댓글 내용
		vo.setRrid(Integer.parseInt(request.getParameter("rrid"))); // 수정할 대댓글 번호
		
		if(dao.update_RR(vo)) { // 대댓글 수정
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("updateRR 오류");
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