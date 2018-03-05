<?php
   include 'login.php';
   session_unset($_SESSION['username']);
   header("Location: ./public_html/MIOD.php");
?>
