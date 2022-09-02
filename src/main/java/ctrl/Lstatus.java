package ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.LlikeDAO;
import vo.BoardVO;
import vo.LlikeVO;


@WebServlet("/Lstatus")
public class Lstatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Lstatus() {
        super();
    }


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); // get 방식 요청이 들어오면 post로 보내줌
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LlikeDAO dao = new LlikeDAO();
		LlikeVO vo = new LlikeVO();
		BoardVO bVO = new BoardVO();
		BoardDAO bDAO = new BoardDAO();
		int result = 0;
		
		vo.setMid(request.getParameter("mid")); // 추천을 누른 사용자 id
		vo.setBid(Integer.parseInt(request.getParameter("bid"))); // 추천을 눌린 게시글 번호
		
		vo = dao.selectOne(vo); // 해당 lid가 있는지 확인
		if(vo != null) { // 결과가 있다면
			if(vo.getReport()==1 && vo.getNlstatus()==0) { // 신고가 되어 있고 비추천이 안눌려 있다면 추천 업데이트
				vo.setFlag(true);
				dao.update_L(vo);
				if(vo.getLstatus()==0) {
					System.out.println("로그: 추천 +1");
				}
				else {
					System.out.println("로그: 추천 -1");
				}
			}
			else { // 신고, 비추천 둘다 안되어 있다면 삭제
				if(vo.getNlstatus()==0 && vo.getReport()==0) {
					dao.delete_L(vo);
					System.out.println("로그: 추천 delete");
				}
			}
		}
		else { // 결과가 없다면 추천 생성
			LlikeVO vo2 = new LlikeVO();
			vo2.setMid(request.getParameter("mid"));
			vo2.setBid(Integer.parseInt(request.getParameter("bid")));
			vo2.setFlag(true); // true면 추천 생성
			System.out.println(vo2);
			System.out.println("로그: 추천 insert");
			dao.insert_STATUS(vo2);
		}
		
		bVO.setBid(Integer.parseInt(request.getParameter("bid")));
		bVO.setCnt_l(1);
		result = bDAO.selectOne_cnt(bVO); // 해당 게시물의 추천수 반환
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().write(result+"");
	}
}


/*
MemberDAO dao = new MemberDAO();
MemberVO vo = new MemberVO();
vo.setMid(request.getParameter("mid")); // .jsp 파일로부터 들어온 mid값을 vo에 세팅 
int result = dao.checkId(vo); // 입력받은 mid 값을 가지고 중복검사하여 결과를 result에 담음

response.setContentType("application/x-json; charset=UTF-8");
response.getWriter().write(result+""); // 수행결과를 result라는 이름으로 반환
*/