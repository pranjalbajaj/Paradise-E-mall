<!DOCTYPE html>
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
      
         <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">HOME<span class="sr-only">(current)</span></a></li>
        <li><a href="#">PRODUCTS</a></li>
        <li><a href="#">CONTACT US</a></li>
        <li><a href="#">FAQ</a></li>
        </li>
      </ul>
        
        <form class="navbar-form navbar-left" action="FindProducts.jsp" method="post">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search" name="search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
        
</ul>
<form action="Signin" method="post">
      <ul class="nav navbar-nav navbar-right">
          <li><a href="Signup">Sign up</a></li>
          
        <button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#modal-1">Sign in</button> 
       
      </ul>
    </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
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
      
      
      <script type="text/javascript">
    $(document).ready(function (){
        //alert ("fdvgf");
                
        $('#search').keyup (function (){
            searchbar = $('#search').attr('value');
            if (searchbar.length >= 3){
                //$('#loadSearches').load('findProductLoad.jsp', {searchbar:searchbar});
                            
                $('#loadSearches').css('display');
                $.get('FindProducts.jsp', {searchbar:searchbar}, function (data){
                    //alert (data);
                    if (data.length > 760){
                        $('#loadSearches').html(data).slideDown(500);
                    }
                    else {
                        $('#loadSearches').slideUp(500);
                        $('#loadSearches').html("");
                    }
                });
                       
            }else {
                 $('#loadSearches').slideUp(500);
                $('#loadSearches').html("");
            }
        });
    });
            
</script>
      
      

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>