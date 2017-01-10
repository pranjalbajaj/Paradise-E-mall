package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pranjal
 */
public class User  extends HttpServlet{
    
    public int user_id=0;
    public String first_name;
    public String last_name;
    public String email;
    public String country;
    public String address;

    public String postal_code;
    public String contact;
   
    
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    /**
     * Get the value of city
     *
     * @return the value of city
     * 
     */
    
     public String getUserEmail (){
       System.out.println(email);
        return email;
        
    }

    /**
     * Set the value of email
     *
     * @param email new value of email
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public void setUserEmail(String email) throws SQLException, ClassNotFoundException {
        
        this.email = email;
        this.user_id=findUserId(email);
        fetchAllValues(getUserId());
    }

    public int getUserId (){
        return user_id;
    }
    
    public String getFirstname (){
        return first_name;
    }
    public void setFirstname (String first_name){
        this.first_name=first_name;
    }
    public void setLastname (String last_name){
        this.last_name=last_name;
    }
    public String getLastname (){
        return last_name;
    }
    public String getCountry() {
        return country;
    }
    public void setCountry (String country){
        this.country=country;
    }
    public String getAddress (){
        return address;
    }
    public void setAddress (String address){
       this.address=address;
    }
    public void setPostalCode (String postal_code){
       this.postal_code=postal_code;
    }
    public String getPostalCode (){
        return postal_code;
    }
    

    
    
    public String getContact() {
        return contact;
    }

    
    public void setContact(String contact) {
        this.contact=contact;
        
    }

   

    

    

     public int findUserId (String email) throws SQLException, ClassNotFoundException{
         try{
            Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/words_paradise","root","pranjal");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        pst  = con.prepareStatement("select user_id from registration where email=?");
        pst.setString(1, email);
        rs = pst.executeQuery();
        while(rs.next()){
        user_id = rs.getInt("user_id");
        }
        return user_id;
    }
    public boolean fetchAllValues (int user_id) throws SQLException, ClassNotFoundException{
        // GETS ALL THE VALUES FROM THE TABLE user-deails
        try{
            Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/words_paradise","root","pranjal");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        boolean fetched;
        pst = con.prepareStatement("select * from user_details where user_id=?");
        pst.setInt(1, user_id);
        
        rs = pst.executeQuery();
        boolean next = rs.next();
        if (next){
            first_name = rs.getString("first_name"); 
            address = rs.getString("address");
            country = rs.getString("country");
            contact = rs.getString("contact");
            last_name=rs.getString("last_name");
            postal_code=rs.getString("postal_code");
            email=rs.getString("email");
            fetched = true;
        }else {
            first_name = null;
            address = null;
            country=null;
            contact = null;
            last_name=null;
            postal_code=null;
            fetched = false;
        }
       
        return fetched;
    }

    
}
