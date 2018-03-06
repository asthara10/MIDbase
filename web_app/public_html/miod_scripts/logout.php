<?php
   include './login.php';
   session_unset($_SESSION['username']);
   header("Location: ../miod_web/MIOD.php");
?>
