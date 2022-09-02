package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OpinionDAO;
import vo.MemberVO;
import vo.OpinionVO;

public class InsertOAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		OpinionDAO dao = new OpinionDAO();
		OpinionVO vo = new OpinionVO();
		
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		if(mvo!=null) {
			vo.setMid(mvo.getMid()); // 작성자 id
			vo.setOcontent(request.getParameter("ocontent")); // 리뷰 내용
			vo.setOstar(Integer.parseInt(request.getParameter("ostar"))); // 평점
			vo.setNid(Integer.parseInt(request.getParameter("nid")));
			request.setAttribute("nid", request.getParameter("nid")); // 페이징 유지할 소설번호
		}
		
		if(dao.insert_O(vo)) { // 리뷰 등록
			forward = new ActionForward();
			forward.setPath("novelBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("insertO 오류");
		}
					
		return forward;
	}
	
}

/*
		if(bDAO.insert(bVO)){
			response.sendRedirect("ctrlB.jsp?action=main");
		}
*/