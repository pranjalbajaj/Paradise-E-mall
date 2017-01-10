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
   
       <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" style="border-radius:0px !important; margin-bottom:0px;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp"><b><i>Words Paradise</i></b></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
   <br><br><br><br>
   <div class="container">
       <div class="row">
           <div class="col-sm-3"></div>
                  <div class="col-sm-6">
   <div class="panel panel-info">
            <div class="panel-heading">Administrator Login</div>
            <div class="panel-body">
                
                
                
      <form action="ValidateAdmin" method="post">
	
	
        <div class="row">      
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="form-group">
  <label>Username</label>
   <input type="text" class="form-control" name="username">
   </div>
    </div>
        </div>
              <div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	 <div class="form-group">
	<label>Password</label>
        <input type="password" class="form-control" name="admin_password">
        </div>
        </div>
              </div>
         
      
              <button type="submit" class="btn btn-primary">Submit</button>
                  </form>

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