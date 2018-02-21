#!/usr/bin/python3
import sys
import os

arxiu = sys.argv[1]

dades = open(arxiu,"r")

microin = {}
microid = 0

chromosomes = {}
idchromosome = 0

clinsig = {}
IDclinsig = 0

disease = {}
iddisease = 0

reference = {}
idref = 0

gene = {}
idgene = 0

microsign = []

microdis = []

microref = []

for line in dades:
	line = line.rstrip()
	lines = line.split("\t")
	#Chromosome.txt
	if ((lines[7],lines[11])) not in chromosomes.keys():
		idchromosome += 1
		strand = lines[11]
		crom = lines[7] 
		chromosomes[((lines[7],lines[11]))] = [ idchromosome, crom, strand]
	chromid = chromosomes[((lines[7],lines[11]))][0]

	#Gene.txt
	if lines[5] not in gene.keys():
		idgene += 1
		gene[lines[5]] = (idgene,"-",lines[5])
	genid = gene[lines[5]][0]

	#Microindel.txt
	if lines[0] not in microin.keys():
		microid += 1 	
		info = lines[10]
		microin[lines[0]] = (microid, lines[0], lines[8], lines[9], info, genid, chromid)

	#Clinsig.txt	
	if lines[12] not in clinsig.keys():
		IDclinsig += 1
		if lines[12] == "":
			clin = "-"
		else:
			clin = lines[12]
		clinsig[lines[12]] = (IDclinsig, clin)

	#Disease.txt
	if lines[14] not in disease.keys():
		iddisease += 1
		if lines[14] == "\n":
			dis = "-"
		else:
			dis = lines[14]
		disease[lines[14]] = (iddisease, dis, "-")

	#Reference.txt 
	if lines[13] not in reference.keys():
		idref += 1
		db = lines[6]
		if lines[13] == "":
			codi = "-"
		else:
			codi = lines[13]
		reference[lines[13]] =  (idref, codi, db)

	#MicroindelHasSign.txt
	if ((microid,IDclinsig)) not in microsign:
		microsign.append((microin[lines[0]][0],clinsig[lines[12]][0]))

	#MicroindelDisease.txt
	if ((microid, iddisease)) not in microdis:
		microdis.append((microin[lines[0]][0], disease[lines[14]][0]))

	#MicroindelRef.txt
	if ((microid, idref)) not in microref:
		microref.append((microin[lines[0]][0], reference[lines[13]][0]))
print(disease)
#Chromosome.txt
locationfile = open("kirova.txt","w")
locationfile.write("idChromosome\tChromosome\tStrand\n")
for key in chromosomes.keys():
	locationfile.write("\t".join(str(x) for x in chromosomes[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_Chromosome.txt; rm kirova.txt")

#Gene.txt
locationfile = open("kirova.txt","w")
locationfile.write("idGene\tGeneName\tidENSEMBL\n")
for key in gene.keys():
	locationfile.write("\t".join(str(x) for x in gene[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_Gene.txt; rm kirova.txt")

#Microindel.txt
locationfile = open("kirova.txt","w")
locationfile.write("idMicroindel\tName\tStart\tEnd\tInfo\tGene_idGene\tChromosome_idChromosome\n")
for key in microin.keys():
	locationfile.write("\t".join(str(x) for x in microin[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_Microindel.txt; rm kirova.txt")

#Clinsig.txt
locationfile = open("kirova.txt","w")
locationfile.write("idClinicalSignificance\tValue\n")
for key in clinsig.keys():
	locationfile.write("\t".join(str(x) for x in clinsig[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_Clinsig.txt; rm kirova.txt")

#Disease.txt
locationfile = open("kirova.txt","w")
locationfile.write("idDisease\tDiseaseName\tidMIM\n")
for key in disease.keys():
	locationfile.write("\t".join(str(x) for x in disease[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_Disease.txt; rm kirova.txt")

#Reference.txt
locationfile = open("kirova.txt","w")
locationfile.write("idReference\tPMID\tDB\n")
for key in reference.keys():
	locationfile.write("\t".join(str(x) for x in reference[key]))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_Reference.txt; rm kirova.txt")

#MicroindelHasSign.txt
locationfile = open("kirova.txt","w")
locationfile.write("Microindel_idMicroindel\tClinicalSignificance_idClinicalSignificance\n")
for key in microsign:
	locationfile.write("\t".join(str(x) for x in key))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_MicroindelHasSign.txt; rm kirova.txt")

#MicroindelRef.txt
locationfile = open("kirova.txt","w")
locationfile.write("Microindel_idMicroindel\tReference_idReference\n")
for key in microref:
	locationfile.write("\t".join(str(x) for x in key))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_MicroindelRef.txt; rm kirova.txt")

#MicroindelDisease.txt
locationfile = open("kirova.txt","w")
locationfile.write("Microindel_idMicroindel\tDisease_idDisease\n")
for key in microdis:
	locationfile.write("\t".join(str(x) for x in key))
	locationfile.write("\n")
locationfile.close()
os.system("touch ENSEMBL_Chromosome.txt; cat kirova.txt | sort -n > ENSEMBL_MicroindelDisease.txt; rm kirova.txt")

