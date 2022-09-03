package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

public class UpdateMAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      ActionForward forward = null;
      MemberVO vo = new MemberVO();
      MemberDAO dao = new MemberDAO();
            
      HttpSession session=request.getSession();
      MemberVO mvo = (MemberVO)session.getAttribute("member");
      
      vo.setMid(mvo.getMid()); // 현재 접속한 멤버 id
      vo.setMpw(request.getParameter("mpw")); // 수정할 비밀번호
      vo.setNickname(request.getParameter("nickname")); // 수정할 닉네임
      
      if(request.getParameter("nickname")!=null) {
         if(dao.update_MY(vo)) { // 멤버 정보 수정
            
            forward = new ActionForward();
            forward.setPath("main.do");
            forward.setRedirect(true);
         }
         else {
            throw new Exception("updateMY 오류");
         }
         
         return forward;
      }
      else {
         if(dao.update_MPW(vo)) { // 멤버 정보 수정
            session.invalidate();
            forward = new ActionForward();
            forward.setPath("main.do");
            forward.setRedirect(true);
         }
         else {
            throw new Exception("updateMPW 오류");
         }
         
         return forward;
         
      }
      
      
   }

}

/*
      else if(action.equals("memberUpdate")){
         if(mDAO.update(mVO)){
            session.invalidate(); //             ü      ϱ 
            // session.removeAttribute("member");           Ÿ   Ͽ             
            response.sendRedirect("login.jsp");
         }
         else {
            throw new Exception("memberUpdate     ");
         }
      }
*/