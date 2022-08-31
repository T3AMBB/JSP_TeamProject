package ctrl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fav.FavDAO;
import fav.FavVO;
import member.MemberDAO;
import member.MemberVO;


@WebServlet("/fav")
public class Fav extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Fav() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); // get 방식 요청이 들어오면 post로 보내줌
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavDAO dao = new FavDAO();
		FavVO vo = new FavVO();
		int result = 0;
		
		vo.setMid(request.getParameter("mid"));
		vo.setBid(Integer.parseInt(request.getParameter("bid")));

		vo = dao.selectOne(vo);
		if(vo != null) {
			dao.update(vo);
			System.out.println("로그: 좋아요 update");
			if(vo.getFav()==1) { // fav 1이 업데이트 되어 0이 됨
				result = 0;
			}
			else {
				result = 1;
			}
		}
		else {
			FavVO vo2 = new FavVO();
			vo2.setMid(request.getParameter("mid"));
			vo2.setBid(Integer.parseInt(request.getParameter("bid")));
			System.out.println("로그: 좋아요 insert");
			dao.insert(vo2);
			result = 1;
		}
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