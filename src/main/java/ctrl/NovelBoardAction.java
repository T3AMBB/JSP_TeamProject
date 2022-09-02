package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NovelDAO;
import dao.OpinionDAO;
import vo.NovelVO;
import vo.OpinionVO;

public class NovelBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<OpinionVO> datas = new ArrayList<OpinionVO>();
		ActionForward forward = null;
		NovelDAO dao=new NovelDAO();
		NovelVO vo=new NovelVO();
		OpinionDAO oDAO = new OpinionDAO();
		OpinionVO oVO = new OpinionVO();
		
		vo.setNid(Integer.parseInt(request.getParameter("nid"))); // 소설 번호
		vo = dao.selectOne_N(vo); // 소설 상세 정보
		 
		oVO.setNid(Integer.parseInt(request.getParameter("nid"))); // 소설 번호
		datas = oDAO.selectAll_novelBoard(oVO);
		System.out.println(datas);
		if(vo != null) {
			request.setAttribute("data", dao.selectOne_N(vo));
			request.setAttribute("datas", datas);
			forward=new ActionForward();
			forward.setPath("/novelBoard.jsp");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("novelSelectOne 오류");
		}
			
		return forward;
	}
}
