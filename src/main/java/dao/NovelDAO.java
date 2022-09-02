package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
import vo.NovelVO;

public class NovelDAO {
   Connection conn;
   PreparedStatement pstmt;
   final String sql_selectAll_NT="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM NOVEL WHERE NTITLE LIKE '%'||?||'%' ORDER BY NID ASC) A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?";
   final String sql_selectAll_NG="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM NOVEL WHERE NGENRE LIKE '%'||?||'%'  ORDER BY NID ASC) A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?";
   final String sql_selectAll_NW="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM NOVEL WHERE NWRITER LIKE '%'||?||'%' ORDER BY NID ASC) A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?";
   final String sql_selectAll_N="SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM(SELECT * FROM NOVEL ORDER BY NID ASC) A WHERE ROWNUM < = ?+19)WHERE RNUM  > = ?";
   // 검색기능 추가로 selectAll을 3개로 나누었다.
   
	final String sql_selectAll_NOVEL_COUNT="SELECT COUNT(*) AS CNT FROM NOVEL";


   final String sql_selectAll_AVG="SELECT NID, AVG(OSTAR) AS AVG FROM OPINION WHERE NID = ? GROUP BY NID";
   final String sql_selectAll_AVG2="SELECT NID, AVG(OSTAR) AS AVG FROM OPINION GROUP BY NID";
   // 각 소설의 별점 평균뽑는 selectAll

   final String sql_selectAll="SELECT * FROM NOVEL"; 
   final String sql_selectAll_MAIN_NT="SELECT * FROM NOVEL WHERE NTITLE LIKE '%'||?||'%' ORDER BY NID ASC";
   final String sql_selectAll_MAIN_NG="SELECT * FROM NOVEL WHERE NGENRE LIKE '%'||?||'%'  ORDER BY NID ASC";
   final String sql_selectAll_MAIN_NW="SELECT * FROM NOVEL WHERE NWRITER LIKE '%'||?||'%' ORDER BY NID ASC";
   // 메인페이지에서 사용할 selectAll
   final String sql_selectOne_N="SELECT * FROM NOVEL WHERE NID=?";
   // 소설 하나만 뽑는 selectOne
   final String sql_insert_N="INSERT INTO NOVEL VALUES((SELECT NVL(MAX(NID),0)+1 FROM NOVEL),?,?,?,?,?)";
   final String sql_sample = "SELECT COUNT(*) AS CNT FROM NOVEL";
   // 프로그램 실행 시 샘플데이터 확인 용
   
