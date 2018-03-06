<?php

include "../../globals_miod.php";

// Initializing variables
$from = NULL;
$message = NULL;

if (!$_REQUEST['email_address'] and !$_REQUEST['comments']){
	//Return to mainpage if empty
	header("Location: ../miod_web/Contact.php");
}
elseif ($_REQUEST['email_address'] and $_REQUEST['comments']) {
	// Store messages on sql
	$from = $_REQUEST['email_address'];
	$message = $_REQUEST['comments'];

	//avoid injection
	$from = mysqli_real_escape_string($id, $from);
	$message = mysqli_real_escape_string($id, $message);

	$sql = "INSERT INTO Comments (email, comment) VALUES ('$from', '$message');";
		if (mysqli_query($id, $sql)) {
			echo '<script type="text/javascript">
				alert("Your message has ben submited succesfully");
			</script>';
			echo '<script>window.location="../miod_web/Contact.php"</script>';
		}
		else {
			echo "Error: " . $sqldis . "<br>" . mysqli_error($id);
		}
}
else {
	// All fields are required
	echo '<script type="text/javascript">
		alert("E-mail and message are required.");
	</script>';
	echo '<script>window.location="../miod_web/Contact.php"</script>';
}

?>