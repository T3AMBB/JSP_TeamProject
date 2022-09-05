package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.LlikeDAO;
import dao.ReplyDAO;
import dao.Reply_reDAO;
import set.BoardSet;
import vo.BoardVO;
import vo.LlikeVO;
import vo.MemberVO;
import vo.ReplyVO;
import vo.Reply_reVO;

public class CommunityBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		LlikeVO lvo = new LlikeVO(); 
		LlikeDAO lDAO = new LlikeDAO();
		ReplyVO rvo = new ReplyVO();
		ReplyDAO rDAO = new ReplyDAO();


		String paramCnt=request.getParameter("cnt");
		String paramRcnt=request.getParameter("rcnt");

		int begin = 0;
		int end = 0;
		int rbegin = 0;
		int rend = 0;

		if(paramCnt==null || paramCnt.equals("")){
			vo.setBcnt(1); // 댓글 페이징
			request.setAttribute("cnt", 1);
			paramCnt="0"; // paramCnt를 인트형으로 바꿀 때 null 에러가 발생하지 않도록 초기화
		}
		else {
			vo.setBcnt(Integer.parseInt(paramCnt));
			request.setAttribute("cnt", paramCnt);
		}

		if(paramRcnt==null || paramRcnt.equals("")) {
			vo.setCnt_l(1); // 대댓글 페이징
			request.setAttribute("rcnt", 1);
			paramRcnt="0";
		}
		else {	    	  
			vo.setCnt_l(Integer.parseInt(paramRcnt));
			request.setAttribute("rcnt", paramRcnt);
		}

		vo.setBid(Integer.parseInt(request.getParameter("bid"))); // 게시글 번호
		BoardSet data = dao.sql_selectOne_BoardOne(vo); // 게시글 상세 페이지 데이터



		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");

		if(mvo != null) { // 접속한 상태면 해당 멤버의 추천값 selectOne
			lvo.setMid(mvo.getMid()); // 현재 접속한 멤버 id
			lvo.setBid(Integer.parseInt(request.getParameter("bid")));
			lvo = lDAO.selectOne(lvo);
		}

		if(data != null) { // 게시물이 있으면 게시물과 멤버의 추천,비추천값 전달
			request.setAttribute("data", data);
			request.setAttribute("lvo", lvo);
			forward=new ActionForward();
			forward.setPath("/communityBoard.jsp");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("CBselectOne 오류");
		}

		ArrayList<ReplyVO> datas_size = new ArrayList<ReplyVO>(); // 댓글 사이즈용 배열
		rvo.setBid(Integer.parseInt(request.getParameter("bid")));
		datas_size = rDAO.selectAll_Board(rvo); 

		if(datas_size.size()<=25) { // 5개씩 5페이지이기 때문에 배열사이즈가 25보다 작으면 0~사이즈
			begin = 0;
			end = datas_size.size();
		} else {
			if(Integer.parseInt(paramCnt)>25) { // 넘어온 Cnt가 25보다 크면 설정 ex)25~49, 50~74, 75~99
				begin = 25*(Integer.parseInt(paramCnt)/25);
				end = 24+begin;
			} else { // 배열 사이즈가 25보다 클때 기본설정
				begin = 0;
				end = 24;
			}
		}

		if(begin>=25) {
			int pcnt = (int) Math.floor(begin/5);
			request.setAttribute("pcnt", pcnt);
		}


		if(Integer.parseInt(paramRcnt)>25) { // 넘어온 Cnt가 25보다 크면 설정 ex)25~49, 50~74, 75~99
			rbegin = 25*(Integer.parseInt(paramRcnt)/25);
			rend = 24+begin;
		} else { // 배열 사이즈가 25보다 클때 기본설정
			rbegin = 0;
			rend = 24;
		}


		if(rbegin>=25) {
			int rpcnt = (int) Math.floor(rbegin/5);
			request.setAttribute("rpcnt", rpcnt);
		}

		request.setAttribute("begin", begin);
		request.setAttribute("end", end);
		request.setAttribute("rbegin", rbegin);
		request.setAttribute("rend", rend);
		request.setAttribute("datas_size", datas_size);
		request.setAttribute("bid", request.getParameter("bid"));



		return forward;
	}

}
