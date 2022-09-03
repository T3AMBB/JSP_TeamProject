package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;



public class DeleteMAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();

		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member"); // 접속한 멤버
		
		vo.setMid(mvo.getMid()); // 접속한 멤버의 id
		vo.setMpw(request.getParameter("mpw")); // 입력받은 pw
		vo = dao.selectOne_LOGIN(vo);

		if(vo != null) {
				dao.delete_M(vo);
				session.invalidate();
				forward = new ActionForward();
				forward.setPath("main.do");
				forward.setRedirect(true);
			}
			else {
				throw new Exception("deleteM 오류");
			}
		return forward;
	}
}

/*
		else if(action.equals("memberDelete")){
			MemberVO member=(MemberVO)session.getAttribute("member");
			if(member!=null && mDAO.delete(member)){
			//	bVO.setWriter(member.getMname());
			//	bDAO.delete_all(bVO);
				session.invalidate(); // ���� ���� ��ü �����ϱ�
				response.sendRedirect("login.jsp");
			}
			else {
				throw new Exception("memberdelete ����");
			}
		}	
 */