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
$actual_microindel_names = $microindel_names;
if empty($microindel_info) {
	$actual_microindel_names = array_diff($actual_microindel_names, ["Info"]);
} 
$sql = "INSERT INTO Microindel ($actual_microindel_names)
VALUES ($microindel_name, $microindel_info);";
if !empty($genes) || !empty($EnsmblIDs) {
	$actual_gene_names = $gene_names;
	if empty($genes) {
		$actual_gene_names = array_diff($actual_gene_names, ["GeneName"]);
	}
	if empty($EnsmblIDs) {
		$actual_gene_names = array_diff($actual_gene_names, ["EnsmblID"]);
	}
	$sql = "INSERT INTO Gene ($actual_gene_names)
	VALUES ($genes, $EnsmblIDs);";
}
if !empty($start) || !empty($end) || !empty($cytogen) || !empty($strand) {
	$actual_location_names = $location_names;
	if empty($start) {
		$actual_location_names = array_diff($actual_location_names, ["Start"]);
	}
	if empty($end) {
		$actual_location_names = array_diff($actual_location_names, ["End"]);
	}
	if empty($cytogen) {
		$actual_location_names = array_diff($actual_location_names, ["Strand"]);
	}
	if empty($strand) {
		$actual_location_names = array_diff($actual_location_names, ["CytonLoc"]);
	}
}
if !empty($clin_sig){
 $Value
}
if !empty($PMIDs) {
 $PMID
}
if !empty($IDMIM)	|| !empty($diseases) {
	$actual_disease_names = $disease_names;
	if empty($IDMIM) {
		$actual_disease_names = array_diff($actual_disease_names, ["idMIM"]);
	}
	if empty($diseases) {
		$actual_disease_names = array_diff($actual_disease_names, ["DiseaseName"]);
	}
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