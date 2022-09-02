package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
import vo.MemberVO;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne_LOGIN="SELECT * FROM MEMBER WHERE MID=? AND MPW=?"; 
	// 로그인 로직
	final String sql_selectOne_MID="SELECT * FROM MEMBER WHERE MID=?"; 
	// 마이페이지 // 비밀번호 찾기
	final String sql_selectAll_MEMBER="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM MEMBER ORDER BY MID DESC) A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?"; // 관리자에서 필요
	
	final String sql_selectAll_MEMBER_COUNT="SELECT COUNT(*) AS CNT FROM MEMBER";
	
	final String sql_insert_M="INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?)";
	// 회원가입
	final String sql_update_MY="UPDATE MEMBER SET MPW=?, NICKNAME=? WHERE MID=?"; 
	// 회원정보수정
	final String sql_update_MPW="UPDATE MEMBER SET MPW=? WHERE MID=?"; 
	// 비밀번호 수정
	final String sql_update_ADMIN="UPDATE MEMBER SET ROLE=? WHERE MID=?"; 
	// 멤버의 계정권한 업데이트
	final String sql_delete_M="DELETE FROM MEMBER WHERE MID=? AND MPW=?";
	// 회원탈퇴
	final String sql_check="SELECT * FROM MEMBER WHERE MID=?"; 
	// 아이디 중복검사
	
	public MemberVO selectAll_MEMBER_COUNT (MemberVO bvo){
		MemberVO data=new MemberVO();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll_MEMBER_COUNT);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				data.setCnt(rs.getInt("CNT")); // 전체 게시글 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}      
		return data;
	}

	public boolean update_MPW(MemberVO mvo) { //회원비밀번호 수정
	      conn = JDBCUtil.connect();
	      try {
	         pstmt = conn.prepareStatement(sql_update_MPW); 
	         pstmt.setString(1, mvo.getMpw());
	     //   pstmt.setString(2, mvo.getMid());
	         int res = pstmt.executeUpdate();
	         if (res == 0) {
	            System.out.println("로그 : update_MPW 실패");
	            return false;
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return false;
	      } finally {
	         JDBCUtil.disconnect(pstmt, conn);
	      }
	      return true;
	   }


	public boolean insert_M(MemberVO mvo) { //회원가입
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_insert_M);
			pstmt.setString(1, mvo.getMid()); 
			pstmt.setString(2, mvo.getMpw()); 
			pstmt.setString(3, mvo.getMname());
			pstmt.setString(4, mvo.getNickname());
			pstmt.setString(5, mvo.getMphone());
			pstmt.setString(6, mvo.getMemail());
			pstmt.setString(7, "member");
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn); 
		}
		return true;

	}

	public boolean update_MY(MemberVO mvo) { //회원정보수정
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_update_MY); 
			pstmt.setString(1, mvo.getMpw());
			pstmt.setString(2, mvo.getNickname());
			pstmt.setString(3, mvo.getMid());
			int res = pstmt.executeUpdate();
			if (res == 0) {
				System.out.println("로그 : update 실패");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update_ADMIN(MemberVO mvo) { //회원정보수정
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_update_ADMIN); 
			pstmt.setString(1, mvo.getRole());
			pstmt.setString(2, mvo.getMid());
			int res = pstmt.executeUpdate();
			if (res == 0) {
				System.out.println("로그 : update 실패");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	public boolean delete_M(MemberVO mvo) { //회원탈퇴
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_delete_M);
			pstmt.setString(1, mvo.getMid());
			pstmt.setString(2, mvo.getMpw());
			int res = pstmt.executeUpdate();
			if (res == 0) {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	public MemberVO selectOne_MID(MemberVO mvo) { //마이페이지/ 비밀번호 찾기에 사용
		conn = JDBCUtil.connect();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql_selectOne_MID);
			pstmt.setString(1, mvo.getMid());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				MemberVO data = new MemberVO();
				data.setMid(rs.getString("MID"));
				data.setMpw(rs.getString("MPW"));
				data.setMname(rs.getString("MNAME"));
				data.setNickname(rs.getString("NICKNAME"));
				data.setMphone(rs.getString("MPHONE"));
				data.setMemail(rs.getString("MEMAIL"));
				data.setRole(rs.getString("ROLE"));
				return data;
			} else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JDBCUtil.disconnect(pstmt, conn);
		}
	}
	
	public MemberVO selectOne_LOGIN(MemberVO mvo) { //로그인에 사용
		conn = JDBCUtil.connect();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql_selectOne_LOGIN);
			pstmt.setString(1, mvo.getMid());
			pstmt.setString(2, mvo.getMpw());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				MemberVO data = new MemberVO();
				data.setMid(rs.getString("MID"));
				data.setMpw(rs.getString("MPW"));
				data.setMname(rs.getString("MNAME"));
				data.setNickname(rs.getString("NICKNAME"));
				data.setMphone(rs.getString("MPHONE"));
				data.setMemail(rs.getString("MEMAIL"));
				data.setRole(rs.getString("ROLE"));
				return data;
			} else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JDBCUtil.disconnect(pstmt, conn);
		}
	}

	public ArrayList<MemberVO> selectAll_MEMBER(MemberVO mvo) { // 관리자에서 사용할 전체 회원목록
		ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_selectAll_MEMBER);
			pstmt.setInt(1, mvo.getCnt());
			pstmt.setInt(2, mvo.getCnt());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO data = new MemberVO();
				data.setMid(rs.getString("MID"));
				data.setMpw(rs.getString("MPW"));
				data.setMname(rs.getString("MNAME"));
				data.setNickname(rs.getString("NICKNAME"));
				data.setMphone(rs.getString("MPHONE"));
				data.setMemail(rs.getString("MEMAIL"));
				data.setRole(rs.getString("ROLE"));
				datas.add(data);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return datas;
	}
	   public int check(MemberVO mvo) {
	         conn=JDBCUtil.connect();
	         System.out.println("로그DAO 중복검사");
	         try {
	            pstmt=conn.prepareStatement(sql_check);
	            pstmt.setString(1, mvo.getMid());
	            ResultSet rs=pstmt.executeQuery();
	            if(rs.next()) { // 아이디가 있니?
	               return 0; // 아이디 중복 발생...
	            }
	         } catch (SQLException e) {
	            e.printStackTrace();
	            return -1;
	         } finally {
	            JDBCUtil.disconnect(pstmt, conn);
	         }
	         return 1; // 아이디 중복 아님!
	   }


}
