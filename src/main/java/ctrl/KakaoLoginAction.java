package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

public class KakaoLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		MemberVO vo = new MemberVO();
		
		if(request.getParameter("mid")!=null) {
			
			HttpSession session = request.getSession();
			
			vo.setMid(request.getParameter("mid"));;
			vo.setNickname(request.getParameter("mpw"));
			
			session.setAttribute("member", vo);
			
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
