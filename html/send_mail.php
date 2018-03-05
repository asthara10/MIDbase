<?php
include "globals_miod.php";

$from = $_REQUEST['email_address'];
$message = $_REQUEST['comments'];

// Send
mail('miod.consortium@gmail.com', 'miod comments', $message,);
?>
