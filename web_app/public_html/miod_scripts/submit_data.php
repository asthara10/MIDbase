
<?php

//Include globals
include "../../globals_miod.php";

//initialize all correct true variable
$all_correct = true;

//Return to main page if all is empty
if (empty($_REQUEST)) {
    header('Location:'.$_SERVER['HTTP_REFERER']);
}

//Work with file
if ($_FILES['miodfile']['name']){
	//Extracting file content and dividing it by line
	$infile = file_get_contents($_FILES['miodfile']['tmp_name']);
	$lines = explode("\n", $infile);
	//iterating by line
	foreach ($lines as $line) {
		########
		##Preprocessing annotation
		########

		//skipping headers and empty lines
		if ("#" == substr($line, 0,1) or (NULL == $line)){
			continue;
		}
		$sepline = explode("\t",$line);
		$field_num = count($sepline);

		//Checking number of fields
		if ($field_num !== 12){
			echo '<script type="text/javascript">
			alert("Error: wrong number of fields in line beggining wiht'.$sepline[0].'. Skipping...");
			</script>';
			$all_correct = False;
			continue;
		}

		//Creating as variables as elements in global array miodfile (each element is a field) Now the elements have the name of the fields. Also checking for empty fields
		for ($i=0; $i < $field_num; $i++) {
			if (!$sepline[$i]){
				echo '<script type="text/javascript">
				alert("Error: "'.$miodfile[$i]." field in ".$sepline[0].' is empty. Please, fill with "-" if information is not avalible. Skipping...);
				</script>';
				$all_correct = False;
				continue 2;
			}
			$tocode = "$".$miodfile[$i]."=\"".$sepline[$i]."\";";
			eval($tocode);
		}

		########
		##Extracting IDs
		########

		//1.Microindel: check if microindel exists, and skip if so
		$raw_sql = mysqli_query($id, 'SELECT * FROM Microindel WHERE 
			Microindel.Name =\''.$MicroindelName.'\';');
		$exists = mysqli_fetch_array($raw_sql)['Name'];
		if($exists){
			echo '<script type="text/javascript">
			alert("Microindel '.$MicroindelName.' already exists. Skipping...");
			</script>';
			$all_correct = False;
			continue;
		}
		//New microindel id (the last plus one)
		else{
			$raw_sql = mysqli_query($id,'SELECT MAX(idMicroindel) FROM Microindel;');
			$idmicroindel = (mysqli_fetch_array($raw_sql)['MAX(idMicroindel)'] + 1);
		}

		//2. Chromosome: Taking chromosome-strand id
		$raw_sql = mysqli_query($id, 'SELECT idChromosome FROM Chromosome WHERE
			Chromosome.Chromosome =\''.$Chromosome.'\' AND
			Chromosome.Strand = \''.$Strand.'\';');
		$idchrom = mysqli_fetch_array($raw_sql)['idChromosome'];
		if(!$idchrom){
			echo '<script type="text/javascript">
			alert("Wrong strand/chromosome in '.$MicroindelName.' . Skipping...");
			</script>';
			$all_correct = False;
			continue;
		}

		//3. Clinical significacne: Taking Clinical Significance-strand id
		$raw_sql = mysqli_query($id, 'SELECT idClinicalSignificance FROM ClinicalSignificance WHERE
			ClinicalSignificance.Value =\''.$Value.'\';');
		$idclinsig = mysqli_fetch_array($raw_sql)['idClinicalSignificance'];
		if(!$idclinsig){
			echo '<script type="text/javascript">
			alert("Wrong Clinical significance in '.$MicroindelName.'. Skipping...");
			</script>';
			$all_correct = False;
			continue;
		}

		//4. Gene: Taking Gene id and creating new entry if it doesn't exist
		$gene_existed = True; //Till the opposite is proven
		$raw_sql = mysqli_query($id, 'SELECT idGene FROM Gene WHERE
			Gene.GeneName =\''.$GeneName.'\' AND
			Gene.idENSEMBL = \''.$idENSEMBL.'\';');
		$idgene = (mysqli_fetch_array($raw_sql)['idGene']);
		//If the gene-idENSEMBL is not yet annotated, add at the end of SQL table
		if(!$idgene){
			$gene_existed = False;
			$raw_sql = mysqli_query($id,'SELECT MAX(idGene) FROM Gene;');
			$idgene = (mysqli_fetch_array($raw_sql)['MAX(idGene)'] + 1);
		}

		//5. Diseases: Taking diseases (one by one, for there can be more than one) and annotating them if doesn't exist yet
		$diseases = explode(",", $DiseaseName);
		$mims = explode(",", $idMIM);
		$diseases_existed = array();
		$iddiseases = array();
		$diseasecounter = 0;
		for ($i=0; $i < count($diseases); $i++) {
			$diseases_existed[$i] = True;//all are true till the opposite is proven
			$raw_sql = mysqli_query($id, 'SELECT idDisease FROM Disease WHERE
				Disease.DiseaseName =\''.$diseases[$i].'\' AND
				Disease.idMIM = \''.$mims[$i].'\';');
			$idDisease = (mysqli_fetch_array($raw_sql)['idDisease']);
			//If the Disease-MIM is not yet annotated, store the ids to later
			if(!$idDisease){
				$diseases_existed[$i] = False;
				$raw_sql = mysqli_query($id,'SELECT MAX(idDisease) FROM Disease;');
				$newid = mysqli_fetch_array($raw_sql)['MAX(idDisease)'] + 1 + $diseasecounter;
				$iddiseases[$i] = $newid;
				$diseasecounter++;
			}
		}

		//6. Reference: Taking Reference id and creating a new one if it's not yet in the database
		$reference_existed = True; //Till the opposite is proven
		$raw_sql = mysqli_query($id, 'SELECT idReference FROM Reference WHERE
		Reference.PMID =\''.$PMID.'\';');
		$idReference = (mysqli_fetch_array($raw_sql)['idReference']);
		//If the Reference-MIM is not yet annotated
		if(!$idReference){
			$reference_existed = False;
			$raw_sql = mysqli_query($id,'SELECT MAX(idReference) FROM Reference;');
			$idReference = (mysqli_fetch_array($raw_sql)['MAX(idReference)'] + 1);
		}

		########
		##Inserting data
		########
		//1. Disease
		for ($i=0; $i < count($diseases); $i++) {
			if (!$diseases_existed[$i]){
				$iddisease =  $iddiseases[$i];
				$disease = $diseases[$i];
				$idmim = $mims[$i];
				$sqlins = mysqli_query($id,  "INSERT INTO Disease (idDisease, DiseaseName, idMIM) VALUES ('$iddisease', '$disease', '$idmim');");
			}
		}

		//2. Gene
		if (!$gene_existed){
			$sqlins = mysqli_query($id, "INSERT INTO Gene (idGene, GeneName, idENSEMBL) VALUES ('$idgene', '$GeneName', '$idENSEMBL');");
		}
		
		//3. Reference
		if (!$reference_existed){
			$sqlins = mysqli_query($id, "INSERT INTO Reference (idReference, PMID, DB) VALUES ('$idReference', '$PMID', 'miod');");
		}

		//4. Microindel
		$sqlins = mysqli_query($id, "INSERT INTO Microindel (idMicroindel, Name, Start, End, Info, Gene_idGene, Chromosome_idChromosome) VALUES ('$idmicroindel', '$MicroindelName', '$Start', '$End', '$Info','$idgene','$idchrom');");

		//5. Microindel_has_ClinicalSignificance
		$sqlins = mysqli_query($id,"INSERT INTO Microindel_has_ClinicalSignificance (Microindel_idMicroindel, ClinicalSignificance_idClinicalSignificance) VALUES ('$idmicroindel', '$idclinsig');");

		//6. Microindel_has_Disease
		for ($i=0; $i < count($diseases); $i++) {
			if (!$diseases_existed[$i]){
				$iddisease =  $iddiseases[$i];
				$sqlins = mysqli_query($id,  "INSERT INTO Microindel_has_Disease (Microindel_idMicroindel, Disease_idDisease) VALUES ('$idmicroindel', '$iddisease');");
			}
		}

		//7. Microindel_has_Reference
		if (!$reference_existed){
			$sqlins =  mysqli_query($id,"INSERT INTO Microindel_has_Reference (Microindel_idMicroindel, Reference_idReference) VALUES ('$idmicroindel', '$idReference');");
		}

	}
}
//work with form
else{
	// Initializing all variables to NULL
	$microindel_id = 0;
	$microindel_name = "";
	$micoindel_start = NULL;
	$microindel_end = NULL;
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
		$check_exist = mysqli_query($id, $request);
		$no_exist = empty(mysqli_num_rows($check_exist));
		
		if($no_exist) { //microindel does not exist
			//ask for the last id
			$queryActuaId = "SELECT MAX(idMicroindel) FROM Microindel;";
			$result = mysqli_query($id, $queryActuaId);
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
			$all_correct = False;

		} 

		if(!empty($_REQUEST["microindel_info"])){
			$microindel_info = $_REQUEST["microindel_info"];
		}
		if(!empty($_REQUEST["microindel_start"])){
			$microindel_info = $_REQUEST["microindel_start"];
		}
		if(!empty($_REQUEST["microindel_end"])){
			$microindel_info = $_REQUEST["microindel_end"];
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
				$check_exist = mysqli_query($id, $request);
				$no_exist = empty(mysqli_num_rows($check_exist));
				$pmid_id = 0;
				if($no_exist){
					$queryActuaId = "SELECT MAX(idReference) FROM Reference;";
					$result = mysqli_query($id, $queryActuaId);
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

					$sql = "INSERT INTO Reference (idReference, PMID, DB) VALUES ('$pmid_id','$pmid','miod');";	
					if (!mysqli_query($id, $sql)) {
						echo "Error: " . $sql . "<br>" . mysqli_error($id);
					}
				}
				else {
					$queryId = "SELECT idReference FROM Reference WHERE PMID = '$pmid';";
					$result = mysqli_query($id, $queryId);
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
				$check_exist = mysqli_query($id, $request);
				$no_exist = empty(mysqli_num_rows($check_exist));
				$dis_id = 0;
				if($no_exist){
					$idMIM = $_REQUEST["IDMIM"];
					$queryActuaId = "SELECT MAX(idDisease) FROM Disease;";
					$result = mysqli_query($id, $queryActuaId);
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
					if (!mysqli_query($id, $sql)) {
						echo "Error: " . $sql . "<br>" . mysqli_error($id);
					}
				}
				else {
					$queryId = "SELECT idDisease FROM Disease WHERE DiseaseName = '$disease';";
					$result = mysqli_query($id, $queryId);
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
		if (empty($_REQUEST["chr"]) or (empty($_REQUEST["strand"]))) {
			echo '<script type="text/javascript">
			alert("All location fields are required in order to add a location");
			</script>';
			$all_correct = False;
		}
		else {
			$tempchr = $_REQUEST["chr"];
			$tempstrand = $_REQUEST["strand"];

			$request = "SELECT idChromosome FROM Chromosome WHERE Chromosome='$tempchr' AND Strand='$tempstrand';";
			$check_exist = mysqli_query($id, $request);
			$no_exist = empty(mysqli_num_rows($check_exist));

			if($no_exist){
				$queryActuaId = "SELECT MAX(idChromosome) FROM Chromosome;";
				$result = mysqli_query($id, $queryActuaId);
				$actual_id = 0;
				if (!empty($result)) {
					if (mysqli_num_rows($result) > 0) {
						$row = mysqli_fetch_assoc($result);
						$actual_id = $row["MAX(idChromosome)"];
					} else {
						$actual_id = 0;
					}
				} else {
					$actual_id = 0;
				}
				$location_id = $actual_id+1;		
			}
			else {
				$queryId = "SELECT idChromosome FROM Chromosome WHERE Chromosome='$tempchr' AND Strand='$tempstrand';";
				$result = mysqli_query($id, $queryId);
				if (mysqli_num_rows($result) > 0) {
					$row = mysqli_fetch_assoc($result);
					$location_id = $row["idChromosome"];
				} 
			}
		}

		//Gene Managment
		$tempGene = $_REQUEST["gene"];
		$i = 0;
		foreach ($tempGene as $gene) {
			if(!empty($gene)){
				$request = "SELECT idGene FROM Gene WHERE GeneName = '$gene';";
				$check_exist = mysqli_query($id, $request);
				$no_exist = empty(mysqli_num_rows($check_exist));
				$gen_id = 0;
				if($no_exist){
					$EnsID = $_REQUEST["EnsmblID"];
					$queryActuaId = "SELECT MAX(idGene) FROM Gene;";
					$result = mysqli_query($id, $queryActuaId);
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
					$result = mysqli_query($id, $queryId);
					if (mysqli_num_rows($result) > 0) {
						$row = mysqli_fetch_assoc($result);
						$gen_id = $row["idGene"];
					} 
				}
				$sqlgene = "INSERT INTO Gene (idGene, GeneName, idENSEMBL) VALUES ('$gen_id','$gene', '$EnsID[$i]');";
				$genids[] = $gen_id;
				if (!mysqli_query($id, $sqlgene)) {
					$all_correct = false;
					echo "Error: " . $sqlgene . "<br>" . mysqli_error($id);	
				}
			}
			$i++;
		}

		// Inserting Data
		foreach ($genids as $genid) {
			$sqlmicro = "INSERT INTO Microindel (idMicroindel, Info, Name, Gene_idGene, Chromosome_idChromosome) VALUES ('$microindel_id', '$microindel_info', '$microindel_name', $genid, '$location_id');";
			if (!mysqli_query($id, $sqlmicro)) {
				$all_correct = false;
				echo "Error: " . $sqlmicro . "<br>" . mysqli_error($id);	
			}
		}


		$sqlclin = "INSERT INTO Microindel_has_ClinicalSignificance (Microindel_idMicroindel, ClinicalSignificance_idClinicalSignificance) VALUES ('$microindel_id', '$clinsig_id');";
		if (!mysqli_query($id, $sqlclin)) {
			$all_correct = false;
			echo "Error: " . $sqlclin . "<br>" . mysqli_error($id);	
		}
		
		foreach ($PMID_id as $Pmid) {
			$sqlref = "INSERT INTO Microindel_has_Reference (Microindel_idMicroindel, Reference_idReference) VALUES ('$microindel_id', '$Pmid');";
			if (!mysqli_query($id, $sqlref)) {
				$all_correct = false;
				echo "Error: " . $sqlref . "<br>" . mysqli_error($id);	
			}
		}

		foreach ($disease_id as $disid) {
			$sqldis = "INSERT INTO Microindel_has_Disease (Microindel_idMicroindel, Disease_idDisease) VALUES ('$microindel_id', '$disid');";
			if (!mysqli_query($id, $sqldis)) {
				$all_correct = false;
				echo "Error: " . $sqldis . "<br>" . mysqli_error($id);	
			}
		}
		
	}
	else {
		echo '<script type="text/javascript">
		alert("The microindel name is required");
		</script>';
		$all_correct = False;
	}
}

mysqli_close($id);

if ($all_correct) {
	echo '<script type="text/javascript">
alert("All Microindels annotated successfully");
</script>';	
} 

//Go to original page after alerts
echo '<script>window.location="../miod_web/MIODform.php"</script>';

?>
