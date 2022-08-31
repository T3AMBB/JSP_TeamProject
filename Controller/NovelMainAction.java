package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NovelDAO;
import set.BoardSet;
import vo.NovelVO;

public class NovelMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		ArrayList<NovelVO> datas;
		NovelDAO dao=new NovelDAO();
		NovelVO vo=new NovelVO();
		String searchCondition = request.getParameter("searchCondition");
		String searchContent = request.getParameter("searchContent");
		String paramCnt=request.getParameter("cnt");
		
		if(paramCnt==null || paramCnt.equals("")){
			vo.setNcnt(20);
		}
		else {
			vo.setNcnt(Integer.parseInt(paramCnt));
		}
		
//		vo.setSearchCondition(request.getParameter("searchCondition"));
		vo.setSearchContent(searchContent);
		vo.setSearchCondition(searchCondition);
		
		datas=dao.selectAll_N(vo);
		
		request.setAttribute("datas", datas);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/novelMain.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
