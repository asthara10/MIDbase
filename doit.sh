cd merged_data/
mysql -u root -p< CreateDB.sql 
./fromTABLEtoSQL_merged.py > merged_data.sql
cd ..
mysql -u root -p< CreateDB.sql
mysql -u root -p < merged_data/merged_data.sql 
