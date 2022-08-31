package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class InsertMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		ActionForward forward = null;
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setMid(request.getParameter("mid"));
		vo.setMpw(request.getParameter("mpw"));
		vo.setMname(request.getParameter("mname"));
		
		if(dao.insert(vo)) {
			forward = new ActionForward();
			forward.setPath("complete.jsp");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("insertM 오류");
		}
				
		return forward;
	}

}

/*
		if(action.equals("insert")){
			if(mDAO.insert(mVO)){
				out.println("<script>alert('회원가입 완료!');opener.parent.location.reload();window.close();</script>");
			}
			else{
				out.println("<script>alert('회원가입 실패!');history.go(-1);</script>");
			}
		}
*/