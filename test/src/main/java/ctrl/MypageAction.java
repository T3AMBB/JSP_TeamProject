package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		
		ActionForward forward = null;
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		
		vo.setMid(request.getParameter("mid"));
		vo.setMpw(request.getParameter("mpw"));
		vo = dao.selectOne(vo);
		
		if(vo != null) {
			request.setAttribute("data", vo);
			forward = new ActionForward();
			forward.setPath("mypage.jsp");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("Mypage 오류");
		}
		
		return forward;
		

	}

}

/*
		else if(action.equals("mypage")){
			MemberVO member=(MemberVO)session.getAttribute("member");
			// 이후에는 selectOne을 통해서 data를 받게 될 예정
			if(member!=null){
				request.setAttribute("data", member);
				pageContext.forward("mypage.jsp");
			}
			else {
				throw new Exception("Mypage 오류");
			}
		}
*/