<!DOCTYPE html>
<%@page import="database.Database , java.sql.*, user.User" %>
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
        } User user=(User)session.getAttribute("user");
           user.setUserEmail(user.email);
            
        %>
        <br><br><br><br>
        <div class="container">
        <div class="row">
        <div class="col-md-7 col-sm-7 col-xs-12">
        <!-- Adress panel -->
	<div class="panel panel-primary">
         <div class="panel-heading">Shipping Details</div>
	<div class="panel-body">
	
            <%if(user.getAddress()!=null)
            {
            %>
            <form>
	
	<div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
	<div class="form-group">
	<label>First Name</label>
        <input type="text" class="form-control" name="first_name" value="<%=user.getFirstname()%>" disabled>
	</div>
	</div>
	<div class="col-md-6 col-sm-6 col-xs-12">
	<div class="form-group">
	<label>Last Name</label>
	<input type="text" class="form-control" name="last_name" value="<%=user.getLastname()%>"disabled>
	</div>
	</div>
	</div>
              <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="form-group">
  <label>Email</label>
  <input type="email" class="form-control" name="email" value="<%=user.email%>" disabled>
   </div>
    </div>
     </div>
              <div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	 <div class="form-group">
	<label>Country</label>
	<input type="text" class="form-control" name="country" value="<%=user.getCountry()%>" disabled>
        </div>
        </div>
        </div>
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
	<label>Address</label>
	<input type="text" class="form-control" name="address" value="<%=user.getAddress()%>" disabled></div>
        </div>
        </div>
         <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
        <label>Postal Code</label>
        <input type="text" class="form-control" name="postal_code" value="<%=user.getPostalCode()%>" disabled>
        </div>
        </div>
        </div>
        <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="form-group">
      <label>Contact No.</label>
      <input type="text" class="form-control" name="contact" value="<%=user.getContact()%>" disabled>
      </div>
      </div>
      </div>
    </form>
      <%}
else{
      %>
       
      
      <form action="SubmitUserDetails" method="post">
	
	<div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
	<div class="form-group">
	<label>First Name</label>
        <input type="text" class="form-control" name="first_name" disabled >
	</div>
	</div>
	<div class="col-md-6 col-sm-6 col-xs-12">
	<div class="form-group">
	<label>Last Name</label>
	<input type="text" class="form-control" name="last_name" disabled>
	</div>
	</div>
	</div>
              <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="form-group">
  <label>Email</label>
  <input type="email" class="form-control" name="email" value="<%=user.email%>" disabled>
   </div>
    </div>
     </div>
              <div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	 <div class="form-group">
	<label>Country</label>
	<input type="text" class="form-control" name="country" disabled>
        </div>
        </div>
        </div>
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
	<label>Address</label>
	<input type="text" class="form-control" name="address" disabled></div>
        </div>
        </div>
         <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">
        <label>Postal Code</label>
        <input type="text" class="form-control" name="postal_code" disabled>
        </div>
        </div>
        </div>
        <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="form-group">
      <label>Contact No.</label>
      <input type="text" class="form-control" name="contact" disabled >
      </div>
      </div>
      </div>
      
              
    </form>
      
      
<%}%>      
    </div>
    </div>
   <!-- End Adress panel -->

   <!-- Payment -->
  <div class="panel panel-primary">
 <div class="panel-heading">Payment</div>
 <div class="panel-body">
  <form>
  <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="form-group">       
            <label>Card Type</label>
                                                                                                
         <select class="form-control">
        <option>VISA</option>
         <option>Master Card</option>
         <option>AMEX</option>
         </select>
       </div>
     </div>
     </div>
    <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
 <div class="form-group">
 <label>Card Number</label>
 <input type="text" class="form-control">
 </div>
 </div>
</div>
<div class="row">
<div class="col-md-12 col-sm-12 col-xs-12">
<div class="form-group">
<label>Card CVV</label>
<input type="text" class="form-control">
</div>
</div>
</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12">
<div class="form-group">
<label>Month</label>
<input type="text" class="form-control">
</div>
</div>
<div class="col-md-6 col-sm-6 col-xs-12">
<div class="form-group">
<label>Year</label>
<input type="text" class="form-control">
</div>
</div>
</div>
<button type="submit" class="btn btn-success">Place Order</button>						
</form>
</div>
</div>
<!-- End Payment -->
</div>
<div class="col-md-5 col-sm-5 col-xs-12">
<div class="panel panel-success">
<div class="panel-heading">
<span class="pull-right"><a href="ShowCart.jsp">Edit Chart</a></span>
Review Order
</div>
<div class="panel-body">
    <%  
                 
                Database db=(Database)getServletContext().getAttribute("db");
                Connection con=db.getCon();
                PreparedStatement pst;
                ResultSet rs;
                pst=con.prepareStatement("select image_name, product_name, producer,category_name,sub_category,price from products INNER JOIN cart on products.product_id=cart.product_id where cart.email=?");
                pst.setString(1,user.getUserEmail());
                rs=pst.executeQuery();
                while(rs.next())
                {
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
	<h4><strong>Rs <%=price%></strong></h4>
	</div>
    </div>
    </div>
    <hr>
                <%}
            %>
    
<div class="row">
<div class="col-md-6 col-sm-6">
<span style="font-weight:bold;font-size:20px;color:green;">Grand Total</span>
</div>
<div class="col-md-6 col-sm-6">
<span class="pull-right" style="font-weight:bold;font-size:20px;color:green;">$85</span>
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