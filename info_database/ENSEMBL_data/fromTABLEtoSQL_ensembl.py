#!/usr/bin/python3

import re

def read_tabular(txt_name):
	"""Genearator. Reads a tabular file and yields a list of tuples with the name of the column and the corresponding value.
	Argument: file.txt name"""
	with open(txt_name) as file:
		line = file.readline().rstrip('\n')
		headers = re.split(r'\t', line)
		for line in file:
			line = line.rstrip('\n')
			values = re.split(r'\t', line)
			j = 0
			comi = '"'
			for value in values:
				if isinstance(value, str):
					values[j] = '"' + value+'"'
				j += 1
			to_insert = []
			i = 0
			for name in headers:
				if values[i]:
					to_insert.append((headers[i], values[i]))
					i += 1
				else:
					i += 1
			yield(to_insert)
	file.close()

def insert_data(table_names, file_names):
	"""Prints the SQL commands to insert data into DB tables.
	Arguments: list of table names, list of file names"""
	i = 0
	for file in file_names:
		for to_insert in read_tabular(file):
			print("INSERT INTO %s (" %(table_names[i]), end='')
			first = True
			for tup in to_insert:
				if first:
					print("{}".format(tup[0]), end='')
					first = False
				else:
					print(", {}".format(tup[0]), end='')
			print(")")
			print("VALUES (", end='')
			first = True
			for tup in to_insert:
				if first:
					print("{}".format(tup[1]), end='')
					first = False
				else:
					print(", {}".format(tup[1]), end='')
			print(");")
		i += 1

#Lists of talbe names and file names to run the function
table_names = ["Chromosome", "Gene", "Microindel", "ClinicalSignificance", "Disease", "Reference", "Microindel_has_Reference", "Microindel_has_ClinicalSignificance", "Microindel_has_Disease"]
file_names = [ "ENSEMBL_Chromosome.txt", "ENSEMBL_Gene.txt", "ENSEMBL_Microindel.txt","ENSEMBL_Clinsig.txt", "ENSEMBL_Disease.txt", "ENSEMBL_Reference.txt", "ENSEMBL_MicroindelRef.txt", "ENSEMBL_MicroindelHasSign.txt", "ENSEMBL_MicroindelDisease.txt"]

#calling the function
#when executed in the terminal, save the output to a name.sql file. Ex: python3 fromTABLEtoSQL.py > InsertData.sql
insert_data(table_names, file_names)

#Append fulltext indexes
print('ALTER TABLE Microindel ADD FULLTEXT INDEX `FullText` (`Name` ASC);') 
print('ALTER TABLE Disease ADD FULLTEXT INDEX `FullText` (`DiseaseName` ASC);') 
print('ALTER TABLE Gene ADD FULLTEXT INDEX `FullText` (`GeneName` ASC);') 
