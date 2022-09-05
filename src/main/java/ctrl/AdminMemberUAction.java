package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

public class AdminMemberUAction implements Action {	
	

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ActionForward forward = null;
			MemberVO vo = new MemberVO();
			MemberDAO dao = new MemberDAO();
			
			vo.setMid(request.getParameter("mid"));
		
			vo.setRole(request.getParameter("role"));
			
			
			
			if(dao.update_ADMIN(vo)) { // 게시글 등록
				forward = new ActionForward();
				forward.setPath("admin.do");
				forward.setRedirect(true);
			}
			else {
				throw new Exception("공지등록 오류");
			}
						
			return forward;
		
			
		
		
		}
}

	

