package fav;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil;

public class FavDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectOne ="SELECT * FROM FAV WHERE MID=? AND BID=?";
	final String sql_insert ="INSERT INTO FAV(FID,MID,BID) VALUES((SELECT NVL(MAX(FID),0)+1 FROM FAV),?,?)";
	final String sql_delete="DELETE FROM FAV WHERE FID=?";
	final String sql_update="UPDATE FAV SET FAV=? WHERE MID=? AND BID=?";
	
	public FavVO selectOne(FavVO fvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setString(1, fvo.getMid());
			pstmt.setInt(2, fvo.getBid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				FavVO data=new FavVO();
				data.setFid(rs.getInt("FID"));
				data.setMid(rs.getString("MID"));
				data.setBid(rs.getInt("BID"));
				data.setFav(rs.getInt("FAV"));
				return data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return null;
	}
	
	public boolean insert(FavVO fvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, fvo.getMid());
			pstmt.setInt(2, fvo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean delete(FavVO fvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1, fvo.getFid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}
	
	public boolean update(FavVO fvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_update);
			if(fvo.getFav()==1) {
				pstmt.setInt(1, 0);
			}
			else {
				pstmt.setInt(1, 1);
			}
			pstmt.setString(2, fvo.getMid());
			pstmt.setInt(3, fvo.getBid());
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
