package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import member.MemberDAO;
import member.MemberVO;

public class DeleteMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();

		ActionForward forward = null;
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();


		vo.setMid(request.getParameter("mid"));
		vo.setMpw(request.getParameter("mpw"));
		vo = dao.selectOne(vo);

		if(vo != null) {
			if(dao.deleteMSample(vo)) {
				dao.delete(vo);
				session.invalidate();
				forward = new ActionForward();
				forward.setPath("main.do");
				forward.setRedirect(true);
			}
			else {
				forward = new ActionForward();
				forward.setPath("error/error.jsp");
				forward.setRedirect(true);
				throw new Exception("게시글 또는 댓글이 존재하여 삭제 불가");
			}
		}
		return forward;
	}
}

/*
		else if(action.equals("memberDelete")){
			MemberVO member=(MemberVO)session.getAttribute("member");
			if(member!=null && mDAO.delete(member)){
			//	bVO.setWriter(member.getMname());
			//	bDAO.delete_all(bVO);
				session.invalidate(); // 세션 정보 전체 제거하기
				response.sendRedirect("login.jsp");
			}
			else {
				throw new Exception("memberdelete 오류");
			}
		}	
 */