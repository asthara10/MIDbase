#!/usr/bin/python3
import sys
import os

arxiu = sys.argv[1]

dades = open(arxiu,"r")

microin = {}
microid = 208

locations = {}
locationid = 221

clinsig = {}
IDclinsig = 2

disease = {}
iddisease = 16

reference = {}
idref = 16

gene = {}
idgene = 204

microsign = []

microdis = []

microref = []

for line in dades:
	lines = line.split("\t")

	#Microindel.txt
	if lines[5] not in microin.keys():
		microid += 1 	
		info = lines[10]
		microin[lines[5]] = (microid, "Not provided", info)

	#Location.txt
	if ((lines[1],lines[2])) not in locations.keys():
		locationid += 1
		strand = "Not provided"
		crom = lines[3] 
		locations[((lines[1],lines[2]))] = [ locationid, lines[1], lines[2], crom, strand, microid ]

	#Clinsig.txt	
	IDclinsig += 1
	clinsig[lines[12]] = (IDclinsig, "Pathogenic")

	#Disease.txt
	if lines[5] not in disease.keys():
		iddisease += 1
		idmim = lines[5]
		if lines[5] == "\n":
			dis = "Not provided"
		else:
			dis = lines[12]
		disease[lines[5]] = (iddisease, dis, idmim)

	#Reference.txt 
	if lines[13] not in reference.keys():
		idref += 1
		db = Pubmed
		codi = "Not provided"
		reference[lines[13]] =  (idref, codi, db)
	
	#Gene.txt
	if lines[5] not in gene.keys():
		idgene += 1
		gene[lines[5]] = (idgene,"-",locationid,lines[5])

	#MicroindelHasSign.txt
	if ((microid,IDclinsig)) not in microsign:
		microsign.append((microin[lines[5]][0],clinsig[lines[12]][0]))

	#MicroindelDisease.txt
	if ((microid, iddisease)) not in microdis:
		microdis.append((microin[lines[5]][0], disease[lines[14]][0]))

	#MicroindelRef.txt
	if ((microid, idref)) not in microref:
		microref.append((microin[lines[5]][0], reference[lines[13]][0]))

#Location.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_Location\tStart\tEnd\tCytonLoc\tStrand\tID_Microindel\n")
for key in locations.keys():
	locationfile.write("\t".join(str(x) for x in locations[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_location.txt; rm kirova.txt")

#Microindel.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_Microindel\tName\tInfo\n")
for key in microin.keys():
	locationfile.write("\t".join(str(x) for x in microin[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_Microindel.txt; rm kirova.txt")

#Clinsig.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_ClinSig\tValue\n")
for key in clinsig.keys():
	locationfile.write("\t".join(str(x) for x in clinsig[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_Clinsig.txt; rm kirova.txt")

#Disease.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_Disease\tDiseaseName\tID_MIM\n")
for key in disease.keys():
	locationfile.write("\t".join(str(x) for x in disease[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_Disease.txt; rm kirova.txt")

#Reference.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_Ref\tPMID\tDatabase\n")
for key in reference.keys():
	locationfile.write("\t".join(str(x) for x in reference[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_Reference.txt; rm kirova.txt")

#Gene.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_Gene\tGeneName\tID_Location\tID_Ensmbl\n")
for key in gene.keys():
	locationfile.write("\t".join(str(x) for x in gene[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_Gene.txt; rm kirova.txt")

#MicroindelHasSign.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_Microindel\tID_ClinSig\n")
for key in microsign:
	locationfile.write("\t".join(str(x) for x in key))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_MicroindelHasSign.txt; rm kirova.txt")

#MicroindelRef.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_Microindel\tID_Ref\n")
for key in microref:
	locationfile.write("\t".join(str(x) for x in key))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_MicroindelRef.txt; rm kirova.txt")

#MicroindelDisease.txt
locationfile = open("kirova.txt","w")
locationfile.write("ID_Microindel\tID_Disease\n")
for key in microdis:
	locationfile.write("\t".join(str(x) for x in key))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_location.txt; cat kirova.txt | sort -n > ENSEMBL_MicroindelDisease.txt; rm kirova.txt")

