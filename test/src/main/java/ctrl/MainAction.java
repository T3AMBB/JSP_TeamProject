package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardSet;
import board.BoardVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		ArrayList<BoardSet> datas;
		BoardDAO dao=new BoardDAO();
		BoardVO vo=new BoardVO();
		String searchContent = request.getParameter("searchContent");
		String paramCnt=request.getParameter("cnt");
		
		if(paramCnt==null || paramCnt.equals("")){
			vo.setCnt(2);
		}
		else {
			vo.setCnt(Integer.parseInt(paramCnt));
		}
		
//		vo.setSearchCondition(request.getParameter("searchCondition"));
		vo.setSearchContent(searchContent);
		
		if(searchContent==null || searchContent.equals("")) {
			request.setAttribute("datasSize", dao.selectAll_size(vo).size());
		}
		else {
			vo.setMname(searchContent);
			request.setAttribute("datasSize", dao.selectAll_B_M_size(vo).size());
		}
		
		datas=dao.selectAll(vo);
		request.setAttribute("datas", datas);
		request.setAttribute("cnt", vo.getCnt());
		request.setAttribute("searchContent", request.getParameter("searchContent"));
		
		ActionForward forward=new ActionForward();
		forward.setPath("/main.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
