package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

public class UpdateMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
				
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		vo.setMid(mvo.getMid());
		vo.setMpw(request.getParameter("mpw"));
		vo.setMname(request.getParameter("mname"));

		if(dao.update_MY(vo)) {
			session.invalidate();
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("updateM ����");
		}
		
		return forward;
	}

}

/*
		else if(action.equals("memberUpdate")){
			if(mDAO.update(mVO)){
				session.invalidate(); // ���� ���� ��ü �����ϱ�
				// session.removeAttribute("member"); ���� ���� Ÿ���Ͽ� ������ ����
				response.sendRedirect("login.jsp");
			}
			else {
				throw new Exception("memberUpdate ����");
			}
		}
*/