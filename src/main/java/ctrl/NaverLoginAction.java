package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.MemberVO;

public class NaverLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		MemberVO vo = new MemberVO();
		
		if(request.getParameter("mid")!=null) {
			
			HttpSession session = request.getSession();
			vo.setMid(request.getParameter("mid"));
			
			session.setAttribute("member", vo);
			
			HttpSession session1=request.getSession();
			session1.setAttribute("logoutValue", 100);
			
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
