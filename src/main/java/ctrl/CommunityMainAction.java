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
		
		String searchCondition = request.getParameter("searchCondition"); // 검색 종류 (제목, 내용, 작성자)
		String searchContent = request.getParameter("searchContent"); // 검색 내용
		String paramCnt=request.getParameter("cnt");
		
		vo.setSearchContent(searchContent);
		vo.setSearchCondition(searchCondition);
		
		if(paramCnt==null || paramCnt.equals("")){
			vo.setBcnt(1);
		}
		else {
			vo.setBcnt(Integer.parseInt(paramCnt));
		}
		
		datas = dao.sql_selectAll_BoardAll(vo); // 검색한 배열 or 전체 배열
//		System.out.println(datas);	
		request.setAttribute("datas", datas);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/community.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
