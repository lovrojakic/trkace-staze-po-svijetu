#!/bin/bash

set -euo pipefail

trap 'catch' ERR
catch() {
	echo "An error has occurred!"
	exit 1
}

for opt in $@;
do 
	case $opt in
		init)
			psql postgres < queries/drop_database.sql
			psql postgres < queries/create_database.sql
			psql trkacestaze < queries/create_tables.sql
			psql trkacestaze < queries/populate_database.sql
			echo "Database init successful"
			;;
		drop)
			psql postgres < queries/drop_database.sql
			echo "Database drop successful"
			;;
		sql)
			pg_dump trkacestaze > trkace_staze_po_svijetu.sql
			echo "SQL dump successful"
			;;
		json)
			psql trkacestaze -P tuples_only < queries/export_json.sql > trkace_staze_po_svijetu.json
			echo "JSON dump successful"
			;;
		csv)
			psql trkacestaze < queries/export_csv.sql
			echo "CSV dump successful"
			;;
		*)
			echo "Unknown option $opt"
			;;
	esac
done
