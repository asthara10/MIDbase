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

// Initializing all variables
$microindel_name = '%';
$microindel_info = '%';
$start = '%';
$end = '%';

$gene = '%';
$ensmblID = '%';

$chr = '%';
$strand = '%';

$clinsig = '%';

$PMID = '%';

$disease = '%';
$IDMIM = '%';  

$idmicroindel = '%';
$iddisease = '%';
$idreference = '%';
$idgene = '%';
$idchromosome = '%';
$idclinsig = '%';

// Importing all searching data from the form
if (!empty($_REQUEST["microindel_name"])) {
    $microindel_name = $_REQUEST["microindel_name"];
}
if (!empty($_REQUEST["microindel_info"])) {
    $microindel_info = $_REQUEST["microindel_info"];
}
if (!empty($_REQUEST["start"])) {
    $start = $_REQUEST["start"];
}
if (!empty($_REQUEST["end"])) {
    $end = $_REQUEST["end"];
}
if (!empty($_REQUEST["gene"])) {
    $gene = $_REQUEST["gene"];
}
if (!empty($_REQUEST["ensmblID"])) {
    $ensmblID = $_REQUEST["ensmblID"];
}
if (!empty($_REQUEST["chr"])) {
    $chr = $_REQUEST["chr"];
}
if (!empty($_REQUEST["strand"])) {
    $strand = $_REQUEST["strand"];
}
if (!empty($_REQUEST["clinsig"])) {
    $clinsig = $_REQUEST["clinsig"];
}
if (!empty($_REQUEST["PMID"])) {
    $PMID = $_REQUEST["PMID"];
}
if (!empty($_REQUEST["disease"])) {
    $disease = $_REQUEST["disease"];
}
if (!empty($_REQUEST["IDMIM"])) {
    $IDMIM = $_REQUEST["IDMIM"];
}

// Select ids for all tables where a field is being required in the search
$req_microindel = "SELECT idMicroindel FROM Microindel WHERE (Name LIKE %".$microindel_name."%) AND (Start LIKE %".$start."%) AND (End LIKE %".$end."%) AND (Info LIKE %".$microindel_info."%)";
$req_disease = "SELECT idDisease FROM Disease WHERE (DiseaseName LIKE %".$disease."%) AND (idMIM LIKE %".$IDMIM."%)";
$req_reference = "SELECT idReference FROM Reference WHERE PMID LIKE %".$PMID."%";
$req_gene = "SELECT idGene FROM Gene WHERE (GeneName LIKE %".$gene."$) AND (idENSEMBL LIKE %".$ensmblID."%)";
$req_chromosome = "SELECT idChromosome FROM Chromosome WHERE (Chromosome LIKE %".$chr."$) AND (Strand LIKE %".$strand."$)";
$req_clinsig = "SELECT idClinicalSignificance FROM ClinicalSignificance WHERE Value = ".$clinsig;

$idmicroindel = mysqli_query($conn, $req_microindel);
$iddisease = mysqli_query($conn, $req_disease);
$idreference = mysqli_query($conn, $req_reference);
$idgene = mysqli_query($conn, $req_gene);
$idchromosome = mysqli_query($conn, $req_chromosome);
$idclinsig = mysqli_query($conn, $req_clinsig);

// Final selecting of all fields
foreach ($idmicroindel as $idmic) {
    foreach ($iddisease as $iddis) {
        foreach ($idreference as $idref) {
            foreach ($idgene as $idgen) {
                foreach ($idchromosome as $idchr) {
                    foreach ($idclinsig as $idclin) {
                        $request = "SELECT Microindel.Name, ClinicalSignificance.Value, Disease.DiseaseName, Reference.PMID FROM Microindel, ClinicalSignificance, Disease, Reference WHERE Microindel.idMicroindel = Microindel_has_Disease.Microindel_idMicroindel AND Disease.idDisease = Microindel_has_Disease.Disease_idDisease AND Microindel.idMicroindel = $idmic AND Disease.idDisease = $iddis AND Microindel.Gene_idGene = $idgen AND Microindel.Chromosome_idChromosome = $idchr AND Microindel.idMicroindel = Microindel_has_ClinicalSignificance.Microindel_idMicroindel AND ClinicalSignificance.idClinicalSignificance = Microindel_has_ClinicalSignificance.ClinicalSignificance_idClinivalSignificance AND ClinicalSignificance.idClinicalSignificance = $idclin AND Microindel.idMicroindel = Microindel_has_Reference.Microindel_idMicroindel AND Reference.idReference = Microindel_has_Reference.Reference_idReference AND Reference.idReference = $idref";
                        $hit = mysqli_query($conn, $request);
                        echo $hit;
                    }
                }
            }
        }
    }
}



?>

