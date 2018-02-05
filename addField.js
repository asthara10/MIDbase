		var genes = 1;
		var genelimit = 10;
		var ensmbls = 1;
		var ensmbllimit = 10;
		var PMIDs = 1;
		var PMIDlimit = 10;
		var diseases = 1;
		var diseaselimit = 10;
		var MIMs = 1;
		var MIMlimit = 10;

function addFields(divName){
	switch (divName) {
		case 'dynamicGene':
			if (genes == genelimit)  {
	  			alert("You have reached the limit of adding " + genes + " genes");
			}
			else {
	  			var newdiv = document.createElement('div');
	  			newdiv.innerHTML = "<label>Gene" + (genes + 1) + "</label><input class='form-control' type='text' name='gene[]'>";
	  			document.getElementById(divName).appendChild(newdiv);
	  			genes++;
          		var newdiv = document.createElement('div');
          		newdiv.innerHTML = "<label>Gene Ensmbl ID" + (ensmbls + 1) + "</label><input class='form-control' type='text' name='EnsmblID[]'>";
          		document.getElementById(divName).appendChild(newdiv);
          		ensmbls++;
	  		}
		break;
		case 'dynamicPMID':
     		if (PMIDs == PMIDlimit)  {
          		alert("You have reached the limit of adding " + PMIDs + " PubMed IDs");
     		}
     		else {
          		var newdiv = document.createElement('div');
          		newdiv.innerHTML = "<label>PMID" + (PMIDs + 1) + "</label><input class='form-control' type='text' name='PMID[]'>";
          		document.getElementById(divName).appendChild(newdiv);
          		PMIDs++;
     		}
		break;
		case 'dynamicDisease':
     		if (diseases == diseaselimit)  {
          		alert("You have reached the limit of adding " + diseases + " Diseases");
     		}
     		else {
          		var newdiv = document.createElement('div');
          		newdiv.innerHTML = "<label>Disease" + (diseases + 1) + "</label><input class='form-control' type='text' name='disease[]'>";
          		document.getElementById(divName).appendChild(newdiv);
          		diseases++;
          		var newdiv = document.createElement('div');
          		newdiv.innerHTML = "<label>IDMIM" + (MIMs + 1) + "</label><input class='form-control' type='text' name='IDMIM[]'>";
          		document.getElementById(divName).appendChild(newdiv);
          		MIMs++;
     		}
		break;
        default:
            alert("an error occured");
	}
}