<!DOCTYPE html>
<html>
  <head>
    <title>Advanced Search</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="MIOD_styles.css">
    <!--Import header from patró.html-->
    <?php 
      include 'patro.php';
    ?> 

  </head>
  
  <body>
      <div id="header"></div>
      <div>
        <form method="GET" action="./advanced_search.php" name="advanced">
          <div class="container" class="form-control" class="form">
            <label>Name</label><input placeholder="Search by microindel name" class="form-control" type="text" name="Microindel.Name">
          </div>
          <div class="container" class="form-control" class="form">
            <label>Information</label><input placeholder="Search by microindel extra information, like sequence" class="form-control" type="text" name="Microindel.Info">
          </div>
          <div class="container" class="form-control" class="form">
            <label>Start Position</label><input placeholder="Search by microindel start position" class="form-control" type="text" name="Microindel.Start">
          </div>
          <div class="container" class="form-control" class="form">
            <label>End</label><input placeholder="Search by microindel end position" class="form-control" type="text" name="Microindel.End">
          </div>
          <div class="container" class="form-control" class="form">
            <label>Gene</label><input placeholder="Search by gene name" class="form-control" type="text" name="Gene.GeneName">
          </div>
          <div class="container" class="form-control" class="form">
            <label>Ensmbl ID</label><input placeholder="Search by Ensmbl ID" class="form-control" type="text" name="Gene.idENSEMBL">
          </div>
          <div class="container" class="form-control" class="form">
           <label>Strand</label><input placeholder="Search by Strand" class="form-control" type="text" name="Chromosome.Strand">
          </div>
          <div class="container" class="form-control" class="form">   
            <label>Chromosome</label><select class="form-control" name="Chromosome.Chromosome">
              <option value="">Any</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
              <option value="19">19</option>
              <option value="20">20</option>
              <option value="21">21</option>
              <option value="22">22</option>
              <option value="X">X</option>
              <option value="Y">Y</option>              
            </select>
          </div>
          <div class="container" class="form-control" class="form">
            <label>Clinical Significance</label><select class="form-control" name="ClinicalSignificance.Value">
              <option value="">Any</option>
              <option value="not_provided">Not provided</option>
              <option value="benign">Benign</option>
              <option value="likely_benign">Likely Benign</option>
              <option value="association">Association</option>
              <option value="sensitivity">Confers Sensitivity</option>
              <option value="drug_res">Drug Response</option>
              <option value="protective">Protective</option>
              <option value="risk">Risk Factor</option>
              <option value="likely_pathogenic">Likely Pathogenic</option>
              <option value="pathogenic">Pathogenic</option>
              <option value="uncertain">Uncertain Significance</option>
              <option value="other">Other</option>
            </select>
          </div>
          <div class="container" class="form-control" class="form">  
            <label>PMID</label><input placeholder="Search by PubMed ID" class="form-control" type="text" name="Reference.PMID">
          </div>
          <div class="container" class="form-control" class="form">
            <label>Disease</label><input placeholder="Search by disease name related to the microindel" class="form-control" type="text" name="Disease.DiseaseName">
            <label>IDMIM</label><input placeholder="Search by OMIM ID of the disease" class="form-control" type="text" name="Disease.IDMIM">
          </div>
          <div class="container">
            <button type="submit" class="button2">Submit</button><!-- mateixa class que sing in i sign up-->
          </div>
        </form>
      </div>
      <script>
        function RespMenu() {
          var x = document.getElementById("myMenu");
          if (x.className === "menu") {
            x.className += " responsive";
          } else {
            x.className = "menu";
          }
        } 
      </script>
      <script>
      // Get the modal
        var modal = document.getElementById('id01');

      // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
          if (event.target == modal) {
              modal.style.display = "none";
            }
        }
      </script>
  </body>
</html>
