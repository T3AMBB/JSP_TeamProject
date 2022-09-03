package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil;
import vo.LlikeVO;

public class LlikeDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_insert_L="INSERT INTO LLIKE(LID,MID,BID,LSTATUS) VALUES((SELECT NVL(MAX(LID),0)+1 FROM LLIKE),?,?,1)";
	final String sql_insert_NL="INSERT INTO LLIKE(LID,MID,BID,NLSTATUS) VALUES((SELECT NVL(MAX(LID),0)+1 FROM LLIKE),?,?,1)";
	final String sql_insert_RE="INSERT INTO LLIKE(LID,MID,BID,REPORT) VALUES((SELECT NVL(MAX(LID),0)+1 FROM LLIKE),?,?,1)";
	// 추천/비추천, 신고를 insert로 진행 


	final String sql_updateLU="UPDATE LLIKE SET LSTATUS=LSTATUS+1 WHERE LID=?";
	final String sql_updateLD="UPDATE LLIKE SET LSTATUS=LSTATUS-1 WHERE LID=?";
	final String sql_updateNLU="UPDATE LLIKE SET NLSTATUS=NLSTATUS+1 WHERE LID=?";
	final String sql_updateNLD="UPDATE LLIKE SET NLSTATUS=NLSTATUS-1 WHERE LID=?";
	final String sql_updateREPU="UPDATE LLIKE SET REPORT=REPORT+1 WHERE LID=?";
	final String sql_updateREPD="UPDATE LLIKE SET REPORT=REPORT-1 WHERE LID=?";


	final String sql_selectOne="SELECT * FROM LLIKE WHERE BID=? AND MID=?";
	final String sql_delete_L="DELETE FROM LLIKE WHERE LID=?";
	// 삭제는 하나로 가능

	public boolean insert_STATUS(LlikeVO lvo) { // 플래그 기준으로 좋아요/싫어요 확인 후 insert 
		conn=JDBCUtil.connect();
		try {
			if(lvo.isFlag()) {
				System.out.println("로그 "+lvo);
				if(lvo.getNlstatus()==0)
					pstmt=conn.prepareStatement(sql_insert_L);
			}
			else {
				if(lvo.getLstatus()==0) {
					System.out.println("로그 "+lvo);
					pstmt=conn.prepareStatement(sql_insert_NL);
				}
			}

			pstmt.setString(1, lvo.getMid());
			pstmt.setInt(2, lvo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

	public boolean insert_RE(LlikeVO lvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert_RE);
			pstmt.setString(1, lvo.getMid());
			pstmt.setInt(2, lvo.getBid());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}


	public boolean update_L(LlikeVO lvo) {
		conn=JDBCUtil.connect();
		try {
			if(lvo.isFlag()) {
				if(lvo.getLstatus()==1 && lvo.getNlstatus()==0) {
					pstmt=conn.prepareStatement(sql_updateLD);
					pstmt.setInt(1, lvo.getLid());
					pstmt.executeUpdate();
					System.out.println("dao 추천 -1");
				}
				else if(lvo.getLstatus()==0 && lvo.getNlstatus()==0) {
					pstmt=conn.prepareStatement(sql_updateLU);
					pstmt.setInt(1, lvo.getLid());
					pstmt.executeUpdate();
					System.out.println("dao 추천 +1");
				}
			} else {
				if(lvo.getNlstatus()==1 && lvo.getLstatus()==0) {
					pstmt=conn.prepareStatement(sql_updateNLD);
					pstmt.setInt(1, lvo.getLid());
					pstmt.executeUpdate();
					System.out.println("dao 비추천 -1");
				}
				else if(lvo.getNlstatus()==0 && lvo.getLstatus()==0) {
					pstmt=conn.prepareStatement(sql_updateNLU);
					pstmt.setInt(1, lvo.getLid());
					pstmt.executeUpdate();
					System.out.println("dao 비추천 +1");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update_R(LlikeVO lvo) {
		conn=JDBCUtil.connect();
		System.out.println(lvo);
		try {
			if(lvo.getReport()==1) {
				pstmt=conn.prepareStatement(sql_updateREPD);
				pstmt.setInt(1, lvo.getLid());
				pstmt.executeUpdate();
			}
			else if(lvo.getReport()==0) {
				pstmt=conn.prepareStatement(sql_updateREPU);
				pstmt.setInt(1, lvo.getLid());
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public LlikeVO selectOne(LlikeVO lvo) { //로그인
		conn = JDBCUtil.connect();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql_selectOne);
			pstmt.setInt(1, lvo.getBid());
			pstmt.setString(2, lvo.getMid());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				LlikeVO data = new LlikeVO();
				data.setLid(rs.getInt("LID"));
				data.setMid(rs.getString("MID"));
				data.setBid(rs.getInt("BID"));
				data.setLstatus(rs.getInt("LSTATUS"));
				data.setNlstatus(rs.getInt("NLSTATUS"));
				data.setReport(rs.getInt("REPORT"));
				return data;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}      
		return null;
	}

	public boolean delete_L(LlikeVO lvo) { //회원탈퇴
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_delete_L);
			pstmt.setInt(1, lvo.getLid());
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
}