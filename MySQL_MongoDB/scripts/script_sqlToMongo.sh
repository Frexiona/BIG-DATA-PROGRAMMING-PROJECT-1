#!/bin/bash

usr=cs18202514
pw=qRgH5rzy
db=cs18202514

mysql -u $usr -p$pw -D $db -e "Select table_name from information_schema.tables where table_type = 'BASE TABLE'" | tail -n +2 > tables.txt

filename="tables.txt"
while read -r line; do
	name="$line"
	mysql -u $usr -p$pw -D $db -e "select * from $name" | sed  's/\t/,/g' > ./mysql_csv/$name.csv	
done < "$filename"

echo "--------------------------------------"
echo "MYSQL EXPORT IS DONE !!!!!!!!!!!!!!!!!"
echo "--------------------------------------"

while read -r line; do
	name="$line"
	mongoimport -d $db -c $name --type csv --file ./mysql_csv/$name.csv --headerline
done < "$filename"

echo "--------------------------------------"
echo "MONGODB IMPORT IS DONE !!!!!!!!!!!!!!!"
echo "--------------------------------------"
