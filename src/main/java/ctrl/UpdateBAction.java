package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class UpdateBAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		vo.setBtitle(request.getParameter("btitle")); // 수정할 게시글 제목
		vo.setBcontent(request.getParameter("bcontent")); // 수정할 게시글 내용
		vo.setBid(Integer.parseInt(request.getParameter("bid"))); // 수정할 게시글 번호
		
		if(dao.update_B(vo)) { // 게시글 수정
			forward = new ActionForward();
			forward.setPath("community.do");
			forward.setRedirect(true);
		}
		else {
			throw new Exception("updateB 오류");
		}
		
		return forward;
	}

}
/*
		if(bDAO.update(bVO)){
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			throw new Exception("update ����");
		}
*/