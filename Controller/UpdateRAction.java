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
		
		vo.setRcontent(request.getParameter("content")); // 수정할 댓글 내용
		vo.setRid(Integer.parseInt(request.getParameter("rid"))); // 수정할 댓글 번호
		
		if(dao.update_R(vo)) { // 댓글 수정
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("updateR 오류");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt")); // 페이징 유지할 댓글 cnt
		request.setAttribute("bid", request.getParameter("bid")); // 게시글 번호
		
		
		return forward;
	}

}

/*

		if(bDAO.insertR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}

*/