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
		
		vo.setMid(request.getParameter("mid")); // 아이디
		vo.setMpw(request.getParameter("mpw")); // 비밀번호
		vo.setMname(request.getParameter("mname")); // 이름
		vo.setNickname(request.getParameter("nickname")); // 닉네임
		vo.setMphone(request.getParameter("mphone")); // 핸드폰 번호
		vo.setMemail(request.getParameter("memail")); // 이메일
		vo.setRole(request.getParameter("member")); // 역할

		if(dao.insert_M(vo)) { // 회원가입
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
