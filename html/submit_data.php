<?php

// Connecting to the server
$servername = "localhost"; //use the servername
$username = "root"; //use our username
$password = "1994"; //use our password
$database = "miod";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}


// Initializing all variables to NULL
$microindel_id = 0;
$microindel_name = "";
$microindel_info = NULL;

$gene_id = [];
$genes = NULL;
$EnsmblIDs = NULL;

$location_id = 0;
$start = NULL;
$end = NULL;
$cytogen = NULL;
$strand = NULL;

$clinsig_id = 0;
$clin_sig = NULL;

$PMID_id = [];
$PMIDs = NULL;

$disease_id = [];
$diseases = NULL;
$IDMIMs = NULL;

if (!empty($_REQUEST["microindel_name"])) {

	//Microindel Management
	$microindel_name = $_REQUEST["microindel_name"];

	$request = "SELECT Name FROM Microindel WHERE Name = '$microindel_name';";
	$check_exist = mysqli_query($conn, $request);
	$no_exist = empty(mysqli_num_rows($check_exist));
	
	if($no_exist) { //microindel does not exist
		//ask for the last id
		$queryActuaId = "SELECT MAX(idMicroindel) FROM Microindel;";
		$result = mysqli_query($conn, $queryActuaId);
		$actual_id = 0;
		if (!empty($result)) {
			if (mysqli_num_rows($result) > 0) {
				$row = mysqli_fetch_assoc($result);
				$actual_id = $row["MAX(idMicroindel)"];
			} else {
				$actual_id = 0;
			}
		} else {
			$actual_id = 0;
		}
		$microindel_id = $actual_id+1;
	} else { //microindel already exists
		echo '<script type="text/javascript">
			alert("The microindel already exists");
		</script>';	
	} 

	if(!empty($_REQUEST["microindel_info"])){
		$microindel_info = $_REQUEST["microindel_info"];
	}

	//Clinical Significance Management
	if (!empty($_REQUEST["clin_sig"])) {
		$clin_sig = $_REQUEST["clin_sig"];
		switch ($clin_sig) {
			case not_provided:
				$clinsig_id = 1;
				break;
			case benign:
				$clinsig_id = 2;
				break;
			case likely_benign:
				$clinsig_id = 3;
				break;
			case association:
				$clinsig_id = 4;
				break;
			case sensitivity:
				$clinsig_id = 5;
				break;
			case drug_res:
				$clinsig_id = 6;
				break;
			case protective:
				$clinsig_id = 7;
				break;
			case risk:
				$clinsig_id = 8;
				break;
			case likely_pathogenic:
				$clinsig_id = 9;
				break;
			case pathogenic:
				$clinsig_id = 10;
				break;
			case uncertain:
				$clinsig_id = 11;
				break;
			case other:
				$clinsig_id = 12;
				break;
		}
	}

	//PMID Management
	$tempPMIDs = $_REQUEST["PMID"];
	foreach ($tempPMIDs as $pmid) {
		if(!empty($pmid)){
			$request = "SELECT idReference FROM Reference WHERE PMID = '$pmid';";
			$check_exist = mysqli_query($conn, $request);
			$no_exist = empty(mysqli_num_rows($check_exist));
			$pmid_id = 0;
			if($no_exist){
				$queryActuaId = "SELECT MAX(idReference) FROM Reference;";
				$result = mysqli_query($conn, $queryActuaId);
				$actual_id = 0;
				if (!empty($result)) {
					if (mysqli_num_rows($result) > 0) {
						$row = mysqli_fetch_assoc($result);
						$actual_id = $row["MAX(idReference)"];
					} else {
						$actual_id = 0;
					}
				} else {
					$actual_id = 0;
				}
				$pmid_id = $actual_id+1;

				$sql = "INSERT INTO Reference (idReference, PMID) VALUES ('$pmid_id','$pmid');";	
				if (!mysqli_query($conn, $sql)) {
					echo "Error: " . $sql . "<br>" . mysqli_error($conn);
				}
			}
			else {
				$queryId = "SELECT idReference FROM Reference WHERE PMID = '$pmid';";
				$result = mysqli_query($conn, $queryId);
				if (mysqli_num_rows($result) > 0) {
					$row = mysqli_fetch_assoc($result);
					$pmid_id = $row["idReference"];
				} 
			}
			array_push($PMID_id,$pmid_id);
		}
	}

	//Disease Management
	$tempDisease = $_REQUEST["disease"];
	$i = 0;
	foreach ($tempDisease as $disease) {
		if(!empty($disease)){
			$request = "SELECT idDisease FROM Disease WHERE DiseaseName = '$disease';";
			$check_exist = mysqli_query($conn, $request);
			$no_exist = empty(mysqli_num_rows($check_exist));
			$dis_id = 0;
			if($no_exist){
				$idMIM = $_REQUEST["IDMIM"];
				$queryActuaId = "SELECT MAX(idDisease) FROM Disease;";
				$result = mysqli_query($conn, $queryActuaId);
				$actual_id = 0;
				if (!empty($result)) {
					if (mysqli_num_rows($result) > 0) {
						$row = mysqli_fetch_assoc($result);
						$actual_id = $row["MAX(idDisease)"];
					} else {
						$actual_id = 0;
					}
				} else {
					$actual_id = 0;
				}
				$dis_id = $actual_id+1;	
				$sql = "INSERT INTO Disease (idDisease, DiseaseName, idMIM) VALUES ('$dis_id','$disease', '$idMIM[$i]');";	
				if (!mysqli_query($conn, $sql)) {
					echo "Error: " . $sql . "<br>" . mysqli_error($conn);
				}
			}
			else {
				$queryId = "SELECT idDisease FROM Disease WHERE DiseaseName = '$disease';";
				$result = mysqli_query($conn, $queryId);
				if (mysqli_num_rows($result) > 0) {
					$row = mysqli_fetch_assoc($result);
					$dis_id = $row["idDisease"];
				} 
			}
			array_push($disease_id,$dis_id);
		}
		$i++;
	}

	//Location Managment
	if (!empty($_REQUEST["start"])) {
		if ((empty($_REQUEST["end"])) or (empty($_REQUEST["chr"])) or (empty($_REQUEST["strand"]))) {
			echo '<script type="text/javascript">
			alert("All location fields are required in order to add a location");
			</script>';
		}
		else {
			$tempstart = $_REQUEST["start"];
			$tempend = $_REQUEST["end"];
			$tempchr = $_REQUEST["chr"];
			$tempstrand = $_REQUEST["strand"];

			$request = "SELECT idLocation FROM Location WHERE StartGRCh38='$tempstart' AND EndGRCh38='$tempend' AND CythogeneticLocation='$tempchr' AND Strand='$tempstrand';";
			$check_exist = mysqli_query($conn, $request);
			$no_exist = empty(mysqli_num_rows($check_exist));

			if($no_exist){
				$queryActuaId = "SELECT MAX(idLocation) FROM Location;";
				$result = mysqli_query($conn, $queryActuaId);
				$actual_id = 0;
				if (!empty($result)) {
					if (mysqli_num_rows($result) > 0) {
						$row = mysqli_fetch_assoc($result);
						$actual_id = $row["MAX(idLocation)"];
					} else {
						$actual_id = 0;
					}
				} else {
					$actual_id = 0;
				}
				$location_id = $actual_id+1;		
			}
			else {
				$queryId = "SELECT idLocation FROM Location WHERE StartGRCh38='$tempstart' AND EndGRCh38='$tempend' AND CythogeneticLocation='$tempchr' AND Strand='$tempstrand';";
				$result = mysqli_query($conn, $queryId);
				if (mysqli_num_rows($result) > 0) {
					$row = mysqli_fetch_assoc($result);
					$location_id = $row["idLocation"];
					echo '<script type="text/javascript">
					alert('.$location_id.');
					</script>';	
				} 
			}
		}
	}

	//Gene Managment
	$tempGene = $_REQUEST["gene"];
	$i = 0;
	foreach ($tempGene as $gene) {
		if(!empty($gene)){
			$request = "SELECT idGene FROM Gene WHERE GeneName = '$gene';";
			$check_exist = mysqli_query($conn, $request);
			$no_exist = empty(mysqli_num_rows($check_exist));
			$gen_id = 0;
			if($no_exist){
				$EnsID = $_REQUEST["EnsmblID"];
				$queryActuaId = "SELECT MAX(idGene) FROM Gene;";
				$result = mysqli_query($conn, $queryActuaId);
				$actual_id = 0;
				if (!empty($result)) {
					if (mysqli_num_rows($result) > 0) {
						$row = mysqli_fetch_assoc($result);
						$actual_id = $row["MAX(idGene)"];
					} else {
						$actual_id = 0;
					}
				} else {
					$actual_id = 0;
				}
				$gen_id = $actual_id+1;	
			}
			else {
				$queryId = "SELECT idGene FROM Gene WHERE GeneName = '$gene';";
				$result = mysqli_query($conn, $queryId);
				if (mysqli_num_rows($result) > 0) {
					$row = mysqli_fetch_assoc($result);
					$gen_id = $row["idGene"];
				} 
			}
			$sqlgene = "INSERT INTO Gene (idGene, GeneName, idENSEMBL, Location_idLocation) VALUES ('$gen_id','$gene', '$EnsID[$i]', '$location_id');";
			if (!mysqli_query($conn, $sqlgene)) {
				$all_correct = false;
				echo "Error: " . $sqlgene . "<br>" . mysqli_error($conn);	
			}
		}
		$i++;
	}

	$all_correct = true;

	// Inserting Data
	$sqlmicro = "INSERT INTO Microindel (idMicroindel, Info, Name) VALUES ('$microindel_id', '$microindel_info', '$microindel_name');";
	if (!mysqli_query($conn, $sqlmicro)) {
		$all_correct = false;
		echo "Error: " . $sqlmicro . "<br>" . mysqli_error($conn);	
	}


	$sqlclin = "INSERT INTO Microindel_has_ClinicalSignificance (Microindel_idMicroindel, ClinicalSignificance_idClinicalSignificance) VALUES ('$microindel_id', '$clinsig_id');";
	if (!mysqli_query($conn, $sqlclin)) {
		$all_correct = false;
		echo "Error: " . $sqlclin . "<br>" . mysqli_error($conn);	
	}
	
	foreach ($PMID_id as $Pmid) {
		$sqlref = "INSERT INTO Microindel_has_Reference (Microindel_idMicroindel, Reference_idReference) VALUES ('$microindel_id', '$Pmid');";
		if (!mysqli_query($conn, $sqlref)) {
			$all_correct = false;
			echo "Error: " . $sqlref . "<br>" . mysqli_error($conn);	
		}
	}

	$sqlloc = "INSERT INTO Location (idLocation, StartGRCh38, EndGRCh38, CythogeneticLocation, Strand, Microindel_idMicroindel) VALUES ('$location_id','$tempstart', '$tempend', '$tempchr', '$tempstrand', '$microindel_id');";
	if (!mysqli_query($conn, $sqlloc)) {
		$all_correct = false;
		echo "Error: " . $sqlloc . "<br>" . mysqli_error($conn);	
	}

	foreach ($disease_id as $disid) {
		$sqldis = "INSERT INTO Microindel_has_Disease (Microindel_idMicroindel, Disease_idDisease) VALUES ('$microindel_id', '$disid');";
		if (!mysqli_query($conn, $sqldis)) {
			$all_correct = false;
			echo "Error: " . $sqldis . "<br>" . mysqli_error($conn);	
		}
	}
	
	if ($all_correct) {
    	echo "New records created successfully";
	} 
}
else {
	echo '<script type="text/javascript">
	alert("The microindel name is required");
	</script>';	
}

mysqli_close($conn);

?>