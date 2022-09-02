package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
import vo.ReplyVO;

public class ReplyDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne_R="SELECT * FROM REPLY LEFT OUTER JOIN MEMBER ON REPLY.MID=MEMBER.MID WHERE REPLY.RID=?";
	final String sql_selectAll_R="SELECT * FROM REPLY LEFT OUTER JOIN MEMBER ON REPLY.MID=MEMBER.MID ORDER BY REPLY.RID DESC";
	
	final String sql_insert_R="INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),3000)+1 FROM REPLY),?,TO_DATE(sysdate,'yyyy.mm.dd hh24:mi'),?,?)";
		// INSERT INTO BOARD VALUES((서브쿼리),?,?,?)
	final String sql_update_R="UPDATE REPLY SET CONTENT=? WHERE RID=?";
	final String sql_delete_R="DELETE FROM REPLY WHERE RID=?";
	
	public ReplyVO selectOne_R(ReplyVO rvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne_R);
			pstmt.setInt(1, rvo.getBid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				ReplyVO data=new ReplyVO();
				data.setRid(rs.getInt("RID"));
				data.setRcontent(rs.getString("RCONTENT"));
				data.setRdate(rs.getString("RDATE"));
				
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
	public ArrayList<ReplyVO> selectAll_R(ReplyVO rvo){
		ArrayList<ReplyVO> datas=new ArrayList<ReplyVO>();
		conn=JDBCUtil.connect();
		System.out.println("시작");
		try {
			pstmt=conn.prepareStatement(sql_selectAll_R);
			ResultSet rs=pstmt.executeQuery();
			System.out.println("중간");

			while(rs.next()) {
				ReplyVO data=new ReplyVO();
				data.setRid(rs.getInt("RID"));
				data.setRcontent(rs.getString("RCONTENT"));
				data.setRdate(rs.getString("RDATE"));
				if(rs.getString("NICKNAME")==null) {
					data.setMid("[이름없음]");
				} else {
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
	public boolean insert_R(ReplyVO rvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert_R);
			pstmt.setString(1, rvo.getRcontent());
			pstmt.setString(2, rvo.getMid());
			pstmt.setInt(3, rvo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean update_R(ReplyVO rvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update_R);
			pstmt.setString(1, rvo.getRcontent());
			pstmt.setInt(2, rvo.getRid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	public boolean delete_R(ReplyVO rvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete_R);
			pstmt.setInt(1,rvo.getRid());
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
