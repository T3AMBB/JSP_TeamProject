package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import set.BoardSet;
import vo.BoardVO;

public class CommunityBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		
//		vo.setSearchContent(searchContent);
//		vo.setSearchCondition(searchCondition);
		
		BoardSet data = dao.sql_selectOne_BoardOne(vo);
		
		if(data != null) {
			request.setAttribute("data", data);
			forward=new ActionForward();
			forward.setPath("/community.jsp");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("CBselectOne 오류");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		request.setAttribute("bid", request.getParameter("bid"));
		request.setAttribute("rcnt", request.getParameter("rcnt"));
		

		return forward;
	}

}
