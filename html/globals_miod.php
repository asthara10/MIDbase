<?php
    $id = mysqli_connect("localhost", "admiod", "Microindels4") or die("Error connecting to database: ".mysqli_error());
    /*
        localhost - it's location of the mysql server, usually localhost
        root - your username
        third is your password 
         
        if connection fails it will stop loading the page and display an error
    */
	
    $textFields = Array(
    'Disease.DiseaseName',
    'Gene.GeneName',
    'Microindel.Name');
	//Fields to look into on text searches. Previously settled as fullindexes Eventually this will go to globals_miod.php

	$select_search = "SELECT distinct 
    *
    FROM 
    Microindel,
    Chromosome,
    Gene,
    Microindel_has_ClinicalSignificance,
    ClinicalSignificance,Disease,
    Microindel_has_Disease,Microindel_has_Reference,
    Reference 
    WHERE 
    Microindel.idMicroindel=Microindel_has_Disease.Microindel_idMicroindel AND 
    Microindel_has_Disease.Disease_idDisease=Disease.idDisease AND 
    Microindel.Gene_idGene=Gene.idGene AND 
    Microindel.Chromosome_idChromosome=Chromosome.idChromosome AND  
    Microindel.idMicroindel=Microindel_has_ClinicalSignificance.Microindel_idMicroindel AND 
    Microindel_has_ClinicalSignificance.ClinicalSignificance_idClinicalSignificance=ClinicalSignificance.idClinicalSignificance AND 
    Microindel.idMicroindel=Microindel_has_Reference.Microindel_idMicroindel AND 
    Microindel_has_Reference.Reference_idReference=Reference.idReference AND ( 
";
	/*The first part of any text search. Outputs the selected fields FROM the selected tables WHERE the primary keys and foreign keys 
	match between them. It's complicate to understnad, ask me if any doubt (By: David)*/

    mysqli_select_db($id, "miod") or die(mysqli_error());
    //miod is the name of database we've created  

    session_start();
    //To store querys

    $miodfile = array(
        'Microindel.Name',
        'Microindel.Start',
        'Microindel.End',
        'Chromosome.Chromosome',
        'Chromosome.Strand',
        'Gene.Name',
        'Gene.idENSEMBL',
        'Disease.DisaseName',
        'Disase.idMIM',
        'Clinical_Significance.Value',
        'Reference.PMID',
        'Microindel.Info', 
    );
    //Miod annotations structure. Each field is in the position it belongs in the miod file
?>
