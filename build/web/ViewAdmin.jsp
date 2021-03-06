<%@page import="admin.Admin"%>
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
        if (session.getAttribute("admin") == null ){
            
        
            %>
            <jsp:include page="/BeforeLoginHeader.jsp"></jsp:include>
        <%
        }else {
            %>
            <jsp:include page="/AdminHeader.jsp"></jsp:include>
        <%
        }
        %>
         <br><br><br><br>
      <div class="container">
          <div class="row">
              <div class=" col-sm-2"></div>
        <div class=" col-sm-8">
     <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-success">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <h3 align="center">View/Approve Orders</h3>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
          sfgfxh
           </div>
    </div>
  </div>
  <div class="panel panel-success">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <h3 align="center">Add Products</h3>
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
         
          
          <form action="AdminAddProducts" method="post">
	
	<div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
	<div class="form-group">
	<label>Product Name</label>
        <input type="text" class="form-control" name="product_name" >
	</div>
        </div>
	</div>
              <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="form-group">
  <label>Category</label>
  <input type="text" class="form-control" name="category_name" >
   </div>
    </div>
     </div>
              <div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	 <div class="form-group">
	<label>Sub Category</label>
	<input type="text" class="form-control" name="sub_category" >
        </div>
        </div>
        </div>
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
	<label>Producer</label>
	<input type="text" class="form-control" name="producer"></div>
        </div>
        </div>
         <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
        <label>Price</label>
        <input type="text" class="form-control" name="price">
        </div>
        </div>
        </div>
        <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="form-group">
      <label>Summary</label>
      <input type="text" class="form-control" name="summary" >
      </div>
      </div>
      </div>
       <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="form-group">
      <label>Tags</label>
      <input type="text" class="form-control" name="tags" >
      </div>
      </div>
      </div>
               <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="form-group">
      <label>Product Quantity</label>
      <input type="text" class="form-control" name="product_qty" >
      </div>
      </div>
      </div>
               <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="form-group">
      <label>Last Updated</label>
      <input type="date" class="form-control" name="lastupdated" >
      </div>
      </div>
      </div>
               <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="form-group">
      <label>Hits</label>
      <input type="text" class="form-control" name="hits" >
      </div>
      </div>
      </div>
               <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="form-group">
         
      <label>Insert Image</label>
      <input type="text" class="form-control" name="image_name" >
      </div>
      </div>
      </div>
      
              <button type="submit" class="btn btn-primary">Submit</button>
    </form>
         
          </div>
    </div>
  </div>
  <div class="panel panel-success">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <h3 align="center"> Settings</h3>
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
          
          
          <form action="ChangePassword" method="post">
	
	
              <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="form-group">
  <label>Old Password</label>
   <input type="password" class="form-control" name="old_password">
   </div>
    </div>
     </div>
              <div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	 <div class="form-group">
	<label>New Password</label>
        <input type="password" class="form-control" name="new_password">
        </div>
        </div>
        </div>
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
	<label>Confirm Password</label>
	<input type="password" class="form-control" name="confirm_password"></div>
        </div>
        </div>
         
      
              <button type="submit" class="btn btn-primary">Submit</button>
    </form>
          
          
          </div>
    </div>
  </div>
</div>
        </div>
          </div>
      </div>
       

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>