	public NovelVO selectAll_NOVEL_COUNT (NovelVO bvo){
		NovelVO data=new NovelVO();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll_NOVEL_COUNT);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				data.setNcnt(rs.getInt("CNT")); // 전체 게시글 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}      
		return data;
	}

   public ArrayList<NovelVO> selectAll(NovelVO nvo){
      ArrayList<NovelVO> datas=new ArrayList<NovelVO>();
      conn=JDBCUtil.connect();
      if(nvo.getSearchCondition() == null) {
         nvo.setSearchCondition("");
      }
      try {
         if(nvo.getSearchCondition().equals("ntitle")) {
            pstmt=conn.prepareStatement(sql_selectAll_MAIN_NT);
            pstmt.setString(1, nvo.getSearchContent());
         }
         else if(nvo.getSearchCondition().equals("ngenre")) {
            pstmt=conn.prepareStatement(sql_selectAll_MAIN_NG);
            pstmt.setString(1, nvo.getSearchContent());
         }
         else if(nvo.getSearchCondition().equals("nwriter")) {
            pstmt=conn.prepareStatement(sql_selectAll_MAIN_NW);
            pstmt.setString(1, nvo.getSearchContent());
         }
         else {
            pstmt=conn.prepareStatement(sql_selectAll);
         }
         ResultSet rs=pstmt.executeQuery();
         //               System.out.println("로그 : ");
         while(rs.next()) {
            NovelVO data=new NovelVO();
            data.setNid(rs.getInt("NID"));
            data.setNtitle(rs.getString("NTITLE"));
            data.setNcontent(rs.getString("NCONTENT"));
            data.setNimg(rs.getString("NIMG"));
            data.setNgenre(rs.getString("NGENRE"));
            data.setNwriter(rs.getString("NWRITER"));
            pstmt=conn.prepareStatement(sql_selectAll_AVG2);
            ResultSet rs2=pstmt.executeQuery();
            if(rs2.next()) {
               data.setAvg(rs2.getDouble("AVG"));
            }
            else {
               data.setAvg(0);
               
            }
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

   public ArrayList<NovelVO> selectAll_N(NovelVO nvo){
      ArrayList<NovelVO> datas=new ArrayList<NovelVO>();
      conn=JDBCUtil.connect();
      if(nvo.getSearchCondition() == null) {
         nvo.setSearchCondition("");
      }
      try {
         if(nvo.getSearchCondition().equals("ntitle")) {
            pstmt=conn.prepareStatement(sql_selectAll_NT);
            pstmt.setString(1, nvo.getSearchContent());
            pstmt.setInt(2,nvo.getNcnt());
            pstmt.setInt(3,nvo.getNcnt());
         }
         else if(nvo.getSearchCondition().equals("ngenre")) {
            pstmt=conn.prepareStatement(sql_selectAll_NG);
            pstmt.setString(1, nvo.getSearchContent());
            pstmt.setInt(2,nvo.getNcnt());
            pstmt.setInt(3,nvo.getNcnt());
         }
         else if(nvo.getSearchCondition().equals("nwriter")) {
            pstmt=conn.prepareStatement(sql_selectAll_NW);
            pstmt.setString(1, nvo.getSearchContent());
            pstmt.setInt(2,nvo.getNcnt());
            pstmt.setInt(3,nvo.getNcnt());
         }
         else {
            pstmt=conn.prepareStatement(sql_selectAll_N);
            pstmt.setInt(1,nvo.getNcnt());
            pstmt.setInt(2,nvo.getNcnt());
         }
         ResultSet rs=pstmt.executeQuery();
         //               System.out.println("로그 : ");
         while(rs.next()) {
            NovelVO data=new NovelVO();
            data.setNid(rs.getInt("NID"));
            data.setNtitle(rs.getString("NTITLE"));
            data.setNcontent(rs.getString("NCONTENT"));
            data.setNimg(rs.getString("NIMG"));
            data.setNgenre(rs.getString("NGENRE"));
            data.setNwriter(rs.getString("NWRITER"));
            pstmt=conn.prepareStatement(sql_selectAll_AVG);
            pstmt.setInt(1, nvo.getNid());
            ResultSet rs2=pstmt.executeQuery();
            if(rs2.next()) {
                  data.setAvg(rs2.getDouble("AVG"));
            }else {
               data.setAvg(0);
      //         System.out.println("로그 :" + data);
            }
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

   public boolean insert_N(NovelVO nvo) {
      conn = JDBCUtil.connect(); 
      try {
         //         pstmt = conn.prepareStatement(sql_selectAll_AVG);
         //          pstmt.setInt(1, vo.getNid());
         //          ResultSet rs2 = pstmt.executeQuery();

         pstmt = conn.prepareStatement(sql_insert_N);
         pstmt.setString(1, nvo.getNtitle());
         pstmt.setString(2, nvo.getNcontent());
         pstmt.setString(3, nvo.getNimg());
         pstmt.setString(4, nvo.getNgenre()); 
         pstmt.setString(5, nvo.getNwriter()); 
         //          rs2.getDouble("AVG");

         pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         return false;
      } finally {
         JDBCUtil.disconnect(pstmt, conn); 
      }
      return true;

   }

   public NovelVO selectOne_N(NovelVO nvo) {
      conn=JDBCUtil.connect();
      try {
         pstmt=conn.prepareStatement(sql_selectOne_N);
         pstmt.setInt(1, nvo.getNid());
         ResultSet rs=pstmt.executeQuery();
         if(rs.next()) {
            NovelVO data=new NovelVO();
            data.setNid(rs.getInt("NID"));
            data.setNtitle(rs.getString("NTITLE"));
            data.setNcontent(rs.getString("NCONTENT"));
            data.setNimg(rs.getString("NIMG"));
            data.setNgenre(rs.getString("NGENRE"));
            data.setNwriter(rs.getString("NWRITER"));
            pstmt=conn.prepareStatement(sql_selectAll_AVG);
            pstmt.setInt(1, nvo.getNid());
            ResultSet rs2=pstmt.executeQuery();
            if(rs2.next()) {
               data.setAvg(rs2.getDouble("AVG"));
            }
            else {
               data.setAvg(0);
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

   public boolean hasSample(NovelVO nvo) {
      conn = JDBCUtil.connect();
      try {
         pstmt = conn.prepareStatement(sql_sample);
         ResultSet rs = pstmt.executeQuery();
         rs.next();
         int cnt = rs.getInt("CNT");
         if (cnt >= 5) {
            return true;
         }
         return false;
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         return false;
      } finally {
         JDBCUtil.disconnect(pstmt, conn);
      }
   }


}