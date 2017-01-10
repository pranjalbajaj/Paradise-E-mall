/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.User;

/**
 *
 * @author pranjal
 */
public class SubmitUserDetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("user");
            String first_name=request.getParameter("first_name");
            String last_name=request.getParameter("last_name");
            String email=user.getUserEmail();
            String country=request.getParameter("country");
            String address=request.getParameter("address");
            String postal_code=request.getParameter("postal_code");
            String contact=request.getParameter("contact");
            int t=0;
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            if(user==null)
            {
                response.sendRedirect("WEB-INF/jsp/index.jsp");
            }
            else
            {   
                Database db=(Database)getServletContext().getAttribute("db");
                con=db.getCon();
                if(user.getAddress()==null)
                {
                    //insert
                    pst=con.prepareStatement("insert into user_details (user_id,first_name,last_name,email,country,address,postal_code,contact) values (?,?,?,?,?,?,?,?)");
                    pst.setInt(1,user.getUserId());
                    pst.setString(2,first_name);
                    pst.setString(3,last_name);
                    pst.setString(4,email);
                    pst.setString(5,country);
                    pst.setString(6,address);
                    pst.setString(7,postal_code);
                    pst.setString(8,contact);
                    t=pst.executeUpdate();
                    if(t!=0)
                    out.println("value added successfully");
                    else
                     out.println("value not added successfully");   
                }
                else
                {
                    pst=con.prepareStatement("update user_details set first_name=?,last_name=?,country=?,address=?,postal_code=?,contact=? where user_id=? ");
                    pst.setString(1,first_name);
                    pst.setString(2,last_name);
                    pst.setString(3,country);
                    pst.setString(4,address);
                    pst.setString(5,postal_code);
                    pst.setString(6,contact);
                    pst.setInt(7, user.getUserId());
                    t=pst.executeUpdate(); 
                    if(t!=0)
                    out.println("values updated successfully");
                    else
                     out.println("value not updated successfully"); 
                }
             
            }
           
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
