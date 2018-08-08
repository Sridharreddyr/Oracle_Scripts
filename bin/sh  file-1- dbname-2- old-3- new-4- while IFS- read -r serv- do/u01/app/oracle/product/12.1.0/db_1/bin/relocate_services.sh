# Script to relocate services from one instance to another instance.
# Usage: relocate_services.sh <file_with_list_of_services> <db_name> <instance_to_relocate_service_from> <instance_to_relocate_service_to>
#/bin/sh

file="$1"
dbname="$2"
old_inst="$3"
new_inst="$4"
while IFS= read -r serv; do
$ORACLE_HOME/bin/srvctl relocate service -service $serv -db $dbname -oldinst $old_inst -newinst $new_inst
done < "$file"
