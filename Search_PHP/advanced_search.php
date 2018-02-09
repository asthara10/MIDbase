<?php
    mysql_connect("localhost", "root", "") or die("Error connecting to database: ".mysql_error());
    /*
        localhost - it's location of the mysql server, usually localhost
        root - your username
        third is your password   
        if connection fails it will stop loading the page and display an error
    */   
    mysql_select_db("miod") or die(mysql_error());
    /* miod is the name of database we've created */     
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title> Advanced Search</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="MIODstyle.css"/>
</head>
<body>
<?php
    $VarID = "";
    $GeneID = "";
    $Loc = "";
    $Disease = "";
    $checkbox = "";
    $clinsig = ";"
    $advanced_search = "";

    $querycondition = "";
    if (!empty($_GET["Search"])) {
        $advanced_search = $_GET["advanced_search"];
        foreach ($$_GET["search"] as $key => $value) {
            if(!empty($value)){
                $querycases = array("VarID","GeneID","Loc","Disease","checkbox","clinsig");
                if(in_array($key, $querycases)) {
                    if(!empty($queryCondition)) {
                        $queryCondition .= " AND ";
                    } else {
                        $queryCondition .= " WHERE ";
                    }
                switch($key) {
                    case "VarID":
                        $raw_results = mysql_query("SELECT * FROM Microindel
                        WHERE (`Name` LIKE '%".$query."%')") or die(mysql_error());
                        if(mysql_num_rows($raw_results) > 0){ // if one or more rows are returned do following
                        while($results = mysql_fetch_array($raw_results)){
                        // $results = mysql_fetch_array($raw_results) puts data from database into array, while it's valid it does the loop
                        echo "<p><h3>".$results['Name']."</h3>".$results['Info']."</p>";
                            }
                        }
                        break;
                    case "GeneID":
                        $raw_results = mysql_query("SELECT * FROM Gene
                        WHERE (`Name` LIKE '%".$query."%')") or die(mysql_error());
                        if(mysql_num_rows($raw_results) > 0){ // if one or more rows are returned do following
                        while($results = mysql_fetch_array($raw_results)){
                        // $results = mysql_fetch_array($raw_results) puts data from database into array, while it's valid it does the loop
                        echo "<p><h3>".$results['Name']."</h3>".$results['Info']."</p>";
                            }
                        }
                        break;
                    case "Loc":
                        $raw_results = mysql_query("SELECT * FROM Location
                        WHERE (`Name` LIKE '%".$query."%')") or die(mysql_error());
                        if(mysql_num_rows($raw_results) > 0){ // if one or more rows are returned do following
                            while($results = mysql_fetch_array($raw_results)){
                        // $results = mysql_fetch_array($raw_results) puts data from database into array, while it's valid it does the loop
                                 echo "<p><h3>".$results['Name']."</h3>".$results['Info']."</p>";
                             }
                         }
                        break;
                    case "Disease":
                        $raw_results = mysql_query("SELECT * FROM Disease
                        WHERE (`Name` LIKE '%".$query."%')") or die(mysql_error());
                        if(mysql_num_rows($raw_results) > 0){ // if one or more rows are returned do following
                            while($results = mysql_fetch_array($raw_results)){
                        // $results = mysql_fetch_array($raw_results) puts data from database into array, while it's valid it does the loop
                            echo "<p><h3>".$results['Name']."</h3>".$results['Info']."</p>";
                             }
                         }
                        break;
                    case "checkbox":
                        $raw_results=mysql_query(SELECT * FROM `NOM TAULA?` WHERE `Ins` LIKE '%.$type.%' OR `Del` LIKE '%.$type.%' OR `Dup` LIKE '%.$type.%' OR `Oth` LIKE '%.$type.%');//Query stub
                        echo "raw_results"
                        break;
                    case "clinsig":
                        $clinsig = $_GET["search"]["clinsig"];
                        echo "clinsig"
                        break;
                    }
                }
            }
        }
    }
?>
