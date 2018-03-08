# MIDbase
MIOD (Micro Indel Open Database) is a data base of microindels and microduplications.   

FOLDERS and FILES    
- **Database:** You will find the scripts needed to create the MIOD database.   
	- CreateDB.sql: creates an empty data base.   
	- miod_db.sql: created the database with all the data included.   
	- MIOD diagram.mwb: worckbench structure of the data base.   
- **media:** You will find the MIOD logo and some presentations with the initial specifications.   
- **web_app:** here are the files that construct the MIOD web application.   
	- globals_miod.php: global variables.   
	- **public_html:**   
		- **mediâ:** contains all images that appear in the web.   
		- **miod_scripts:** contains all php files to run the web.   
			- advanced_serch.php: allows an advanced search on the data base.   
			- login.php: allows to log in into the miod consortium.   
			- logout.php: allows to log out of the session.   
			- output.php: formats the search outputs.   
			- patro.php: the header navbar of all web pages.   
			- search.php: allows a global and basic search in the database.   
			- send_mail.php: allows to insert a comment in the database (mail-box).   
			- signup.php: allows to register into the miod consortium.   
			- submit_data.php: if you are signed in, allows to enter new data to the data base.   
		- **miod_web:** includes the files to create the visual web interface.   			- about.php: information about the MIOD developers.   
			- addField.js: allows to add a new field when entering new data to the data base.   
			- ad_search.php: form for the advanced search on the data base.   
			- Contact.php: form to send a comment.   
			- MIOD.php: initial page of the MIOD web.   
			- MIODform.php: form to introduce data to the data base.   
			- MIOD_styles.css: css to format the html.   
			- miod_template.txt: a template of the miod file format to insert data into the data base by a file.   
			- noresults.html: output for the no results in a search.   