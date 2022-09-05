package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAO;
import vo.BoardVO;
import vo.ReplyVO;



public class DeleteRAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ReplyDAO dao = new ReplyDAO();
		ReplyVO vo = new ReplyVO();
		BoardVO Bvo = new BoardVO();
		
		String paramCnt=request.getParameter("cnt");
		
	      
	      
	      
	      if(paramCnt==null || paramCnt.equals("")){
	         Bvo.setBcnt(1);
	         request.setAttribute("cnt", 1);
	         paramCnt="0"; // paramCnt를 인트형으로 바꿀 때 null 에러가 발생하지 않도록 초기화
	      }
	      else {
	         Bvo.setBcnt(Integer.parseInt(paramCnt));
	         request.setAttribute("cnt", paramCnt);
	      }
		
		vo.setRid(Integer.parseInt(request.getParameter("rid"))); // 삭제할 댓글 번호
		
		if(dao.delete_R(vo)) { // 댓글 삭제
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("deleteR 오류");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		request.setAttribute("bid", request.getParameter("bid"));

		
		return forward;		
	}

}

/*
		if(bDAO.deleteR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}
*/