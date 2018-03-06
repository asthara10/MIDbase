<?php   
   include "../../globals_miod.php";

   $myusername = NULL;
   $_SESSION['username'] = $myusername;
   

   session_start();

   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form
      
      $myusername = mysqli_real_escape_string($db,$_POST['uname']);
      $mypassword = mysqli_real_escape_string($db,$_POST['psw']); 
      $password = md5($mypassword);    
      
      $sql = "SELECT id FROM Members WHERE username = '$myusername' and password = '$password';";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $count = mysqli_num_rows($result);
      // If result matched $myusername and $mypassword, table row must be 1 row	
      if($count == 1) {
         $_SESSION['username'] = $myusername;
      }else {
	     echo '<script type="text/javascript">
				alert("Your login name or password is invalid");
	         </script>';
         echo '<script>window.location="../miod_web/MIOD.php"</script>';
      }
      
      if (isset($_SESSION['username'])){
	     $_SESSION['username'] = $myusername;
        $_SESSION['success'] = "You are now logged in";
        header('Location: ../miod_web/MIOD.php');
      }
   }


 
?>


