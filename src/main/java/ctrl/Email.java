package ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmailDAO;
import dao.MemberDAO;
import vo.EmailVO;
import vo.MemberVO;

/**
 * Servlet implementation class Email
 */
@WebServlet("/Email")
public class Email extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Email() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      System.out.println("로그1 ["+request.getParameter("mid")+"]");
	      
	      MemberVO mvo=new MemberVO();
	      MemberDAO mdao=new MemberDAO();
	      EmailVO evo = new EmailVO();
	      EmailDAO edao = new EmailDAO();
	      
	      mvo.setMid(request.getParameter("mid"));
	      mvo=mdao.selectOne_MID(mvo);
	      System.out.println(mvo);
	      
	      evo.setEmailAddress(mvo.getMemail());
	      int result = edao.email(evo);
	      System.out.println("["+result+"]");
	      
		// 요청했던 곳으로 result값을 보낼 예정
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().write(result+" "); // 문자열을 더함으로써 String으로 변환
	}

}
