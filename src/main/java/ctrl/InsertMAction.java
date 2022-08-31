package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;



public class InsertMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setMid(request.getParameter("mid"));
		vo.setMpw(request.getParameter("mpw"));
		vo.setMname(request.getParameter("mname"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setMphone(request.getParameter("mphone"));
		vo.setMemail(request.getParameter("memail"));
		vo.setRole(request.getParameter("member"));

		if(dao.insert_M(vo)) {
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("insertM 오류");
		}
				
		return forward;
	}

}
