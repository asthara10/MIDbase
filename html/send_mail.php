<?php
include "globals_miod.php";

$from = $_REQUEST['email_address'];
$message = $_REQUEST['comments'];
var_dump($_REQUEST);
$header = $headers = 'From: '.$from . "\r\n" .
    'Reply-To: '.$from . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

// Send
mail('miod.consortium@gmail.com', 'miod comments', $message, $headers);
?>