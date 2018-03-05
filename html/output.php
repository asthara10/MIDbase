 <?php
    include "globals_miod.php";
    //include globals

    print(file_get_contents("./Public_html/patro.html"));
    //import common header from patró

    $name = $_REQUEST['query'];

    $sql = $select_search . "Microindel.Name = \"" . $name . "\");";

    $raw_results = mysqli_query($id, $sql) or die(mysqli_error());
    $results = mysqli_fetch_array($raw_results);
    //Transform results in an associative array, where keys are SQL column names 

    foreach ($results as $key => $value) {
        if ($value == "-") {
            $results[$key] = "Not avalible";
        }
    }
    //Transforming all "-" into "Not avalible", for I think they are more appropiate in this part of the web

    if($results['idENSEMBL'] != "Not avalible" ){
        $genename = "ENSEMBL id: " . $results['idENSEMBL'];
    }
    elseif($results['GeneName'] != "Not avalible" ){
        $genename = "Name: " . $results['GeneName'];
    }
    else{
        $genename = "Name: Not avalible";
    }
    //Select a genename with content

    if($results['DiseaseName'] != "Not avalible"){
        $disease = "Disease name: " . $results['DiseaseName'];
    }
    elseif($results['idMIM'] != "Not avalible"){
        $disease = "Disease idMIM: " . $results['idMIM'];
    }
    else{
        $disease = "Disease name: Not avalible";
    }
    
?> 
<html>
<head>
    <title>Search</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Public_html/MIOD_styles.css"/>
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
        <h1><?php echo $results["Name"]; ?></h1>
        <p><strong>Alleles:</strong></p>
        <ul type="none">
            <li><?php echo $results["Info"]; ?></li>
        </ul>
        <p><strong>Genomic location:</strong></p>
        <ul type="none">
            <li>Chromosome: <?php echo $results["Chromosome"]; ?></li>
            <li>Start: <?php echo $results["Start"]; ?></li>
            <li>End: <?php echo $results["End"]; ?></li>
        </ul>
        <p><strong>Associated gene:</strong></p>
        <ul type="none">
            <li><?php echo $genename; ?></li>
        </ul>
        <p><strong>Clinical significance:</strong></p>
        <ul type="none">
            <li>Clinical significance: <?php echo $results["Value"] ?></li>
            <li><?php echo $disease; ?></li>
        </ul>
        <p><strong>References:</strong></p>
        <ul type="none">
            <li>Pubmed id: <?php echo $results["PMID"] ?></li>
            <li>Source database: <?php echo $results["DB"]; ?></li>
        </ul>
    </div>
</body>
</html>

