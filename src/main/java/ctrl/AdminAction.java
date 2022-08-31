package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class AdminAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		datasL = dao.추천받은 게시글(vo);
		datasR = dao.신고받은 게시글(vo);
		
		request.setAttribute("datasL", datasL);
		request.setAttribute("datasR", datasR);
		
	
		forward=new ActionForward();
		forward.setPath("/admin.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
