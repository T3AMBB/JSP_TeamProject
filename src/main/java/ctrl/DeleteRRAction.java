package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Reply_reDAO;
import vo.BoardVO;
import vo.Reply_reVO;



public class DeleteRRAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Reply_reDAO dao = new Reply_reDAO();
		Reply_reVO vo = new Reply_reVO();
		BoardVO Bvo = new BoardVO();
		
		String paramCnt=request.getParameter("cnt");
		String paramRcnt=request.getParameter("rcnt");
		
	      
	      
	      
	      if(paramCnt==null || paramCnt.equals("")){
	         Bvo.setBcnt(1);
	         request.setAttribute("cnt", 1);
	         paramCnt="0"; // paramCnt를 인트형으로 바꿀 때 null 에러가 발생하지 않도록 초기화
	      }
	      else {
	         Bvo.setBcnt(Integer.parseInt(paramCnt));
	         request.setAttribute("cnt", paramCnt);
	      }
	      if(paramRcnt==null || paramRcnt.equals("")) {
				Bvo.setCnt_l(1); // 대댓글 페이징
				request.setAttribute("rcnt", 1);
				paramRcnt="0";
			}
			else {	    	  
				Bvo.setCnt_l(Integer.parseInt(paramRcnt));
				request.setAttribute("rcnt", paramRcnt);
			}
		
		vo.setRrid(Integer.parseInt(request.getParameter("rrid"))); // 삭제할 대댓글 번호
		
		if(dao.delete_RR(vo)) { // 대댓글 삭제
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("deleteRR 오류");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		request.setAttribute("bid", request.getParameter("bid"));
		request.setAttribute("rcnt", request.getParameter("rcnt"));

		
		return forward;		
	}

}

/*
		if(bDAO.deleteR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}
*/