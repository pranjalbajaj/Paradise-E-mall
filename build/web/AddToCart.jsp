<!DOCTYPE html>
<%@page import="java.sql.*, cart.Cart, user.User, database.Database " %>
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
   
      <jsp:useBean id="cart" scope="session" class="cart.Cart"></jsp:useBean>
       <%
        if (session.getAttribute("user") == null ){
            
        
            %>
            <jsp:include page="WEB-INF/jsp/index.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="/AfterLoginHeader.jsp"></jsp:include>
        <%
        }
        %>
      
        <%
            User user=(User)session.getAttribute("user");
            if(session.getAttribute("user")==null)
            {
            %>


<script>
$(document).ready(function(){
$('#modal-1').modal('show');
});
</script>
              <div class="modal fade" id="modal-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button"  class="close" data-dismiss="modal">
          &times;
        </button>

        <div class="tabbable"> <!-- Only required for left/right tabs -->
        <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">Login</a></li>
        <li><a href="#tab2" data-toggle="tab">Register</a></li>
        </ul>
            <hr>
        <div class="tab-content">
        <div class="tab-pane active" id="tab1">
           
            <form class="form-horizontal" action="Signin" method="post" id="login">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
        <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
        <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Sign in</button>
    </div>
  </div>
</form>
            
           
            
        </div>
        <div class="tab-pane" id="tab2">
        	
            <form class="form-horizontal" action="Register" method="post">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3"  class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
                
                <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Confirm Password</label>
    <div class="col-sm-10">
        <input type="password" name="confirmpassword" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
                
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Register</button>
    </div>
  </div>
</form>
            
        </div>
        </div>
        </div>
   </div>
          
          
    </div>
  </div>
        </div>    


 <%}else
            { 
                int id=0;
                String product_id=request.getParameter("id");
            id=Integer.parseInt(product_id);
            if (request.getParameter("id") == null) {
             response.sendRedirect("viewProduct_.jsp");
            }
            else
            {   
                Database db=(Database)getServletContext().getAttribute("db");
                Connection con=db.getCon();
                PreparedStatement pst=con.prepareStatement("select product_id from cart where email=?");
                pst.setString(1,user.getUserEmail());
                ResultSet rs=pst.executeQuery();
                while(rs.next())
                {
                    if(id==rs.getInt("product_id"))
                    {
                        id=0;
                        response.sendRedirect("ShowCart.jsp");
                    } 
                }
                if(id!=0){
                    
                boolean b=cart.addProduct(id,user);  
                if(b==true)
                {
                   response.sendRedirect("ShowCart.jsp");                                                   
                }   
                }
}
}
%>


      
        
        
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>