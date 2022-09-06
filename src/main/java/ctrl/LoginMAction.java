package ctrl;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

  
public class LoginMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setMid(request.getParameter("mid")); // 입력받은 id
		vo.setMpw(request.getParameter("mpw")); // 입력받은 비밀번호
		vo = dao.selectOne_LOGIN(vo); // 로그인
		
		if(vo!=null) {
			MemberVO member = new MemberVO();
			member.setMid(vo.getMid()); // 접속한 사람의 id
			member.setNickname(vo.getNickname()); // 접속한 사람의 닉네임
			member.setRole(vo.getRole()); // 접속한 사람의 역할
			session.setAttribute("member", member);
			session.setAttribute("mpw", vo.getMpw());
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
			System.out.println("로그인 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("main.do");
		forward.setRedirect(true);
		
		return forward;
	}

}
