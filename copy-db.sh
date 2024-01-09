#!/bin/bash

ORIGIN_URI=$1
DEST_URI=$2
DUMP_FILE="dump.sql"

# Display the extracted values for origin and destination databases
echo "Origin Database - URI: $ORIGIN_URI"
echo "Destination Database - URI: $DEST_URI"
# Add your commands here that use these variables for both origin and destination databases

## Dump the schema without data
export PGSSLMODE=disable

pg_dump "$ORIGIN_URI" --schema-only > "$DUMP_FILE"

## Restore the dumped schema to the new database
psql "$DEST_URI" -f "$DUMP_FILE"
##
### Remove the dump file
rm $DUMP_FILE
