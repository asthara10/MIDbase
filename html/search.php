<?php
    include "globals_miod.php";
    //include globals

    $query = $_GET['query'];
    // gets value sent over search form

    $query = trim($query); 
    //Removes withespaces at the beggining and ending of chain

    if (!$query) {
        header('Location:'.$_SERVER['HTTP_REFERER']);
        $empty = False;
    }
    //return to origin webpage if query is empty

    $query = htmlspecialchars($query); 
    // changes characters used in html to their equivalents, for example: < to &gt;
         
    $query = mysqli_real_escape_string($id, $query);
    // makes sure nobody uses SQL injection

    foreach (array_values($textFields) as $field) {
    	$ORconds[] = " " . $field . " LIKE '%" . $query . "%' ";
	   //create a match() against() query for every field in textFields global variable 
    }

	$sql = $select_search.join(" OR ",$ORconds)." );";
	//appends the OR conditions created by the query to the select basic search

    $raw_results = mysqli_query($id, $sql) or die(mysqli_error());
	//executes sql query or return error message
	//Iterate on everyone of the FULLTEXT fields, looking for any word match
         
    if(mysqli_num_rows($raw_results) > 0){ // if one or more rows are returned do following
        $results =  mysqli_fetch_array($raw_results);
    }

    $counter = 0;
    foreach ($raw_results as $a) {
        $counter++;
    }
    //A weird way for obtaining the number of hits

    if (empty($results) and $empty !== False){
        header('Location: noresults.html');
    }
    //Go to noresults.html (still not done) if no result is found and query is not empty

    print(file_get_contents("./patró.html"));
    //import common header from patró   
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
    <div class="output-container">
        <div>
        	<h1>MIOD-Search results</h1>
        	<p><strong>Number of hits: </strong><?php print($GLOBALS['counter']); ?></p>
        </div>
        <div class="output">
        	<table id="dataTable"> 
        		<thead>
                    <tr>
            			<th><strong>Microindel name<strong></th>
            			<th><strong>Clinical significance<strong></th>
                        <th><strong>Associated Disease</strong></th>
            			<th><strong>Reference PubmedID<strong></th>
                    </tr>
        		</thead>
                <tbody>
        				<?php
        			foreach ($GLOBALS['raw_results'] as $row){
        				echo "
                        <tr><td><a href=\"output.php?query=",$row['Name'],"\">",$row['Name'],"</a></td>
                        <td>",$row['Value'],"</td>";
                        if($row['DiseaseName'] != "-"){
                            echo "<td>",$row['DiseaseName'],"</td>";
                        }
                        else{
                            echo "<td>",$row['idMIM'],"</td>";
                        }
                        echo "<td>",$row['PMID'],"</td></tr>";
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
    </div>
</body>
</html>