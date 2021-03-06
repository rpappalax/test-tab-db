#!/bin/bash

CREATION_DATE=1599087616271
IN_FILE=1000_urls.txt
SQL_FILE=insert.sql
DB_IN_FILE=browser.db
# remove file ext
DB_NAME="$(cut -d'.' -f1 <<< ${DB_IN_FILE})"


rm -f ${SQL_FILE}

# set row numbers for each test DB desired
if [ "$#" -eq 0 ]; then
    counters=( 10 20 40 80 160 320 960 )
else
    counters=( "$@" )
fi

function generate_sql() {
    ROW="INSERT INTO tabs (url, title, history, last_used) VALUES (\"https://${SITE}\", \"${SITE}\", '[\"https:\\\/\\\/${SITE}\\\/\"]', ${CREATION_DATE});"
    echo $ROW
}

source ./devices.sh

echo
echo
echo "---------------------------"
echo "GENERATE SQL FROM SITE LIST"
echo "---------------------------"
echo
while read SITE; do generate_sql; done < ./${IN_FILE} >>  ${SQL_FILE}

echo
echo "---------------------------"
echo "CREATE NEW ${DB_IN_FILE}"
echo "---------------------------"
echo

#for counter in "${counters[@]}"
#do  
#    cp ${DB_IN_FILE} "${DB_NAME}_${counter}.db"
#done

for counter in "${counters[@]}"
do  
    NEW_DB_IN_FILE="testTabsDatabase${counter}-${DB_NAME}.db"
    echo
    echo
    echo "---------------------------"
    echo "HYDRATE ${NEW_DB_IN_FILE}"
    echo "---------------------------"
    echo
    cp ${DB_IN_FILE} ${NEW_DB_IN_FILE} 
    for row in $(seq 1 $counter)
    do
        LINE=`sed -n "${row}p" ${SQL_FILE}`
        echo "ROW #${row}: ${LINE}"
        sqlite3 ${NEW_DB_IN_FILE} "${LINE}"
    done
done

echo
echo "-------------------------------"
echo "CLEANUP"
echo "-------------------------------"

rm *.db-* *.sql
ls -la
echo
echo
