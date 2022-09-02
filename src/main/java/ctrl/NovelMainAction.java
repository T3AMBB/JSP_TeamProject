package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NovelDAO;
import vo.NovelVO;

public class NovelMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		ArrayList<NovelVO> datas;
		NovelDAO dao=new NovelDAO();
		NovelVO vo=new NovelVO();
		String searchCondition = request.getParameter("searchCondition"); // 검색 조건 (제목, 작가, 장르)
		String searchContent = request.getParameter("searchContent"); // 검색 내용
		String paramCnt=request.getParameter("cnt");
		
		vo.setSearchCondition(searchCondition);
		vo.setSearchContent(searchContent);
		
		if(paramCnt==null || paramCnt.equals("")){
			vo.setNcnt(1);
		}
		else {
			vo.setNcnt(Integer.parseInt(paramCnt));
		}
		
//		vo.setSearchCondition(request.getParameter("searchCondition"));
		
		datas=dao.selectAll_N(vo); // 검색한 소설 or 전체 소설
		
		request.setAttribute("datas", datas);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/novelMain.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
