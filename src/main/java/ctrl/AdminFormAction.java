package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;
import vo.MemberVO;

public class AdminFormAction implements Action {	
	

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ActionForward forward = null;
			BoardDAO dao = new BoardDAO();
			BoardVO vo = new BoardVO();
			
			HttpSession session=request.getSession();
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			
			vo.setMid(mvo.getMid()); // 현재 접속한 멤버 id
			System.out.println(vo.getMid());
			vo.setBtitle(request.getParameter("notice-title")); // 입력받은 게시글 제목
			System.out.println(request.getParameter("notice-title"));
			vo.setBcontent(request.getParameter("text")); // 입력한 게시글 내용
			System.out.println(request.getParameter("text"));
			
			if(dao.insert_B(vo)) { // 게시글 등록
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

	

