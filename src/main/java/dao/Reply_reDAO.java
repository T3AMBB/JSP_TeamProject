package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
import vo.Reply_reVO;

public class Reply_reDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne_RR="SELECT * FROM REPLY_RE LEFT OUTER JOIN MEMBER ON REPLY_RE.MID=MEMBER.MID WHERE REPLY_RE.RRID=?";
	final String sql_selectAll_RR="SELECT * FROM REPLY_RE LEFT OUTER JOIN MEMBER ON REPLY_RE.MID=MEMBER.MID ORDER BY REPLY_RE.RRID DESC";
	// SQL 에서 변경했던 SELECTALL을 그대로 복사하여 기존에 검색하는 SELECTALL에 추가하였다.
	
	final String sql_insert_RR="INSERT INTO REPLY_RE VALUES((SELECT NVL(MAX(RRID),4000)+1 FROM REPLY_RE),?,TO_DATE(sysdate,'yyyy.mm.dd hh24:mi'),?,?,?)";
		// INSERT INTO BOARD VALUES((서브쿼리),?,?,?)
	final String sql_update_RR="UPDATE REPLY_RE SET CONTENT=? WHERE RRID=?";
	final String sql_delete_RR="DELETE FROM REPLY_RE WHERE RRID=?";
	
	public Reply_reVO selectOne_RR(Reply_reVO rrvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne_RR);
			pstmt.setInt(1, rrvo.getRrid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				Reply_reVO data=new Reply_reVO();
				data.setRrid(rs.getInt("RRID"));
				data.setRrcontent(rs.getString("RRCONTENT"));
				data.setRrdate(rs.getString("RRDATE"));
				
				if(rs.getString("NICKNAME")==null) {
					data.setMid("[이름없음]");
				}else {
				data.setMid(rs.getString("NICKNAME"));
				}
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
	public ArrayList<Reply_reVO> selectAll_RR(Reply_reVO rrvo){
		ArrayList<Reply_reVO> datas=new ArrayList<Reply_reVO>();
		conn=JDBCUtil.connect();
		System.out.println("시작");
		try {
			pstmt=conn.prepareStatement(sql_selectAll_RR);
			ResultSet rs=pstmt.executeQuery();
			System.out.println("중간");

			while(rs.next()) {
				Reply_reVO data=new Reply_reVO();
				data.setRrid(rs.getInt("RRID"));
				data.setRrcontent(rs.getString("RRCONTENT"));
				data.setRrdate(rs.getString("RRDATE"));
				if(rs.getString("NICKNAME")==null) {
					data.setMid("[이름없음]");
				} else {
					// WRITER대신 MNAME을 담아서 WRITER를 뽑으면 MNAME이 출력된다.
					data.setMid(rs.getString("NICKNAME"));
				}
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		System.out.println("끝");

		return datas;
	}
	public boolean insert_RR(Reply_reVO rrvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert_RR);
			pstmt.setString(1, rrvo.getRrcontent());
			pstmt.setString(2, rrvo.getMid());
			pstmt.setInt(3, rrvo.getBid());
			pstmt.setInt(4, rrvo.getRid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update_RR(Reply_reVO rrvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update_RR);
			pstmt.setString(1, rrvo.getRrcontent());
			pstmt.setInt(2, rrvo.getRrid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete_RR(Reply_reVO rrvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete_RR);
			pstmt.setInt(1,rrvo.getRrid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}

}
