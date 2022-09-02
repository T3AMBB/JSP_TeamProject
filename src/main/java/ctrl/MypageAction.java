package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

public class MypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		vo.setMid(mvo.getMid()); // 현재 접속한 사람 id
		vo = dao.selectOne_MID(vo); // 마이 페이지용 selectOne
		
		if(vo != null) {
			request.setAttribute("data", vo);
			forward=new ActionForward();
			forward.setPath("/mypage.jsp");
			forward.setRedirect(false);			
		}
		else {
			throw new Exception("Mypage 오류");
		}
		
		return forward;
	}

}
