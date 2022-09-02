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


@WebServlet("/NLstatus")
public class NLstatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NLstatus() {
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
			if(vo.getReport()==1 && vo.getLstatus()==0) { // 신고가 되어 있다면 비추천 업데이트
				vo.setFlag(false);
				dao.update_L(vo);
				if(vo.getNlstatus()==0) {
					System.out.println("로그: 비추천 +1");
				}
				else {
					System.out.println("로그: 비추천 -1");
				}
			}
			else { // 신고가 안되어 있다면 해당 lid 삭제
				if(vo.getLstatus()==0 && vo.getReport()==0) {
					dao.delete_L(vo);
					System.out.println("로그: 비추천 delete");
				}
			}
		}
		else { // 결과가 없다면 비추천 생성
			LlikeVO vo2 = new LlikeVO();
			vo2.setMid(request.getParameter("mid"));
			vo2.setBid(Integer.parseInt(request.getParameter("bid")));
			vo2.setFlag(false);
			System.out.println("로그: 비추천 insert");
			dao.insert_STATUS(vo2);
		}
		
		bVO.setBid(Integer.parseInt(request.getParameter("bid")));
		bVO.setCnt_n(1);
		result = bDAO.selectOne_cnt(bVO);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().write(result+"");
	}

}
