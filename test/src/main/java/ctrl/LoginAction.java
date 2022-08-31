package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		
		vo.setMid(request.getParameter("mid"));
		vo.setMpw(request.getParameter("mpw"));
		vo = dao.selectOne(vo);
				
		
		if(vo!=null) {
			MemberVO member = new MemberVO();
			member.setMid(vo.getMid());
			member.setMname(vo.getMname());
			session.setAttribute("member", member);
			session.setAttribute("datas2", dao.selectAll_F(vo));
		}
		else {
			System.out.println("로그: 로그인 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("main.do");
		forward.setRedirect(true);
		
		return forward;
	}

}

/*
	else if(action.equals("login")){
		mVO=mDAO.selectOne(mVO);
		if(mVO!=null){
			session.setAttribute("mid", mVO.getMid());
			session.setAttribute("datas2", mDAO.selectAll_F(mVO));
			out.println("<script>alert('로그인 성공!');opener.parent.location.reload();window.close();</script>");
		}
		else{
			out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
		}
	}
*/