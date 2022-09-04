package crawling;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dao.NovelDAO;
import vo.NovelVO;

public class Novel {
   //   public static void main(String [] args) {
   public static void sample() {
      int N = 1;
      int n = 1; // 이미지 파일 번호
      while(N<6) {
         String seriesUrl = "https://series.naver.com/novel/top100List.series?rankingTypeCode=DAILY&categoryCode=ALL&page="+N; // 크롤링하려는 페이지의 url
         Document doc = null; // Document 객체 생성
         URL url = null;   // URL 객체생성
         InputStream in = null; // InputStream 객체 생성
         OutputStream out = null; // OutputStream 객체 생성

         try {
            doc = Jsoup.connect(seriesUrl).get(); // Jsoup 클래스로 url 연결하여 정보를 doc에 담음

         } catch (IOException e) {
            e.printStackTrace();
         }

         String product = ".comic_cont > h3 > a"; // 상세페이지로 가기 위한 주소가 있는 a태그
         Elements eles1 = doc.select(product); // a태그 정보만 eles1에 담음

         Iterator<Element> itr1 = eles1.iterator(); // 상세페이지 주소가 있는 a태그 정보를 요소 별로 분리

         while(itr1.hasNext()) {

            String product2 = itr1.next().attr("href"); // 장르를 정제하기 위해 속성값 href(상세정보 페이지) 추출
            System.out.println(product2);
            String str = "https://series.naver.com/novel/detail.series?"+product2.substring(21,product2.length());
            //         System.out.println(str);
            System.out.println("로그"+product);
            String seriesUrl2 = str; // 개별 소설의 상세정보 페이지
            Document doc2 = null;

            try {
               doc2 = Jsoup.connect(seriesUrl2).get(); // 상세정보 페이지에 연결하여 정보를 담음

            } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }

            String title = ".end_head > h2"; // 상세페이지에서의 제목 정보
            Elements eles2 = doc2.select(title); // 제목 정보만 eles2에 담음


            String img = ".pic_area > img";
            Elements eles4 = doc2.select(img);

            String writer = ".info_lst > ul > li > a";
            Elements eles5 = doc2.select(writer);

            String genre = ".info_lst > ul > li > span > a";
            Elements eles6 = doc2.select(genre);


            Iterator<Element> itr2 = eles2.iterator(); // 제목 정보를 요소별로 분리
            Iterator<Element> itr4 = eles4.iterator(); // 이미지 정보를 요소별로 분리
            Iterator<Element> itr5 = eles5.iterator(); // 작가 정보를 요소별로 분리
            Iterator<Element> itr6 = eles6.iterator(); // 장르 정보를 요소별로 분리


            while(itr6.hasNext()) {
               String product3 = product2.substring(21,product2.length());
               String str1 = "https://m.series.naver.com/novel/moreDetail.series?"+product3;

               System.out.println("로그 :"+product3);
               String seriesUrl3 = str1; // 개별 소설의 상세정보 페이지
               Document doc3 = null;

               try {
                  doc3 = Jsoup.connect(seriesUrl3).get();
               } catch (IOException e1) {
                  e1.printStackTrace();
               } // 상세정보 페이지에 연결하여 정보를 담음
               String content = ".end_txt2";
               Elements eles3 = doc3.select(content);
               Iterator<Element> itr3 = eles3.iterator(); // 작가 정보를 요소별로 분리

               while(itr3.hasNext()) {
                  String title2 = itr2.next().text();
                  String img2 = itr4.next().attr("src");
                  String writer2 = itr5.next().text();
                  String genre2 = itr6.next().text();
                  String content2 = itr3.next().text();
                  try {
                     url = new URL(img2); // url 객체에 이미지 주소를 담음
                     in = url.openStream(); // in 객체에 url 정보 담음(받고싶은 데이터 연결), 열림 1
                     out = new FileOutputStream("C:\\oraclexe\\poster\\"+n+".png"); // out 객체에 저장경로(저장을 원하는 위치) 입력
                     n++;
                     while(true) {
                        int data = in.read(); // in 객체로 해당 이미지를 읽어들임

                        if(data==-1) { // 더이상 읽을것이 없으면 멈춤
                           break;
                        } 
                        out.write(data); // 읽어들인 데이터를 경로에 작성
                     }
                     System.out.println(title2);
                     System.out.println(content2);
                     System.out.println(img2);
                     System.out.println(writer2);
                     System.out.println(genre2);

                     NovelVO vo = new NovelVO();
                     NovelDAO nDAO = new NovelDAO();

                     vo.setNtitle(title2);
                     vo.setNcontent(content2);
                     vo.setNimg(img2);
                     vo.setNwriter(writer2);
                     vo.setNgenre(genre2);
                     nDAO.insert_N(vo);

                  }catch (Exception e) {
                     e.printStackTrace();
                  } finally {
                     try {
                        in.close();
                        out.close();
                     } catch (IOException e) {
                        e.printStackTrace();
                     }            
                  }               
               }
            }
         }


         N++;
      }
   }
}