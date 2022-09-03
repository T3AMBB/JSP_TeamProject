package ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do") // *.do 占쎌뒄筌ｏ옙占쎌뱽 占쎈땾占쎈뻬占쎈릭筌롳옙 占쎈퉸占쎈뼣 占쎈선占쎈걗占쎈�믭옙�뵠占쎈�∽옙肉� 占쎌벥占쎈퉸 FC嚥∽옙 占쎌궎野껊슢留�!!!
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
    	// 占쎌겲 FrontController fc=new FrontController(); xxx
    	// 揶쏆빘猿쒙옙�넅�몴占� 占쎈릭筌욑옙占쎈륫占쎈릭占쎈뮉占쎈쑓, 筌롫뗄苑뚳옙諭띄몴占� 占쎄텢占쎌뒠占쎈막占쎈땾占쎌뿳占쎈�占쎈뼄...?!!
    	// 占쎄퐣�뇡遺얄뵺 �뚢뫂�믭옙�뵠占쎄섐(==揶쏆빘猿쒐몴占� �꽴占썹뵳�뗫릭占쎈뮉 野껓옙) == 占쎌럲 占쎄퐣甕곤옙 == 占쎈꽦筌�節뚯뵠 占쎄퐣�뇡遺얄뵺占쎌뱽 揶쏆빘猿쒙옙�넅占쎈퉸雅뚯눊�э옙�뿳占쎈�占쎌벉!!    	
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri=request.getRequestURI();
		String cp=request.getContextPath();
		String command=uri.substring(cp.length());
		System.out.println(command);
		
		ActionForward forward = null;
		
		if(command.equals("/main.do")) {
			try {
				forward = new MainAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/novelMain.do")) {
			try {
				forward = new NovelMainAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/novelBoard.do")) {
			try {
				forward = new NovelBoardAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/community.do")) {
			try {
				forward = new CommunityMainAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/communityBoard.do")) {
			try {
				forward = new CommunityBoardAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/loginM.do")) {
			try {
				forward = new LoginMAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/logoutM.do")) {
			try {
				forward = new LogoutMAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/mypage.do")) {
			try {
				forward = new MypageAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/myreview.do")) {
			try {
				forward = new MyreviewAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/myboard.do")) {
			try {
				forward = new MyboardAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/updateM.do")) {
			try {
				forward = new UpdateMAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/updateB.do")) {
			try {
				forward = new UpdateBAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/updateO.do")) {
			try {
				forward = new UpdateOAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/updateR.do")) {
			try {
				forward = new UpdateRAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/updateRR.do")) {
			try {
				forward = new UpdateRRAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/insertM.do")) {
			try {
				forward = new InsertMAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/insertB.do")) {
			try {
				forward = new InsertBAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/insertO.do")) {
			try {
				forward = new InsertOAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/insertR.do")) {
			try {
				forward = new InsertRAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/insertRR.do")) {
			try {
				forward = new InsertRRAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/deleteM.do")) {
			try {
				forward = new DeleteMAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/deleteB.do")) {
			try {
				forward = new DeleteBAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/deleteO.do")) {
			try {
				forward = new DeleteOAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/deleteR.do")) {
			try {
				forward = new DeleteRAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/deleteRR.do")) {
			try {
				forward = new DeleteRRAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}



/*		
		if(forward==null) {
			forward= new ActionForward();
			forward.setPath("error/error.jsp");
			forward.setRedirect(false);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
		try {
			dispatcher.forward(request, response);
			// : 占쏙옙野껋옖�읂占쎌뵠筌욑옙(占쎌뵥占쎌쁽)嚥∽옙 request, response 揶쏆빘猿쒐몴占� 占쎌읈占쎈뼎占쎈릭占쎈뮉 筌롫뗄苑뚳옙諭�
			// : 占쎌젫占쎈선亦낅슣�뱽 占쎄퐜野꺿뫁夷� -> 占쎄깻占쎌뵬占쎌뵠占쎈섧占쎈뱜揶쏉옙 占쎌벓占쎈뼗占쎌뱽 占쎌넇占쎌뵥占쎈막 占쎈땾 占쎌뿳占쎌벉
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
*/
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}
			else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();;
		out.println("<script>alert('占쎌뒄筌ｏ옙筌ｌ꼶�봺占쎈뼄占쎈솭');history.go(-1);</script>");
				
	}
}
