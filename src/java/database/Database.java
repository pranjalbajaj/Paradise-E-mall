package database;
import java.sql.Connection;
import java.sql.DriverManager;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pranjal
 */
public class Database {
    
     private Connection con;
    
    public Database(String url,String uname, String pass)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
this.con=DriverManager.getConnection(url,uname,pass);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
    public Connection getCon()
    {
        return con;
    }
    
}
