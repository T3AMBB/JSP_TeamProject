package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;



public class AdminMemberDAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();

		
		vo.setMid(request.getParameter("mid"));
		System.out.println(request.getParameter("mid"));
		vo.setMpw(request.getParameter("mpw"));
		System.out.println(request.getParameter("mpw"));
		vo = dao.selectOne_LOGIN(vo);

		if(vo != null) {
				dao.delete_M(vo);
				
				forward = new ActionForward();
				forward.setPath("admin.do");
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