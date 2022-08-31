package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Reply_reDAO;
import vo.MemberVO;
import vo.Reply_reVO;



public class InsertRRAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		Reply_reDAO dao = new Reply_reDAO();
		Reply_reVO vo = new Reply_reVO();
		
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		vo.setRrcontent(request.getParameter("content")); // 대댓글 내용
		vo.setMid(mvo.getMid()); // 작성자 id
		vo.setBid(Integer.parseInt(request.getParameter("bid"))); // 대댓글이 달린 게시글 번호
		vo.setRid(Integer.parseInt(request.getParameter("rid"))); // 대댓글이 달린 댓글 번호
		
		if(dao.insert_RR(vo)) { // 대댓글 작성
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("insertRR 오류");
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