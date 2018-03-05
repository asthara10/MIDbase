<?php
	include "login.php";
	if ($_SESSION['username']) { ?>

		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<base href="http://127.0.0.1/">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="./public_html/MIOD_styles.css">
		</head>

		<body>
		<nav class="navbar navbar-expand-md bg-light navbar-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
		</button>
		<img  id="logo" src="./media/MIOD2.png">
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
		  <li class="nav-item">
		   <a class="nav-item nav-link" href="./public_html/MIOD.php">Home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-item nav-link" href="./public_html/ad_search.php">Advanced Search</a>
		  </li>  
		  <li class="nav-item">
		    <a class="nav-item nav-link" href="./public_html/MIODform.php">Introduce Data</a>
		  </li> 
		  <li class="nav-item">
		     <a class="nav-item nav-link" href="./public_html/Contact.php">Contact Us</a>
		  </li> 
		  <li class="nav-item">
		    <a class="nav-item nav-link" href="./public_html/about.php">About Us</a>
		  </li>  
		</ul>
		</div>
		<form class="form-inline" style="margin-right: 1%" action="./search.php" method="GET">
		<input class="form-control mr-sm-2" type="search" name="query" placeholder="Search" aria-label="Search">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="button">Login</button>
		<div id="id01" class="modal">
		    <form class="modal-content animate popup" action="./login.php" method="post">
		      <div class="container">
		       <form>
		          User name:<br>
		          <input type="text" name="uname" required ><br>
		          User password:<br>
		          <input type="password" name="psw" size ="15" required ><br>
		        </form>  
		        <button type="submit" class="button3">Login</button>
		        <label>
		        <input type="checkbox" checked="checked"> Remember me</label>
		        <button type="button" onclick="window.location.href='./logout.php'" class="cancelbtn">Cancel</button>
		      </div>
		    </form>
		  </div>
		<button onclick="window.location.href='./logout.php'" style="width:auto;" class="button">Log Out</button>
		<div id="id02" class="modal"></div>
		</nav>

		</body>
		</html> 

	<?php
	} else { ?>
		<!DOCTYPE html>
		<html>
		  <head>
		    <title>proves</title>
		    <meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		    <meta name="viewport" content="width=device-width, initial-scale=1">
		    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
			<base href="http://127.0.0.1/">
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		    <link rel="stylesheet" href="./public_html/MIOD_styles.css">
		  </head>
		  
		  <body>
		          <nav class="navbar navbar-expand-md bg-light navbar-light">
		          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		            <span class="navbar-toggler-icon"></span>
		          </button>
		          <img  id="logo" src="./media/MIOD.png">
		         <div class="collapse navbar-collapse" id="collapsibleNavbar">
		            <ul class="navbar-nav">
		              <li class="nav-item">
		               <a class="nav-item nav-link" href="./public_html/MIOD.php">Home</a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-item nav-link" href="./public_html/ad_search.php">Advanced Search</a>
		              </li>  
		              <li class="nav-item">
		                 <a class="nav-item nav-link" href="./public_html/Contact.php">Contact Us</a>
		              </li> 
		              <li class="nav-item">
		                <a class="nav-item nav-link" href="./public_html/about.php">About Us</a>
		              </li>  
		            </ul>
		          </div>
		          <form class="form-inline" style="margin-right: 1%" action="./search.php" method="GET">
		            <input class="form-control mr-sm-2" type="search" name="query" placeholder="Search" aria-label="Search">
		            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		          </form>
		            <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="button">Login</button>
		            <div id="id01" class="modal">
		                <form class="modal-content animate popup" action="login.php" method="post">
		                  <div class="container">
		                   <form>
		                      User name:<br>
		                      <input type="text" name="uname" required ><br>
		                      User password:<br>
		                      <input type="password" name="psw" size ="15" required ><br>
		                    </form>  
		                    <button type="submit" class="button3">Login</button>
		                    <label>
		                    <input type="checkbox" checked="checked"> Remember me</label>
		                    <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
		                  </div>
		                </form>
		              </div>
		            <button onclick="document.getElementById('id02').style.display='block'" style="width:auto;" class="button">Sign Up</button>
		            <div id="id02" class="modal">
		              <form class="modal-content animate popup" action="./signup.php" method="post">
		                <div class="container">
		                  <form>
		                      User name:<br>
		                      <input type="text" name="uname" required ><br>
		                      Email:<br>
		                      <input type="email" name="email" size ="15" required ><br>
		                      Password:<br>
		                      <input type="password" name="password_1" size ="15" required ><br>
		                      Confirm password:<br>
		                      <input type="password" name="password_2" size ="15" required ><br>
		                  </form>  
		                    <button type="submit" class="button3" name="reg_user">Register</button>
		                    <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
		                </div>
		              </form>
		            </nav>

		  </body>
		</html>
<?php 
	} ?>
