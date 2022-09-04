package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

public class AdminBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ActionForward forward = null;
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		String paramCnt=request.getParameter("cnt");
		
		if(paramCnt==null || paramCnt.equals("")){
			vo.setCnt(1);
		}
		else {
			vo.setCnt(Integer.parseInt(paramCnt));
		}
		
		ArrayList<MemberVO> datas = dao.selectAll_MEMBER(vo);
			
		request.setAttribute("datas", datas);
		forward = new ActionForward();
		forward.setPath("adminBoard.jsp");
		forward.setRedirect(false);
		
					
		return forward;
	
		
	
	
	}
}



