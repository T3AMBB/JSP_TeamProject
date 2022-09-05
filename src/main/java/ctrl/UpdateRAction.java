package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDAO;
import vo.BoardVO;
import vo.ReplyVO;



public class UpdateRAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		ReplyDAO dao = new ReplyDAO();
		ReplyVO vo = new ReplyVO();
		BoardVO Bvo = new BoardVO();
		vo.setRcontent(request.getParameter("content")); // 수정할 댓글 내용
		vo.setRid(Integer.parseInt(request.getParameter("rid"))); // 수정할 댓글 번호
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
	      
		
		if(dao.update_R(vo)) { // 댓글 수정
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("updateR 오류");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt")); // 페이징 유지할 댓글 cnt
		System.out.println(request.getParameter("cnt"));
		request.setAttribute("bid", request.getParameter("bid")); // 게시글 번호
		System.out.println( request.getParameter("bid"));
		
		return forward;
	}

}

/*

		if(bDAO.insertR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}

*/