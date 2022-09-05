package ctrl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import set.BoardSet;
import vo.BoardVO;

public class CommunityMainAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

      BoardDAO dao = new BoardDAO();
      BoardVO vo = new BoardVO();
      ArrayList<BoardSet> datas = new ArrayList<BoardSet>();
      ArrayList<BoardSet> datas_size = new ArrayList<BoardSet>();
      String searchCondition = request.getParameter("searchCondition"); // 검색 종류 (제목, 내용, 작성자)
      String searchContent = request.getParameter("searchContent"); // 검색 내용
      String paramCnt=request.getParameter("cnt");
      int begin = 0;
      int end = 0;
      
      
      vo.setSearchContent(searchContent);
      vo.setSearchCondition(searchCondition);
      
      if(paramCnt==null || paramCnt.equals("")){
         vo.setBcnt(1);
         request.setAttribute("cnt", 1);
         paramCnt="0"; // paramCnt를 인트형으로 바꿀 때 null 에러가 발생하지 않도록 초기화
      }
      else {
         vo.setBcnt(Integer.parseInt(paramCnt));
         request.setAttribute("cnt", paramCnt);
      }
      
      datas = dao.sql_selectAll_BoardAll(vo); // 검색한 배열 or 전체 배열
      datas_size=dao.sql_selectAll_BoardAll_All(vo);
      
      if(datas_size.size()<=25) { // 5개씩 5페이지이기 때문에 배열사이즈가 25보다 작으면 0~사이즈
         begin = 0;
         end = datas_size.size();
      } else {
         if(Integer.parseInt(paramCnt)>25) { // 넘어온 Cnt가 25보다 크면 설정 ex)25~49, 50~74, 75~99
            begin = 25*(Integer.parseInt(paramCnt)/25);
            end = 24+begin;
         } else { // 배열 사이즈가 25보다 클때 기본설정
            begin = 0;
            end = 24;
         }
      }
      
      if(begin>=25) {
         int pcnt = (int) Math.floor(begin/5);
         request.setAttribute("pcnt", pcnt);
      }
      
      request.setAttribute("datas", datas);
      request.setAttribute("datas_size", datas_size);
      request.setAttribute("begin", begin);
      request.setAttribute("end", end);
      
      ActionForward forward=new ActionForward();
      forward.setPath("/community.jsp");
      forward.setRedirect(false);
      return forward;
   }

}