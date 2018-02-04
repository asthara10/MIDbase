<?php
    $id = mysqli_connect("localhost", "root", "Krosis1-Nakin2") or die("Error connecting to database: ".mysqli_error());
    /*
        localhost - it's location of the mysql server, usually localhost
        root - your username
        third is your password 
         
        if connection fails it will stop loading the page and display an error
    */
     
	$textFields = Array('Disease.DiseaseName', 'Disease.idMIM', 'Gene.GeneName', 'Gene.idENSEMBL', 'Microindel.Name','Microindel.Info', 'Reference.PMID', 'Reference.DB');
	//Fields to look into on text searches. Previously settled as fullindexes Eventually this will go to globals_miod.php

	$select_search = "SELECT distinct Microindel.Name,Gene.GeneName,Gene.idENSEMBL,ClinicalSignificance.Value 
FROM Microindel,Location,Gene,Microindel_has_ClinicalSignificance,ClinicalSignificance,Disease,Microindel_has_Disease,Microindel_has_Reference,Reference  WHERE Microindel.idMicroindel=Microindel_has_Disease.Microindel_idMicroindel AND Microindel_has_Disease.Disease_idDisease=Disease.idDisease AND Microindel.idMicroindel=Location.Microindel_idMicroindel AND Location.idLocation=Gene.Location_idLocation AND  Microindel.idMicroindel=Microindel_has_ClinicalSignificance.Microindel_idMicroindel AND Microindel_has_ClinicalSignificance.ClinicalSignificance_idClinicalSignificance=ClinicalSignificance.idClinicalSignificance AND Microindel.idMicroindel=Microindel_has_Reference.Microindel_idMicroindel AND 
Microindel_has_Reference.Reference_idReference=Reference.idReference AND ( 
";
	/*The first part of any text search. Outputs the selected fields FROM the selected tables WHERE the primary keys and foreign keys 
	match between them. It's complicate to understnad, ask me if any doubt (By: David)*/

    mysqli_select_db($id, "miod") or die(mysqli_error());
    //miod is the name of database we've created     
?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Search</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
 

<?php
    $query = $_GET['query'];
    // gets value sent over search form

    $query = trim($query); 
    //Removes withespaces at the beggining and ending of chain
echo "No syntactic errors\n\n";
    if(strlen($query) > 0){ // boolean true if the variable was empty or with spaces
	
        $query = htmlspecialchars($query); 
        // changes characters used in html to their equivalents, for example: < to &gt;
         
        $query = mysqli_real_escape_string($id, $query);
        // makes sure nobody uses SQL injection
       

    	foreach (array_values($textFields) as $field) {
		$ORconds[] = "MATCH (" . $field . ") AGAINST ('" . $query . "' IN BOOLEAN MODE)";
	}
	//create a match() against() query for every field in textFields global variable 

	$sql=$select_search.join(" OR ",$ORconds)." );";
	//appends the OR conditions created by the query to the select basic search

        $raw_results = mysqli_query($id, $sql) or die(mysqli_error());
	//executes sql query or return error message
	//Iterate on everyone of the FULLTEXT fields, looking for any word match
         
        if(mysqli_num_rows($raw_results) > 0){ // if one or more rows are returned do following
             
            while($results = mysqli_fetch_array($raw_results)){
            // $results = mysqli_fetch_array($raw_results) puts data from database into array, while it's valid it does the loop
             
                echo "<p><h3>".$results['Name']."</h3>".$results['Info']."</p>";
                // posts results gotten from database(title and text) you can also show id ($results['id'])
            }
             
        }
        else{ // if there is no matching rows do following
            echo "No results";
        }
         
    }
    else{ // if query length is less than minimum
        echo "Empty search. Write something, please!";
    }

//SELECT distinct Microindel.idMicroindel,Microindel.Name,Location.EndGRCh38  FROM Microindel,Location WHERE Microindel.idMicroindel=Location.Microindel_idMicroindel AND MATCH (Microindel.Name) AGAINST ("rs1305061" IN BOOLEAN MODE);
?> 

</body>
</html>



