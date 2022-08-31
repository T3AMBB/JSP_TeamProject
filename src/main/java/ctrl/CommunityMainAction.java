package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import set.BoardSet;
import vo.BoardVO;

public class CommunityMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		ArrayList<BoardSet> datas = new ArrayList<BoardSet>();
		
		String searchCondition = request.getParameter("searchCondition");
		String searchContent = request.getParameter("searchContent");
		String paramCnt=request.getParameter("cnt");
		
//		vo.setSearchContent(searchContent);
//		vo.setSearchCondition(searchCondition);
		
		datas = dao.sql_selectAll_BoardAll(vo);
			
		request.setAttribute("datas", datas);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/community.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
