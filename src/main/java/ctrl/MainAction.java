package ctrl;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.NovelDAO;
import vo.BoardVO;
import vo.NovelVO;


public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		ArrayList<NovelVO> datas;
		NovelDAO dao=new NovelDAO();
		NovelVO vo=new NovelVO();
		
		ArrayList<BoardVO> bdatas;
		BoardDAO bdao=new BoardDAO();
		BoardVO bvo=new BoardVO();
/*		
		String searchCondition = request.getParameter("searchCondition");
		String searchContent = request.getParameter("searchContent");
		String paramCnt=request.getParameter("cnt");
		
		vo.setSearchCondition(searchCondition);
		vo.setSearchContent(searchContent);
		
		if(paramCnt==null || paramCnt.equals("")){
			datas=dao.selectAll(vo);
		
		}
		else {			
			vo.setNcnt(Integer.parseInt(paramCnt));
			datas=dao.selectAll_N(vo);
		}
*/			
		datas=dao.selectAll(vo); // 모든 소설 데이터
		request.setAttribute("datas", datas);
		
		bdatas=bdao.selectAll_Recommend(bvo);
		request.setAttribute("bdatas", bdatas);
		
		Random random = new Random();
		int rd = random.nextInt(80);
		request.setAttribute("rs", rd);
		request.setAttribute("re", rd+11);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/main.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
