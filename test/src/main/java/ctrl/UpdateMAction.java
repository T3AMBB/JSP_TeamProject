package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

public class UpdateMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		
		ActionForward forward = null;
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		
		vo.setMid(request.getParameter("mid"));
		vo.setMpw(request.getParameter("mpw"));
		vo.setMname(request.getParameter("mname"));

		if(dao.update(vo)) {
			session.invalidate();
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("updateM 오류");
		}
		
		return forward;
	}

}

/*
		else if(action.equals("memberUpdate")){
			if(mDAO.update(mVO)){
				session.invalidate(); // 세션 정보 전체 제거하기
				// session.removeAttribute("member"); 일정 정보 타겟하여 삭제도 가능
				response.sendRedirect("login.jsp");
			}
			else {
				throw new Exception("memberUpdate 오류");
			}
		}
*/