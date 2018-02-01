<?php

// Loading data into variables
if (empty($_REQUEST["microindel_name"])) {
	echo"<script>
		alert("A microindel name is required");
	</script>";
} else {
	$microindel_name = $_REQUEST["microindel_name"];
}
$microindel_info = $_REQUEST["microindel_info"];
$genes = $_REQUEST["gene"];
	foreach ($genes as $each_gene) {
		echo $each_gene;
	}
$EnsmblIDs = $_REQUEST["EnsmblID"];
	foreach ($EnsmblIDs as $each_EnsmblID) {
		echo $each_EnsmblID;
	}
$start = $_REQUEST["start"];
$end = $_REQUEST["end"];
$cytogen = $_REQUEST["cytogen"];
$strand = $_REQUEST["strand"];
$clin_sig = $_REQUEST["clin_sig"];
$PMIDs = $_REQUEST["PMID"];
	foreach ($PMIDs as $each_PMID) {
		echo $each_PMID;
	}
$diseases = $_REQUEST["disease"];
	foreach ($diseases as $each_disease) {
		echo $each_disease;
	}
$IDMIMs = $_REQUEST["IDMIM"];
	foreach ($IDMIMs as $each_IDMIM) {
		echo $each_IDMIM
	}

// Connecting to the server
$servername = "localhost"; //which is the servername??
$username = "username"; //use our username and password? 
$password = "password";
// Create connection
$conn = mysqli_connect($servername, $username, $password);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}


//column names
$microindel_names = ["Name", "Info"];
$location_names = ["Start", "End", "Strand", "CytonLoc"];
$gene_names = ["GeneName", "EnsmblID"];
$disease_names = ["DiseaseName", "idMIM"];
$diseases = ["DiseaseName", "idMIM"];

// Inserting data
$microindel 
if !empty($genes) || !empty($EnsmblIDs) {

}
if !empty($start) || !empty($end) || !empty($cytogen) || !empty($strand) {

}
if !empty($clin_sig){
 $Value
}
if !empty($PMIDs) {
 $PMID
}
if !empty($IDMIM)	|| !empty($diseases) {

}

$sql = "INSERT INTO MyGuests (firstname, lastname, email)
VALUES ('John', 'Doe', 'john@example.com');";
$sql .= "INSERT INTO MyGuests (firstname, lastname, email)
VALUES ('Mary', 'Moe', 'mary@example.com');";
$sql .= "INSERT INTO MyGuests (firstname, lastname, email)
VALUES ('Julie', 'Dooley', 'julie@example.com')";

if (mysqli_multi_query($conn, $sql)) {
    echo "New records created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);







  

?>