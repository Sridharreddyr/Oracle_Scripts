# Script to relocate services from one instance to another
# Usage: relocate_services.sh <file_with_list_of_services> <db_name> <instance_to_relocate_from> <instance_to_relocate_to>

#/bin/sh

file="$1"
dbname="$2"
old="$3"
new="$4"
while IFS= read -r serv; do
/u01/app/oracle/product/12.1.0/db_1/bin/srvctl relocate service -service $serv -db $dbname -oldinst $old -newinst $new
done < "$file"
