<?php
/*
    Database login details and connection
*/ 
   define('SERVER', 'localhost');
   define('USERNAME', 'admiod');
   define('PASSWORD', 'Microindels4');
   define('DATABASE', 'miod');
   $db = mysqli_connect(SERVER,USERNAME,PASSWORD,DATABASE) or die('Error connecting to database...'.mysqli_error());
?>



	