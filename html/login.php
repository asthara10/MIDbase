<?php
   require("config.php");
   session_start();

   echo "hey_1!!";
   
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      echo "hey_2!";
      
      $myusername = mysqli_real_escape_string($db,$_POST['uname']);
      $mypassword = mysqli_real_escape_string($db,$_POST['psw']); 
      
      $sql = "SELECT id FROM members WHERE username = '$myusername' and password = '$mypassword'";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row	
      if($count == 1) {
         //session_register("myusername");
         $_SESSION['username'] = $myusername;
         
         //header("location: login.html");
      }else {
         $error = "Your Login Name or Password is invalid";
         echo $error;
      }
      
      if (isset($_SESSION['username'])){
	$_SESSION['username'] = $username;
        $_SESSION['success'] = "You are now logged in";
        header('location: MIODform.html');
      }
   }


 
?>


