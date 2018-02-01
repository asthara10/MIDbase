<?php

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


// Loading data into variables
if (empty($_REQUEST["microindel_name"])) {
	echo"<script>
		alert("A microindel name is required");
	</script>";
} else {
	$microindel_name = $_REQUEST["microindel_name"];
}
// Introducing data
$sql = "INSERT INTO Microindel (Name)
VALUES ($microindel_name);";
// Loading data into variables
$microindel_info = $_REQUEST["microindel_info"];
// Introducing data
if !empty($microindel_info) {
	$sql .= "INSERT INTO Microindel (Info)
	VALUES ($microindel_info);";
} 
// Loading data into variables
$genes = $_REQUEST["gene"];
// Introducing data
	if !empty($genes) {
		foreach ($genes as $each_gene) {
			$sql .= "INSERT INTO Gene (GeneName)
			VALUES ($each_gene);";
		}
	}
// Loading data into variables
$EnsmblIDs = $_REQUEST["EnsmblID"];
// Introducing data
	if !empty($EnsmblIDs) {
		foreach ($EnsmblIDs as $each_EnsmblID) {
			$sql .= "INSERT INTO Gene (EnsmblID)
			VALUES ($each_EnsmblID);";
		}
	}
// Loading data into variables
$start = $_REQUEST["start"];
// Introducing data
if !empty($start) {
	$sql .= "INSERT INTO Location (Start)
	VALUES ($start);";
}
// Loading data into variables
$end = $_REQUEST["end"];
// Introducing data
if !empty($end) {
	$sql .= "INSERT INTO Location (End)
	VALUES ($end);";
}
// Loading data into variables
$cytogen = $_REQUEST["cytogen"];
// Introducing data
if !empty($cytogen) {
	$sql .= "INSERT INTO Location (CytonLoc)
	VALUES ($cytogen);";
}
// Loading data into variables
$strand = $_REQUEST["strand"];
// Introducing data
if !empty($strand) {
	$sql .= "INSERT INTO Location (Strand)
	VALUES ($strand);";
}
// Loading data into variables
$clin_sig = $_REQUEST["clin_sig"];
// Introducing data
if !empty($clin_sig){
	$sql .= "INSERT INTO ClinicalSignificance (Value)
	VALUES ($clin_sig);";
}
// Loading data into variables
$PMIDs = $_REQUEST["PMID"];
// Introducing data
	if !empty($PMIDs) {
		foreach ($PMIDs as $each_PMID) {
			$sql .= "INSERT INTO References (Reference)
			VALUES ($PMIDs);";
		}
	}
// Loading data into variables
$diseases = $_REQUEST["disease"];
// Introducing data
	if !empty($diseases) {
		foreach ($diseases as $each_disease) {
			$sql .= "INSERT INTO Disease (DiseaseName)
			VALUES ($microindel_info);";
		}
	}
// Loading data into variables
$IDMIMs = $_REQUEST["IDMIM"];
// Introducing data
	if !empty($IDMIM) {
		foreach ($IDMIMs as $each_IDMIM) {
			$sql .= "INSERT INTO Disease (idMIM)
			VALUES ($IDMIM);";
		}
	}


// Checking if the connection to MySQL was succesful
if (mysqli_multi_query($conn, $sql)) {
    echo "New records created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);

?>