<?php
    $id = mysqli_connect("localhost", "admiod", "Microindels4") or die("Error connecting to database: ".mysqli_error());
    /*
        localhost - it's location of the mysql server, usually localhost
        root - your username
        third is your password 
         
        if connection fails it will stop loading the page and display an error
    */
	
    $textFields = Array('Disease.DiseaseName',
    'Disease.idMIM',
    'Gene.GeneName',
    'Gene.idENSEMBL',
    'Microindel.Name',
    'Microindel.Info',
    'Reference.PMID', 
    'Reference.DB');
	//Fields to look into on text searches. Previously settled as fullindexes Eventually this will go to globals_miod.php

	$select_search = "SELECT distinct 
    Microindel.Name,
    Location.StartGRCh38,Location.EndGRCh38,
    ClinicalSignificance.Value,
    Reference.PMID 
    FROM 
    Microindel,
    Location,
    Gene,
    Microindel_has_ClinicalSignificance,
    ClinicalSignificance,Disease,
    Microindel_has_Disease,Microindel_has_Reference,
    Reference 
    WHERE 
    Microindel.idMicroindel=Microindel_has_Disease.Microindel_idMicroindel AND 
    Microindel_has_Disease.Disease_idDisease=Disease.idDisease AND 
    Microindel.idMicroindel=Location.Microindel_idMicroindel AND 
    Location.idLocation=Gene.Location_idLocation AND  
    Microindel.idMicroindel=Microindel_has_ClinicalSignificance.Microindel_idMicroindel AND 
    Microindel_has_ClinicalSignificance.ClinicalSignificance_idClinicalSignificance=ClinicalSignificance.idClinicalSignificance AND 
    Microindel.idMicroindel=Microindel_has_Reference.Microindel_idMicroindel AND 
    Microindel_has_Reference.Reference_idReference=Reference.idReference AND ( 
";
	/*The first part of any text search. Outputs the selected fields FROM the selected tables WHERE the primary keys and foreign keys 
	match between them. It's complicate to understnad, ask me if any doubt (By: David)*/

    mysqli_select_db($id, "miod") or die(mysqli_error());
    //miod is the name of database we've created     
?>

<?php
    $query = $_GET['query'];
    // gets value sent over search form

    $query = trim($query); 
    //Removes withespaces at the beggining and ending of chain

    if (!$query) {
        print($_SERVER['HTTP_REFERER']);
        header('Location:'.$_SERVER['HTTP_REFERER']);
    }
    //return to origin webpage if query is empty

	
    $query = htmlspecialchars($query); 
    // changes characters used in html to their equivalents, for example: < to &gt;
         
    $query = mysqli_real_escape_string($id, $query);
    // makes sure nobody uses SQL injection

    $query = $query."*";
    //adding a wildchart at the end of the query we can match all word beggining by the query 

    foreach (array_values($textFields) as $field) {
    	$ORconds[] = "MATCH (" . $field . ") AGAINST ('" . $query . "' IN BOOLEAN MODE)";
	   //create a match() against() query for every field in textFields global variable 
    }
	$sql=$select_search.join(" OR ",$ORconds)." );";
	//appends the OR conditions created by the query to the select basic search

    $raw_results = mysqli_query($id, $sql) or die(mysqli_error());
	//executes sql query or return error message
	//Iterate on everyone of the FULLTEXT fields, looking for any word match
         
    if(mysqli_num_rows($raw_results) > 0){ // if one or more rows are returned do following
        $results =  mysqli_fetch_array($raw_results);
    }
    var_dump($raw_results);
    foreach ($raw_results as $row) {
        print($row["Name"]);    
    }

    #import common header
    print(file_get_contents("./patró.html"));
?> 

<html>
<head>
    <title>Search</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="MIOD_styles.css"/>
    <!--bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!--datatables-->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
</head>
<body>
    <div class="output-header">
    	<h1>MIOD-Search results</h1>
    	<p><strong>Number of hits: </strong><?php echo count($GLOBALS['results']),"\n"; ?></p>
    </div>
    <div class="output">
    	<table id="dataTable">
    		<thead>
                <tr>
        			<th rowspan="2"><strong>Microindel name<strong></th>
        			<th colspan="2" ><strong>Location<strong></th>
        			<th rowspan="2"><strong>Clinical significance<strong></th>
        			<th rowspan="2"><strong>Reference PubmedID<strong></th>
                </tr>
                <tr>
                    <td><strong>Start<strong></th>
                    <td><strong>End<strong></th>
                </tr>           
    		</thead>
            <tbody>
    				<?php
    			foreach ($GLOBALS['raw_results'] as $row){
    				echo "<tr><td><a Name=\"$query\" href=\"output.php\">",$row['Name'],"</a></td><td>",$row['StartGRCh38'],"</td><td>",$row['EndGRCh38'],"</td><td>",$row['Value'],"</td><td>",$row['PMID'],"</td></tr>";
    			} 
    		?>
            </tbody>	
    	</table>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
        $('#dataTable').DataTable();
    });
    </script>
</body>
</html>