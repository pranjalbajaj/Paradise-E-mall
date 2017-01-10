
import database.Database;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Web application lifecycle listener.
 *
 * @author pranjal
 */
public class DbConnectionListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        
        ServletContext sc= event.getServletContext();
   
   String url = sc.getInitParameter("URL");
   String dbname = sc.getInitParameter("dbname");
   String username = sc.getInitParameter("username");
   String password = sc.getInitParameter("password");
   Database db=new Database(url+dbname,username,password);
   sc.setAttribute("db", db);
        
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        
    }
}
