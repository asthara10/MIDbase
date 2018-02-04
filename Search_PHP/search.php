<?php
    $id = mysqli_connect("localhost", "root", "Krosis1-Nakin2") or die("Error connecting to database: ".mysqli_error());
    /*
        localhost - it's location of the mysql server, usually localhost
        root - your username
        third is your password 
         
        if connection fails it will stop loading the page and display an error
    */
     
	$textFields = Array('Disease.Diseasename', 'Disease.idMIM', 'Gene.GeneName', 'Gene.idENSEMBL', 'Location.CythogeneticLocation', 'Microindel.Name', 'Reference.DB');
	//Fields to look into on text searches. Previously settled as fullindexes Eventually this will go to globals_miod.php

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
echo "No syntactic errors\n";
    if(strlen($query) > 0){ // boolean true if the variable was empty or with spaces
    	foreach (array_values($textFields) as $field) {
		$ORconds[] = "MATCH (" . $field . ") AGAINST ('" . $query . "' IN BOOLEAN MODE)";
	}
	
	echo join(" OR ",$ORconds);
        $query = htmlspecialchars($query); 
        // changes characters used in html to their equivalents, for example: < to &gt;
         
        $query = mysqli_real_escape_string($id, $query);
        // makes sure nobody uses SQL injection
       
        $raw_results = mysqli_query($id, "SELECT * FROM Microindel WHERE (`Name` LIKE '%".$query."%')") or die(mysqli_error());
        // * means that it selects all fields
        // Microindel is the name of our table
         
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


?> 

</body>
</html>



