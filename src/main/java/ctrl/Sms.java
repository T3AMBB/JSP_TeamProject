package ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.SmsDAO;
import vo.MemberVO;
import vo.SmsVO;

/**
 * Servlet implementation class Sms
 */
@WebServlet("/Sms")
public class Sms extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sms() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로직
		SmsVO vo = new SmsVO();
		SmsDAO dao = new SmsDAO();

		vo.setPhoneNumber(request.getParameter("phoneNumber"));
		String randMpw = Integer.toString(dao.sms(vo));
		
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
 		
		//HttpSession session = request.getSession();
		//String mid = (String) session.getAttribute("mid");
		//mvo.setMid(mid);
		mvo.setMpw(randMpw);
		mdao.update2_M(mvo);
		
		// ****요청했던 곳(ajax)으로 result 값을 보낼 예정****
		// 보통 어노테이션을 사용하는데 어려워서 이번 경우만 응답방식으로 이용
		response.setContentType("application/x-json; charset=UTF-8"); // 이거 json파일이다 utf-8로 인코딩해!
		response.getWriter().write(""); // 문자열을 더하면서 String 문자열로 변환 
		// 스프링에선 @RB를 사용 => String으로 데이터를 변환 작업
	}

}
