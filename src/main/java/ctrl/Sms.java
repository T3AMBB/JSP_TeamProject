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
System.out.println("로그1 ["+request.getParameter("mid")+"]");
		
		MemberVO mvo=new MemberVO();
		MemberDAO mdao=new MemberDAO();
		SmsVO svo=new SmsVO();
		SmsDAO sdao = new SmsDAO();
		
		mvo.setMid(request.getParameter("mid"));
		int result=mdao.check(mvo);
		
		mvo=mdao.selectOne_MID(mvo);
		System.out.println(mvo.getMphone());
		
		if(mvo!=null) {
			svo.setPhoneNumber(mvo.getMphone());
			String randMpw = Integer.toString(sdao.sms(svo));
		
			mvo.setMpw(randMpw);
			System.out.println("로그2 ["+request.getParameter("mid")+"]");
			mvo.setMid(request.getParameter("mid"));
			System.out.println(mvo);
			mdao.update_MPW(mvo);
		}
		
		
		// 요청했던 곳으로 result값을 보낼 예정
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().write(result+" "); // 문자열을 더함으로써 String으로 변환
		
	}

}
