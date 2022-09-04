package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.MemberDAO;
import dao.OpinionDAO;
import vo.BoardVO;
import vo.MemberVO;
import vo.OpinionVO;

public class AdminMemberAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ArrayList<BoardVO> datas = new ArrayList<BoardVO>(); 
		
		ArrayList<OpinionVO> datas1 = new ArrayList<OpinionVO>();
		ActionForward forward = null;
		BoardDAO Bdao = new BoardDAO();
		BoardVO Bvo = new BoardVO();
		OpinionDAO Odao = new OpinionDAO();
		OpinionVO Ovo = new OpinionVO();
		MemberVO Mvo= new MemberVO();
		MemberDAO Mdao= new MemberDAO();
		
		Mvo.setMid(request.getParameter("mid"));
		Mvo=Mdao.selectOne_MID(Mvo);
		
		Bvo.setMid(Mvo.getMid());
		
		Ovo.setCnt(1);
		Ovo.setMid(Mvo.getMid());
		
		datas = Bdao.selectAll_MEMBER(Bvo); // 내가 쓴 게시글 배열
		datas1 = Odao.selectAll_MYPAGE(Ovo); // 내가 쓴 리뷰 배열
		
		request.setAttribute("Mvo", Mvo);
		request.setAttribute("datas", datas);
		System.out.println(datas);
		request.setAttribute("datas1", datas1);
		System.out.println(datas1);
		
		forward=new ActionForward();
		forward.setPath("/adminMember.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
