#!/usr/bin/python3

file_name = "genemap.txt"

with open(file_name) as fh:
	for line in fh: 
		line_content = line.split()
		for element in line_content:
			if element == 'microindel' or 'microdeletion' or 'microduplication':
				print(line)




#a partir del 12
