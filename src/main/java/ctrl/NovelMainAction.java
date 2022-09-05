package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NovelDAO;
import vo.NovelVO;

public class NovelMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		ArrayList<NovelVO> datas;
		ArrayList<NovelVO> datas_size;
		NovelDAO dao=new NovelDAO();
		NovelVO vo=new NovelVO();
		String searchCondition = request.getParameter("searchCondition"); // 검색 조건 (제목, 작가, 장르)
		String searchContent = request.getParameter("searchContent"); // 검색 내용
		String paramCnt=request.getParameter("cnt");
	    int begin = 0;
	    int end = 0;
		
		vo.setSearchCondition(searchCondition);
		vo.setSearchContent(searchContent);
		
		if(paramCnt==null || paramCnt.equals("")){
			vo.setNcnt(1);
			request.setAttribute("cnt", 1);
	        paramCnt="0"; // paramCnt를 인트형으로 바꿀 때 null 에러가 발생하지 않도록 초기화
		}
		else {
			vo.setNcnt(Integer.parseInt(paramCnt));
			request.setAttribute("cnt", paramCnt);

		}
				
		datas=dao.selectAll_N(vo); // 검색한 소설 or 전체 소설
		datas_size=dao.selectAll_N_All(vo);
		
		if(datas_size.size()<=100) { // 5개씩 5페이지이기 때문에 배열사이즈가 25보다 작으면 0~사이즈
	         begin = 0;
	         end = datas_size.size();
	      } else {
	         if(Integer.parseInt(paramCnt)>25) { // 넘어온 Cnt가 25보다 크면 설정 ex)25~49, 50~74, 75~99
	            begin = 100*(Integer.parseInt(paramCnt)/100);
	            end = 99+begin;
	         } else { // 배열 사이즈가 25보다 클때 기본설정
	            begin = 0;
	            end = 99;
	         }
	      }
	      
	      if(begin>=25) {
	         int pcnt = (int) Math.floor(begin/5);
	         request.setAttribute("pcnt", pcnt);
	      }
		System.out.println(datas_size.size());
		request.setAttribute("datas", datas);
		request.setAttribute("datas_size", datas_size);
	    request.setAttribute("begin", begin);
	    request.setAttribute("end", end);
	    request.setAttribute("searchContent", searchContent);
	    request.setAttribute("searchCondition", searchCondition);
		
		ActionForward forward=new ActionForward();
		forward.setPath("/novelMain.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
