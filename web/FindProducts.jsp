<!DOCTYPE html>
<%@page import="database.Database , java.sql.*" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Words paradise</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
   
      <%
      Connection con;
      PreparedStatement pst;
      ResultSet rs;
      if(request.getParameter("search")!=null)
      {
          if(request.getParameter("search").length()>0)
          {
              Database db=(Database)getServletContext().getAttribute("db");
              con=db.getCon();
              pst=con.prepareStatement("select * from products where product_name like '%"+request.getParameter("search")+"%'");
              rs=pst.executeQuery();
              while(rs.next())
              {
           %>       
             
           <h1><%=rs.getString("product_name")%></h1>
           
         <% }
      }
}
      %>
      
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>