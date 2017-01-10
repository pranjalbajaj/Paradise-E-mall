/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

/**
 *
 * @author pranjal
 */
import javax.servlet.http.*;
import java.sql.*;
import user.User;


public class Cart extends HttpServlet{
    Connection con;
 PreparedStatement pst;
 ResultSet rs;  
 String email;
public int cart_item_count=0;
    public boolean addProduct(int id, User user) throws SQLException
    {   
        boolean matched;
        boolean b = false;
        int product_id = 0;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/words_paradise","root","pranjal");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
         pst=con.prepareStatement("select product_id from products ");
            rs=pst.executeQuery();
        while(rs.next())
        {
            product_id=rs.getInt("product_id");
            if(product_id==id)
            {
                matched=true;
                break;
            }
        }
        if(matched=true)
        {   
           
            int a;
            pst=con.prepareStatement("insert into cart (email,product_id) values (?,?)");
            pst.setString(1,user.getUserEmail());
            pst.setInt(2,product_id);
            a=pst.executeUpdate();
            if(a!=0)
            {
                System.out.println("success cart");
                b=true;
                cart_item_count++;
            }
            else
            {
                System.out.println("faliure cart");
                b=false;
            }
            
        }
        return b;
    }
    
    
    
}
