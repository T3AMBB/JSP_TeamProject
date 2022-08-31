package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fav.FavDAO;
import fav.FavVO;

public class FavAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		FavDAO dao = new FavDAO();
		FavVO vo = new FavVO();
		
		
		vo.setMid(request.getParameter("mid"));
		vo.setBid(Integer.parseInt(request.getParameter("bid")));

		vo = dao.selectOne(vo);
		if(vo != null) {
			dao.update(vo);
			System.out.println("로그: 좋아요 update");
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
		}
		else {
			FavVO vo2 = new FavVO();
			vo2.setMid(request.getParameter("mid"));
			vo2.setBid(Integer.parseInt(request.getParameter("bid")));
			System.out.println("로그: 좋아요 insert");
			dao.insert(vo2);
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		
		return forward;
	}
}

/*
		if(bDAO.update(bVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}
*/