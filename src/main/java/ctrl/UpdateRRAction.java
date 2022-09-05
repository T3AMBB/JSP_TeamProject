package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Reply_reDAO;
import vo.BoardVO;
import vo.Reply_reVO;



public class UpdateRRAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		Reply_reDAO dao = new Reply_reDAO();
		Reply_reVO vo = new Reply_reVO();
		BoardVO Bvo =new BoardVO();
		vo.setRrcontent(request.getParameter("content")); // 수정할 대댓글 내용
		vo.setRrid(Integer.parseInt(request.getParameter("rrid"))); // 수정할 대댓글 번호
		
		
		String paramCnt=request.getParameter("cnt");
		String paramRcnt=request.getParameter("rcnt");
		
	      
	      
	      
	      if(paramCnt==null || paramCnt.equals("")){
	         Bvo.setBcnt(1);
	         request.setAttribute("cnt", 1);
	         paramCnt="0"; // paramCnt를 인트형으로 바꿀 때 null 에러가 발생하지 않도록 초기화
	      }
	      else {
	         Bvo.setBcnt(Integer.parseInt(paramCnt));
	         request.setAttribute("cnt", paramCnt);
	      }
	      if(paramRcnt==null || paramRcnt.equals("")) {
				Bvo.setCnt_l(1); // 대댓글 페이징
				request.setAttribute("rcnt", 1);
				paramRcnt="0";
			}
			else {	    	  
				Bvo.setCnt_l(Integer.parseInt(paramRcnt));
				request.setAttribute("rcnt", paramRcnt);
			}
		
		if(dao.update_RR(vo)) { // 대댓글 수정
			forward = new ActionForward();
			forward.setPath("communityBoard.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("updateRR 오류");
		}
		
		request.setAttribute("cnt", request.getParameter("cnt"));
		System.out.println(request.getParameter("cnt"));
		request.setAttribute("bid", request.getParameter("bid"));
		System.out.println(request.getParameter("bid"));
		request.setAttribute("rcnt", request.getParameter("rcnt"));
		System.out.println(request.getParameter("rcnt"));

		
		return forward;
	}

}

/*

		if(bDAO.insertR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}

*/