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
   
            

        <%
        if (session.getAttribute("user") == null ){
            
        
            %>
            <jsp:include page="/BeforeLoginHeader.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="/AfterLoginHeader.jsp"></jsp:include>
        <%
        }
        %>
         <%
            User user=(User)session.getAttribute("user");
            int item_count=0;
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
            %>
            <br><br><br><br>
            <div class="container">
            <div class="row">
            <div class="col-md-12 col-xs-12">
            <div class="panel panel-info">
            <div class="panel-heading">
            <div class="panel-title">
            <div class="row">
            <div class="col-md-6">
            <h4><span class="glyphicon glyphicon-shopping-cart"></span>My Cart</h4>
            </div>
            <div class="col-md-6">
            <a href="index.jsp" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-share-alt"></span> Continue Shopping</a>
            </div>
            </div>
            </div>
            </div>
  <div class="panel-body">
 
            
            <%  
                 
                Database db=(Database)getServletContext().getAttribute("db");
                Connection con=db.getCon();
                PreparedStatement pst;
                ResultSet rs;
                pst=con.prepareStatement("select p.product_id, p.image_name, p.product_name, p.producer,p.category_name,p.sub_category,p.price from products p INNER JOIN cart c on p.product_id=c.product_id where c.email=?");
                pst.setString(1,user.getUserEmail());
                rs=pst.executeQuery();
                while(rs.next())
                {   
                    item_count++;
                    int product_id=rs.getInt("product_id");
                    String image_name=rs.getString("image_name");
                    String product_name=rs.getString("product_name");
                    String producer=rs.getString("producer");
                    String category_name=rs.getString("category_name");
                    String sub_category=rs.getString("sub_category");
                    double price=rs.getDouble("price");
                  %>
                
               <div class="row">
		<div class="col-md-2 col-xs-12">
                    <img class="img-responsive" src="<%=image_name%>">
            </div>
		<div class="col-md-4 col-xs-12">
		<h4><strong><%=product_name%></strong></h4>
                <h4><strong><%=producer%></strong></h4>
	<h4><small>Category-<%=category_name%></small></h4>
        <h4><small>Sub Category-<%=sub_category%></small></h4>
		</div>
	<div class="col-md-6 col-xs-12">
	<div class="col-md-6 text-right">
	<h4><strong>Rs <%=price%></strong> x</h4>
	</div>
        <div class="col-md-4 col-xs-9">
            <input type="text" class="form-control input-sm" class="txt" name="qty" id="qty" value="1" onchange="getValue(this)">
    </div>
    <div class="col-md-2 col-xs-2">
        <a href="RemoveFromCart?id=<%=product_id%>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a>
    </div>
    </div>
    </div>
    <hr>
  </div>
    
    
                <%                     
                     
            
                    }
                }
            %>
            <%if(item_count==0)
            {
                %>
                
                <div class="row">
                    <h2 align="center"><strong>Your cart is empty</strong></h2>
		
                </div>
                <hr>
                
                
                <%
                } else {%>
            <div class="panel-footer">
	<div class="row">
        <div class="col-md-9 col-xs-12 text-right">
            <h4><strong>
                  sdfg  
                  
                </strong></h4>
        
               
	</div>
	<div class="col-md-3 col-xs-12">
            <a href="Checkout.jsp" class="btn btn-success btn-lg btn-block">Checkout</a>
	</div>
	</div>
	</div>  
           <%}%>
      
</div>
            </div>
            </div>
            
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>