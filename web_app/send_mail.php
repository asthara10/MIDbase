<?php

include "globals_miod.php";

// Initializing variables
$from = NULL;
$message = NULL;

if (!empty($_REQUEST['email_address'])) and (!empty($_REQUEST['comments'])) {
	// Store messages on sql
	$from = $_REQUEST['email_address'];
	$message = $_REQUEST['comments'];

	$sql = "INSERT INTO Comments (email, comment) VALUES ('$from', '$message');";
		if (mysqli_query($id, $sql)) {
			echo '<script type="text/javascript">
				alert("Your message has ben submited succesfully :)");
			</script>';				
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
	echo '<script>window.location="./public_html/Contact.php"</script>';
}

?>