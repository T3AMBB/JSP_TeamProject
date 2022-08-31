package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NovelDAO;
import vo.NovelVO;

public class NovelBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		NovelDAO dao=new NovelDAO();
		NovelVO vo=new NovelVO();
		
		vo.setNid(Integer.parseInt(request.getParameter("Nid")));
		dao.selectOne_N(vo);
		
		request.setAttribute("data", dao.selectOne_N(vo));
			
		ActionForward forward=new ActionForward();
		forward.setPath("/novelBoard.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
