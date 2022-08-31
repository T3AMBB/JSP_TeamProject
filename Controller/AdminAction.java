package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class AdminAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<BoardVO> datasL;
		ArrayList<BoardVO> datasR;
		
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		datasL = dao.selectAll_Lstatus(vo); // 추천 많이 받은 게시글
		datasR = dao.selectAll_REPORT(vo); // 신고 많이 받은 게시글
		
		request.setAttribute("datasL", datasL);
		request.setAttribute("datasR", datasR);
	
		forward=new ActionForward();
		forward.setPath("/admin.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
