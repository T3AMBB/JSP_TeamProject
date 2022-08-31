package ctrl;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import crawling.Novel;
import dao.NovelDAO;
import vo.NovelVO;

/**
 * Application Lifecycle Listener implementation class CrawlingStart
 *
 */
@WebListener
public class ListenerCrawlingStart implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ListenerCrawlingStart() {
        // TODO Auto-generated constructor stub
    }

   /**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    @Override
	public void contextDestroyed(ServletContextEvent sce)  {  // �넱罹� 醫낅즺 �떆 �닔�뻾
         // TODO Auto-generated method stub
    }

   /**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    @Override
	public void contextInitialized(ServletContextEvent sce)  { 
        // TODO Auto-generated method stub
          ServletContext sc= sce.getServletContext(); 

          NovelVO novel = new NovelVO();
          ArrayList<NovelVO> datas=new ArrayList<NovelVO>();
          NovelDAO nDAO = new NovelDAO();

          if(!nDAO.hasSample(novel)) { 
              Novel.sample(); 
           }
          
          System.out.println("TestListener: contextInitialized(): ");
    }
   
}