package ctrl;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import vo.BoardVO;
import vo.MemberVO;

/**
 * Servlet implementation class Test
 */
@WebServlet("/InsertB")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String path="D:\\JAVA\\java4\\resource\\project1\\src\\main\\webapp\\images"; 
		int maxSize=100000000; // 바이트 단위
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		/*
		String mid=request.getParameter("mid");
		String fileName=request.getParameter("fileName");
		System.out.println("로그1 ["+mid+"]");
		System.out.println("로그2 ["+fileName+"]");
		*/
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		HttpSession session=request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		vo.setMid(mvo.getMid()); // 현재 접속한 멤버 id
		System.out.println(vo.getMid());
		vo.setBtitle(mr.getParameter("btitle")); // 입력받은 게시글 제목
		System.out.println(mr.getParameter("btitle"));
		vo.setBcontent(mr.getParameter("bcontent")); // 입력한 게시글 내용
		System.out.println(mr.getParameter("bcontent"));
	
		Enumeration<?> file=mr.getFileNames();
		if(file.hasMoreElements()) {
			String paramName=(String)file.nextElement();
			String serverFileName=mr.getFilesystemName(paramName);
			System.out.println("서버에 업로드된 파일명 ["+serverFileName+"]");
			vo.setBimg(serverFileName); // 입력한 게시글 내용
//			System.out.println(mr.getParameter("bimg"));
		}
		
		if(dao.insert_B(vo)) { // 게시글 등록
			response.sendRedirect("community.do");
		}
		else {
			
		}
					
		
	}
}

	


