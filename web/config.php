<?php
/*
    Database login details and connection
*/ 
   define('SERVER', 'localhost');
   define('USERNAME', 'root');
   define('PASSWORD', '#');
   define('DATABASE', 'miod_login');
   $db = mysqli_connect(SERVER,USERNAME,PASSWORD,DATABASE) or die('Error connecting to database...'.mysqli_error());
?>



