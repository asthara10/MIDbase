<?php
/*
* Globals_miod.php
* Son les globals del profe, per tenir una referencia del que ens fara falta
*/
// Base directories
#$baseDir = $_SERVER['DOCUMENT_ROOT'].'/PDBBrowser';
$baseDir = '/home/dbw20/public_html/PDBBrowser';//Caldra decidirlo
$baseURL = dirname($_SERVER['SCRIPT_NAME']);//Aixo pot anar be

// Temporal dir, create if not exists
$tmpDir = "$baseDir/tmp";//Suposo que sempre es necesita una carpeta temporal
if (!file_exists($tmpDir))
	mkdir($tmpDir);

// Include directory
$incDir = "$baseDir/include";

// Load 
accessory routines
include_once "$incDir/bdconn.inc.php";
include_once "$incDir/libDBW.inc.php";

// Load predefined arrays
// Fulltext search fields
$textFields = Array('e.header', 'e.compound', 'a.author', 's.source', 'sq.header');

// Compounds
$rs = mysql_query("SELECT * from comptype") or print mysql_error();
while ($rsF = mysql_fetch_array($rs)) {
	$compTypeArray[$rsF['idCompType']] = $rsF;
}
//expTypes
$rs = mysql_query("SELECT * from expType") or print mysql_error();
while ($rsF = mysql_fetch_array($rs)) {
	$expTypeArray[$rsF['idExpType']] = $rsF;
}
//expClasses
$rs = mysql_query("SELECT * from expClasse") or print mysql_error();
while ($rsF = mysql_fetch_array($rs)) {
	$expClasseArray[$rsF['idExpClasse']] = $rsF;
}
// Start session to store queries
session_start();
