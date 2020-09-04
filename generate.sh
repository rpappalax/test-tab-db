#!/bin/bash

CREATION_DATE=1599087616271
IN_FILE=1000_urls.txt
OUT_FILE=insert.sql
DB_IN_FILE=browser.db

function generate_sql() {
    ROW="INSERT INTO tabs (url, title, history, last_used) VALUES (\"https://${SITE}\", \"${SITE}\", "[\"https:\\\/\\\/${SITE}\\\/\"]", ${CREATION_DATE});"
    echo $ROW
}

rm -f ${OUT_FILE}
while read SITE; do generate_sql; done < ./${IN_FILE} >>  ${OUT_FILE}
while read ROW; do sqlite3 ${DB_IN_FILE}; done < ./${OUT_FILE}

