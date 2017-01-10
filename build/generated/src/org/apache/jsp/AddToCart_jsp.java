package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import cart.Cart;
import user.User;
import database.Database;

public final class AddToCart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n");
      out.write("    <title>Words paradise</title>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap -->\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n");
      out.write("    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n");
      out.write("    <!--[if lt IE 9]>\n");
      out.write("      <script src=\"js/html5shiv.min.js\"></script>\n");
      out.write("      <script js/respond.min.js\"></script>\n");
      out.write("    <![endif]-->\n");
      out.write("    \n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("    ");
      cart.Cart cart = null;
      synchronized (session) {
        cart = (cart.Cart) _jspx_page_context.getAttribute("cart", PageContext.SESSION_SCOPE);
        if (cart == null){
          cart = new cart.Cart();
          _jspx_page_context.setAttribute("cart", cart, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\n");
      out.write("         ");

        if (session.getAttribute("user") == null ){
            
        
            
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "WEB-INF/jsp/index.jsp", out, false);
      out.write("\n");
      out.write("        ");

        }else {
            
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/AfterLoginHeader.jsp", out, false);
      out.write("\n");
      out.write("        ");

        }
        
      out.write("\n");
      out.write("        ");

            User user=(User)session.getAttribute("user");
            String email=user.getUserEmail();
            if(session.getAttribute("user")==null)
            {
            
      out.write("\n");
      out.write("            <script>\n");
      out.write("$(document).ready(function(){\n");
      out.write("$('#modal-1').modal('show');\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("              <div class=\"modal fade\" id=\"modal-1\">\n");
      out.write("  <div class=\"modal-dialog\">\n");
      out.write("    <div class=\"modal-content\">\n");
      out.write("      <div class=\"modal-header\">\n");
      out.write("        <button type=\"button\"  class=\"close\" data-dismiss=\"modal\">\n");
      out.write("          &times;\n");
      out.write("        </button>\n");
      out.write("\n");
      out.write("        <div class=\"tabbable\"> <!-- Only required for left/right tabs -->\n");
      out.write("        <ul class=\"nav nav-tabs\">\n");
      out.write("        <li class=\"active\"><a href=\"#tab1\" data-toggle=\"tab\">Login</a></li>\n");
      out.write("        <li><a href=\"#tab2\" data-toggle=\"tab\">Register</a></li>\n");
      out.write("        </ul>\n");
      out.write("            <hr>\n");
      out.write("        <div class=\"tab-content\">\n");
      out.write("        <div class=\"tab-pane active\" id=\"tab1\">\n");
      out.write("           \n");
      out.write("            <form class=\"form-horizontal\" action=\"Signin\" method=\"post\" id=\"login\">\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <label for=\"inputEmail3\" class=\"col-sm-2 control-label\">Email</label>\n");
      out.write("    <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"email\" name=\"email\" class=\"form-control\" id=\"inputEmail3\" placeholder=\"Email\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <label for=\"inputPassword3\" class=\"col-sm-2 control-label\">Password</label>\n");
      out.write("    <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"password\" name=\"password\" class=\"form-control\" id=\"inputPassword3\" placeholder=\"Password\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <div class=\"col-sm-offset-2 col-sm-10\">\n");
      out.write("      <div class=\"checkbox\">\n");
      out.write("        <label>\n");
      out.write("          <input type=\"checkbox\"> Remember me\n");
      out.write("        </label>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <div class=\"col-sm-offset-2 col-sm-10\">\n");
      out.write("      <button type=\"submit\" class=\"btn btn-primary\">Sign in</button>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</form>\n");
      out.write("            \n");
      out.write("           \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        <div class=\"tab-pane\" id=\"tab2\">\n");
      out.write("        \t\n");
      out.write("            <form class=\"form-horizontal\" action=\"Register\" method=\"post\">\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <label for=\"inputEmail3\" class=\"col-sm-2 control-label\">Email</label>\n");
      out.write("    <div class=\"col-sm-10\">\n");
      out.write("      <input type=\"email\" name=\"email\" class=\"form-control\" id=\"inputEmail3\" placeholder=\"Email\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <label for=\"inputPassword3\"  class=\"col-sm-2 control-label\">Password</label>\n");
      out.write("    <div class=\"col-sm-10\">\n");
      out.write("      <input type=\"password\" name=\"password\" class=\"form-control\" id=\"inputPassword3\" placeholder=\"Password\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("                \n");
      out.write("                <div class=\"form-group\">\n");
      out.write("    <label for=\"inputPassword3\" class=\"col-sm-2 control-label\">Confirm Password</label>\n");
      out.write("    <div class=\"col-sm-10\">\n");
      out.write("        <input type=\"password\" name=\"confirmpassword\" class=\"form-control\" id=\"inputPassword3\" placeholder=\"Password\">\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("                \n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <div class=\"col-sm-offset-2 col-sm-10\">\n");
      out.write("      <button type=\"submit\" class=\"btn btn-primary\">Register</button>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</form>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("   </div>\n");
      out.write("          \n");
      out.write("          \n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("        </div>      \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("           \n");
      out.write("            ");
}else
            {
            
      out.write("\n");
      out.write("            <br><br><br><br>\n");
      out.write("            <div class=\"container\">\n");
      out.write("            <div class=\"panel panel-primary\">\n");
      out.write("  <div class=\"panel-heading\">\n");
      out.write("    <h1 class=\"panel-title\">My Cart</h1>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"panel-body\">\n");
      out.write(" \n");
      out.write("            \n");
      out.write("            ");

            String product_id=request.getParameter("id");
            int id=Integer.parseInt(product_id);
            if (request.getParameter("id") == null) {
             response.sendRedirect("viewProduct_.jsp");
            }
            else
            {
                boolean b=cart.addProduct(id,email);  
                if(b==true)
                {
      out.write("\n");
      out.write("                   \n");
      out.write("                \n");
      out.write("                ");
 
                Database db=(Database)getServletContext().getAttribute("db");
                Connection con=db.getCon();
                PreparedStatement pst=con.prepareStatement("select * from cart");
                ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                
                
      out.write("\n");
      out.write("                \n");
      out.write("                <div class=\"container\">\n");
      out.write("                    \n");
      out.write("                    <h1>email:");
      out.print(rs.getString("email"));
      out.write("</h1>\n");
      out.write("                    <h1>email:");
      out.print(rs.getInt("product_id"));
      out.write("</h1>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                ");
}
                                  
                }
                    
                }
            }
            
      out.write("\n");
      out.write("            \n");
      out.write("           \n");
      out.write("      \n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("            </div>\n");
      out.write("    \n");
      out.write("    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("    <!-- Include all compiled plugins (below), or include individual files as needed -->\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("  </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
