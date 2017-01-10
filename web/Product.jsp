<!DOCTYPE html>
<%@page import="database.Database , java.sql.*,javax.servlet.RequestDispatcher;" %>
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
        
        <br> <br> <br> <br>
        
        
        
        
        
      <%
   Database db=(Database)getServletContext().getAttribute("db");
   Connection con=db.getCon();
    PreparedStatement pst=con.prepareStatement("select * from category"); 
    
    ResultSet rs = pst.executeQuery();
    
%>

<div class="container">
    
    <div class="row">
    <div class="col-xs-12">
        <div class="row">
            <div class="col-xs-2">
             <div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Product Category</div>
  

  <!-- List group -->
  <ul class="list-group">
      <%
           while (rs.next()){
        String category = rs.getString ("category_name");
       %>
      <li class="list-group-item"><a href="viewProducts_.jsp"><%= category %></a></li>
       <%
         }
       %>
  </ul>
</div>
      </div>
  
  
  <%
      String id=request.getParameter("id");
      if(id!=null){
   Database db1=(Database)getServletContext().getAttribute("db");
   Connection con1=db1.getCon();
    PreparedStatement pst1=con1.prepareStatement("select * from products where product_id=?");
    pst1.setString(1,id);
    
    ResultSet rs1 = pst1.executeQuery();
     
%>
  
  
            
            <div class="col-xs-10">
                
                <div class="panel panel-default">
                    <%
                  while(rs1.next())
                  { 
                      
                  int product_id=rs1.getInt("product_id");
                  String product_name=rs1.getString("product_name");
                  String sub_category=rs1.getString("sub_category");
                  String category_name=rs1.getString("category_name");
                  String producer=rs1.getString("producer");
                  double price=rs1.getDouble("price");
                  String summary=rs1.getString("summary");
                  String image_name=rs1.getString("image_name");
                  
                  %>
                    <div class="panel-heading"><h4><%=product_name%> - <%=producer%></h4></div>
              <div class="row">
                  
            <div class="col-xs-8"> 
                <div class="container col-xs-8">
                    <h4> Priced At<h4 style="color: red">Rs <%=price%></h4></h4> 
                    <h3>Description</h3>
                <div>
                    
                </div>
                 <p> <%=summary%></p>   
                </div>
                    
                
            </div>
                  <div class="col-xs-2"> 
                      
                      <img class="img-responsive" src="<%=image_name %>" style="width:182px; height: 276px">
                <hr>
                <div class="container">
                <div class="row">
                              
                    <a href="AddToCart.jsp?id=<%=product_id%>" class="btn btn-success" role="button">Add To Cart</a>
               <a href="#" class="btn btn-success" role="button">Buy Now</a>
                </div>
            </div>
              </div>
              </div>
  <%} }%>
</div> 

 <%
   Database db1=(Database)getServletContext().getAttribute("db");
   Connection con1=db1.getCon();
    PreparedStatement pst1=con1.prepareStatement("select image_name, product_name,price,product_id from products where hits>10"); 
    
    ResultSet rs1 = pst1.executeQuery();
 
%>
  


<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Most Happening Products</div>
  <% while(rs1.next()) 
{ String image=rs1.getString("image_name");
String product_name=rs1.getString("product_name");
int price=rs1.getInt("price");
int product_id=rs1.getInt("product_id");
%>
   <div class="col-sm-6 col-md-3">
       <div class="thumbnail">
        <!-- Place the anchor tag here to cover both your caption and image -->
        <a href="Product.jsp?id=<%=product_id %>">
            <img src="<%=image %>">
            <div class="caption">
                <h4 ><%=product_name %></h4>
                <h4>Rs.<%=price %></h4>
            </div>
            
        </a>
        <!-- Anchor tag ends covering both image and caption -->
    </div>
   </div>
                <%  }%>   
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