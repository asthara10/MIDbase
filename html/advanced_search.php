<?php
    //Include globals
    include "globals_miod.php";

    $empty = True;

    //Create matches for every field completed
    foreach ($_REQUEST as $tablefield => $query) {
        $query = trim($query);
        //remove withespaces

        if (!empty($query)){
        $empty = False;
        //skip empty fields

            $query = mysqli_real_escape_string($id, $query);
            // makes sure nobody uses SQL injection

            $table_field = explode('_',$tablefield);
            $field = $table_field[0].".".$table_field[1];
            //The name of the input is the table.field corresponding. Split them by _ and create sql query

            if (in_array($field, $textFields)){
                $ANDconds[] = " " . $table_field[0] . "." . $table_field[1] . " LIKE '%" . $query . "%' ";
            }
            else{
                $ANDconds[] = " " . $table_field[0] . "." . $table_field[1] . " LIKE '" . $query . "' ";
            }
            //Regex-like searches only allowed in microindel name, disease name and gene name. All others are precise searches
            //I mean, if I search for chromosome 1, I only want results in chromosome 1 not in 1,10,11,12 and so on.
        }
    }

    if ($empty == True) {
        header('Location: ./search.html');
    }
    //return to origin webpage if query is empty

    $sql = $select_search.join(" AND ",$ANDconds)." );";
    //joining constrictions separated by AND and with the $select_search stored in globals

    $raw_results = mysqli_query($id, $sql) or die(mysqli_error());

    if(mysqli_num_rows($raw_results) > 0){ 
        $results =  mysqli_fetch_array($raw_results);
    }
    // if one or more rows are returned do following

    if ( !$results and $empty == False){
        header('Location: ./noresults.html');
    }

    if ($raw_results){
        var_dump($results);
    }
    //Go to noresults.html (still not done) if no result is found and query is not empty

    $counter = 0;
    foreach ($raw_results as $a) {
        $counter++;
    }
    //A weird way for obtaining the number of hits

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