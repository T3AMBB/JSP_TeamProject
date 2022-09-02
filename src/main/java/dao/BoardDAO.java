package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import set.BoardSet;
import set.ReplySet;
import util.JDBCUtil;
import vo.BoardVO;
import vo.ReplyVO;
import vo.Reply_reVO;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll_BTITLE="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM BOARD B JOIN MEMBER M ON B.MID=M.MID WHERE B.BTITLE LIKE '%'||?||'%' ORDER BY BID DESC)A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?";
	final String sql_selectAll_BCONTENT="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM BOARD B JOIN MEMBER M ON B.MID=M.MID WHERE B.BCONTENT LIKE '%'||?||'%' ORDER BY BID DESC)A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?";
	final String sql_selectAll_WRITER="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM BOARD B JOIN MEMBER M ON B.MID=M.MID WHERE B.MID LIKE '%'||?||'%' ORDER BY BID DESC)A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?";
	final String sql_selectAll_BoardAll="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM BOARD B JOIN MEMBER M ON B.MID=M.MID ORDER BY BID DESC) A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?";
	// 게시글 검색
	// 게시글 전체 뽑는 것
	//========================================================================================================================================================

	final String sql_selectOne_BoardOne="SELECT * FROM BOARD LEFT OUTER JOIN MEMBER ON BOARD.MID=MEMBER.MID WHERE BOARD.BID=?";
	// 게시글 하나만 뽑는 것
	//========================================================================================================================================================

	final String sql_selectAll_BoardAll_ADMIN="SELECT * FROM BOARD LEFT OUTER JOIN MEMBER ON BOARD.MID=MEMBER.MID ORDER BY BID DESC WHERE MEMBER.MID=?";
	// 게시글 전체 뽑는 것 = 내가 쓴 게시글 
	//========================================================================================================================================================

	final String sql_selectOne_ReplyOne="SELECT * FROM REPLY LEFT OUTER JOIN MEMBER ON REPLY.MID=MEMBER.MID WHRER REPLY.RID=?";
	// 댓글 하나만 뽑는 것
	final String sql_selectAll_ReplyAll="SELECT * FROM REPLY LEFT OUTER JOIN MEMBER ON REPLY.MID=MEMBER.MID WHERE REPLY.MID=? ORDER BY RID DESC ";
	// 댓글 전체 뽑는 것 = 내가 쓴 댓글 전체
	final String sql_selectAll_ReplyAll_Board="SELECT * FROM REPLY LEFT OUTER JOIN BOARD ON REPLY.BID=BOARD.BID WHERE REPLY.BID=? ORDER BY RID DESC ";
	// 해당 게시글의 댓글만 뽑는 것 = 게시글에 맞는 댓글
	final String sql_selectAll_Reply_re="SELECT * FROM REPLY_RE LEFT OUTER JOIN REPLY ON REPLY_RE.RID=REPLY.RID WHERE REPLY_RE.RID=? ORDER BY RRID DESC ";
	// 대댓글 전체 출력 = 해당 댓글과 맞는 대댓글  

	final String sql_insert_B="INSERT INTO BOARD VALUES((SELECT NVL(MAX(BID),1000)+1 FROM BOARD),?,?,TO_DATE(sysdate,'yyyy.mm.dd hh24:mi'),?)";
	final String sql_update_B="UPDATE BOARD SET TITLE=?,CONTENT=? WHERE BID=?";
	final String sql_delete_B="DELETE FROM BOARD WHERE BID=?";

	//========================================================================================================================================================

	final String sql_selectAll_REPORT="SELECT A.BID, A.CNT, B.MID, B.BTITLE FROM (SELECT L.BID, COUNT(L.REPORT) AS CNT FROM BOARD B JOIN LLIKE L "
			+ "ON B.BID=L.BID WHERE L.REPORT=1 GROUP BY L.BID ORDER BY CNT DESC) A JOIN BOARD B ON A.BID=B.BID";

	final String sql_selectAll_Lstatus="SELECT A.BID, A.CNT, B.MID, B.BTITLE FROM (SELECT L.BID, COUNT(L.LSTATUS) AS CNT FROM BOARD B JOIN LLIKE L "
			+ "ON B.BID=L.BID WHERE L.LSTATUS=1 GROUP BY L.BID ORDER BY CNT DESC) A JOIN BOARD B ON A.BID=B.BID";

	final String sql_selectOne_Lstatus="SELECT COUNT(*) AS CNT FROM BOARD B JOIN LLIKE L ON B.BID=L.BID "
			+ "WHERE L.BID=? AND L.LSTATUS=1";

	final String sql_selectOne_NLstatus="SELECT COUNT(*) AS CNT FROM BOARD B JOIN LLIKE L ON B.BID=L.BID "
			+ "WHERE L.BID=? AND L.NLSTATUS=1";

	final String sql_selectOne_Report="SELECT COUNT(*) AS CNT FROM BOARD B JOIN LLIKE L ON B.BID=L.BID "
			+ "WHERE L.BID=? AND L.REPORT=1";

	public int selectOne_cnt (BoardVO bvo){
		conn=JDBCUtil.connect();
		int cnt = 0;
		try {
			if(bvo.getCnt_l()==1) { // 해당 게시물 추천수 확인 
				pstmt=conn.prepareStatement(sql_selectOne_Lstatus);            
				pstmt.setInt(1, bvo.getBid());
			}
			if(bvo.getCnt_n()==1) {
				pstmt=conn.prepareStatement(sql_selectOne_NLstatus);            
				pstmt.setInt(1, bvo.getBid());
			}
			if(bvo.getCnt_r()==1) {
				pstmt=conn.prepareStatement(sql_selectOne_Report);            
				pstmt.setInt(1, bvo.getBid());
			}
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("CNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}      
		return cnt;
	}
	// 게시글 추천/신고 뽑는 것
	public ArrayList<BoardVO> selectAll_REPORT(BoardVO bvo){
		ArrayList<BoardVO> datas=new ArrayList<BoardVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll_REPORT);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardVO data=new BoardVO();
				data.setBid(rs.getInt("BID"));
				data.setMid(rs.getString("MID"));
				data.setBcnt(rs.getInt("CNT")); // 신고 횟수
				data.setBtitle(rs.getString("BTITLE"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}      
		return datas;
	}


	public ArrayList<BoardVO> selectAll_Lstatus (BoardVO bvo){
		ArrayList<BoardVO> datas=new ArrayList<BoardVO>();
		conn=JDBCUtil.connect();
		try {

			pstmt=conn.prepareStatement(sql_selectAll_Lstatus);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardVO data=new BoardVO();
				data.setBid(rs.getInt("BID"));
				data.setMid(rs.getString("MID"));
				data.setBcnt(rs.getInt("CNT")); // 좋아요 횟수
				data.setBtitle(rs.getString("BTITLE"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}      
		return datas;
	}


	public ArrayList<BoardVO> selectAll_MEMBER(BoardVO bvo) { // 관리자에서 사용할 전체 회원목록
		ArrayList<BoardVO> datas = new ArrayList<BoardVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_selectAll_BoardAll_ADMIN);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO data = new BoardVO();
				data.setBid(rs.getInt("BID"));
				data.setBcontent(rs.getString("BCONTENT"));
				data.setBtitle(rs.getString("BTITLT"));
				data.setBdate(rs.getString("BDATE"));
				if(rs.getString("NICKNAME")==null) {
					data.setMid("[이름없음]");
				} else {
					// WRITER대신 MNAME을 담아서 WRITER를 뽑으면 MNAME이 출력된다.
					data.setMid(rs.getString("NICKNAME"));
				}
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


	//===========게시글상세에서 사용할 selectOne
	public BoardSet sql_selectOne_BoardOne(BoardVO bvo) {
		conn=JDBCUtil.connect();
		BoardSet bs = new BoardSet();
//		System.out.println("시작로그");
		try {
			pstmt=conn.prepareStatement(sql_selectOne_BoardOne);
			pstmt.setInt(1, bvo.getBid());
			ResultSet rs=pstmt.executeQuery();
			System.out.println("로그: selectOne_BoardOne 보드 DAO");
			if(rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setBid(rs.getInt("BID"));
				boardVO.setBcontent(rs.getString("BCONTENT"));
				boardVO.setBtitle(rs.getString("BTITLE"));
				boardVO.setBdate(rs.getString("BDATE"));
				pstmt=conn.prepareStatement(sql_selectOne_Lstatus);
				pstmt.setInt(1, rs.getInt("BID"));
				ResultSet rs4=pstmt.executeQuery();
				if(rs4.next()) {
					boardVO.setCnt_l(rs4.getInt("CNT"));
				}
				else {
					boardVO.setCnt_l(0);
				}
				pstmt=conn.prepareStatement(sql_selectOne_NLstatus);
				pstmt.setInt(1, rs.getInt("BID"));
				ResultSet rs5=pstmt.executeQuery();
				if(rs5.next()) {
					boardVO.setCnt_n(rs5.getInt("CNT"));
				}
				else {
					boardVO.setCnt_n(0);
				}
				pstmt=conn.prepareStatement(sql_selectOne_Report);
				pstmt.setInt(1, rs.getInt("BID"));
				ResultSet rs6=pstmt.executeQuery();
				if(rs6.next()) {
					boardVO.setCnt_r(rs6.getInt("CNT"));
				}
				else {
					boardVO.setCnt_r(0);
				}
				if(rs.getString("NICKNAME")==null) {
					boardVO.setMid("[이름없음]");
				} else {
					// WRITER대신 MNAME을 담아서 WRITER를 뽑으면 MNAME이 출력된다.
					boardVO.setMid(rs.getString("NICKNAME"));
				}
				bs.setBoardVO(boardVO);

				ArrayList<ReplySet> replySet = new ArrayList<ReplySet>();
				pstmt=conn.prepareStatement(sql_selectAll_ReplyAll_Board);
				pstmt.setInt(1, bvo.getBid());
				ResultSet rs2 =pstmt.executeQuery();
//				System.out.println("댓글 all 로그");
				while(rs2.next()) {
//					System.out.println("replyset 로그");
					ReplySet rSet = new ReplySet();
					ReplyVO rvo = new ReplyVO();
					rvo.setRid(rs2.getInt("RID"));
					rvo.setBid(rs2.getInt("BID"));
					rvo.setRcontent(rs2.getString("RCONTENT"));
					rvo.setRdate(rs2.getString("RDATE"));
					if(rs.getString("NICKNAME")==null) {
						rvo.setMid("[이름없음]");
					} else {
						// WRITER대신 MNAME을 담아서 WRITER를 뽑으면 MNAME이 출력된다.
						rvo.setMid(rs.getString("NICKNAME"));
					}
//					System.out.println(rs2.getString("RCONTENT"));
//					System.out.println(rvo);
					rSet.setReplyVO(rvo);
					

					ArrayList<Reply_reVO> rrList=new ArrayList<Reply_reVO>();
					Reply_reVO rrvo = new Reply_reVO();
					pstmt=conn.prepareStatement(sql_selectAll_Reply_re);
					pstmt.setInt(1, rvo.getRid());
					ResultSet rs3 = pstmt.executeQuery();
					while(rs3.next()) {
						System.out.println("rrList 로그");
						rrvo.setBid(rs3.getInt("BID"));
						rrvo.setRid(rs3.getInt("RID"));
						rrvo.setRrcontent(rs3.getString("RRCONTENT"));
						rrvo.setRrdate(rs3.getString("RRDATE"));
						rrvo.setRrid(rs3.getInt("RRID"));
						if(rs.getString("NICKNAME")==null) {
							rrvo.setMid("[이름없음]");
						} else {
							// WRITER대신 MNAME을 담아서 WRITER를 뽑으면 MNAME이 출력된다.
							rrvo.setMid(rs.getString("NICKNAME"));
						}
						rrList.add(rrvo);		
					}
					rSet.setrrList(rrList);
					replySet.add(rSet);
				}
				bs.setReplySet(replySet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return bs;
	}


	public ArrayList<BoardSet> sql_selectAll_BoardAll(BoardVO bvo){
		ArrayList<BoardSet> datas = new ArrayList<BoardSet>();
		conn=JDBCUtil.connect();
//		System.out.println("시작로그");
		if(bvo.getSearchCondition() == null) {
			bvo.setSearchCondition("");
		}
		try {
			if(bvo.getSearchCondition().equals("bcontent")) {
				pstmt=conn.prepareStatement(sql_selectAll_BCONTENT);
				pstmt.setString(1, bvo.getSearchContent());
			}
			else if(bvo.getSearchCondition().equals("btitlt")) {
				pstmt=conn.prepareStatement(sql_selectAll_BTITLE);
				pstmt.setString(1, bvo.getSearchContent());
			}
			else if(bvo.getSearchCondition().equals("mid")) {
				pstmt=conn.prepareStatement(sql_selectAll_WRITER);
				pstmt.setString(1, bvo.getSearchContent());
			}
			else {
				pstmt=conn.prepareStatement(sql_selectAll_BoardAll);
				pstmt.setInt(1, bvo.getBcnt());
				pstmt.setInt(2, bvo.getBcnt());
			}
			ResultSet rs=pstmt.executeQuery();
//			System.out.println("시작한다?!");
			while(rs.next()) {
				BoardSet bs = new BoardSet();
				BoardVO boardVO = new BoardVO();
				boardVO.setBid(rs.getInt("BID"));
				boardVO.setBtitle(rs.getString("BTITLE"));
				boardVO.setBcontent(rs.getString("BCONTENT"));
				boardVO.setBdate(rs.getString("BDATE"));
				pstmt=conn.prepareStatement(sql_selectOne_Lstatus);
				pstmt.setInt(1, rs.getInt("BID"));
				ResultSet rs4=pstmt.executeQuery();
				if(rs4.next()) {
					boardVO.setCnt_l(rs4.getInt("CNT"));
				}
				else {
					boardVO.setCnt_l(0);
				}
				pstmt=conn.prepareStatement(sql_selectOne_NLstatus);
				pstmt.setInt(1, rs.getInt("BID"));
				ResultSet rs5=pstmt.executeQuery();
				if(rs5.next()) {
					boardVO.setCnt_n(rs5.getInt("CNT"));
				}
				else {
					boardVO.setCnt_n(0);
				}
				pstmt=conn.prepareStatement(sql_selectOne_Report);
				pstmt.setInt(1, rs.getInt("BID"));
				ResultSet rs6=pstmt.executeQuery();
				if(rs6.next()) {
					boardVO.setCnt_r(rs6.getInt("CNT"));
				}
				else {
					boardVO.setCnt_r(0);
				}
				if(rs.getString("NICKNAME")==null) {
					boardVO.setMid("[이름없음]");
				} else {
					// WRITER대신 MNAME을 담아서 WRITER를 뽑으면 MNAME이 출력된다.
					boardVO.setMid(rs.getString("NICKNAME"));
				}
				bs.setBoardVO(boardVO);

				ArrayList<ReplySet> replySet = new ArrayList<ReplySet>();
//				System.out.println("댓글 all로그");
				pstmt=conn.prepareStatement(sql_selectAll_ReplyAll);
				pstmt.setString(1, bvo.getMid());
				ResultSet rs2 =pstmt.executeQuery();
				while(rs2.next()) {
					ReplyVO rvo = new ReplyVO();
					ReplySet rSet = new ReplySet();
					rvo.setRid(rs2.getInt("RID"));
					rvo.setBid(rs2.getInt("BID"));
					rvo.setRcontent(rs2.getString("RCONTENT"));
					rvo.setRdate(rs2.getString("RDATE"));
					if(rs.getString("NICKNAME")==null) {
						rvo.setMid("[이름없음]");
					} else {
						// WRITER대신 MNAME을 담아서 WRITER를 뽑으면 MNAME이 출력된다.
						rvo.setMid(rs.getString("NICKNAME"));
					}
					rSet.setReplyVO(rvo);


					ArrayList<Reply_reVO> rrList=new ArrayList<Reply_reVO>();
					pstmt=conn.prepareStatement(sql_selectAll_Reply_re);
					ResultSet rs3 = pstmt.executeQuery();
					while(rs3.next()) {
						Reply_reVO rrvo = new Reply_reVO();
						rrvo.setBid(rs3.getInt("BID"));
						rrvo.setRid(rs3.getInt("RID"));
						rrvo.setRrcontent(rs3.getString("RRCONTENT"));
						rrvo.setRrdate(rs3.getString("RRDATE"));
						rrvo.setRrid(rs3.getInt("RRID"));
						if(rs.getString("NICKNAME")==null) {
							rrvo.setMid("[이름없음]");
						} else {
							// WRITER대신 MNAME을 담아서 WRITER를 뽑으면 MNAME이 출력된다.
							rrvo.setMid(rs.getString("NICKNAME"));
						}
						rrList.add(rrvo);		
					}
					rSet.setrrList(rrList);
					replySet.add(rSet);
					bs.setReplySet(replySet);

				}
				datas.add(bs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return datas;
	}


	public boolean insert_B(BoardVO bvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_insert_B);
			pstmt.setString(1, bvo.getBtitle());
			pstmt.setString(2, bvo.getBcontent());
			pstmt.setString(3, bvo.getMid());


			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}


	public boolean update_B(BoardVO bvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_update_B);
			pstmt.setString(1, bvo.getBtitle());
			pstmt.setString(2, bvo.getBcontent());
			pstmt.setInt(3,bvo.getBid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return true;
	}


	public boolean delete_B(BoardVO bvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete_B);
			pstmt.setInt(1,bvo.getBid());
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
