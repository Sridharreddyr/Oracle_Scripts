#Script to check the status of a database services.
#Usage: check_services_status.sh <file_with_list_of_sevices> <db_name>
#/bin/sh

file="$1"
database="$2"
while IFS= read -r serv; do
$ORACLE_HOME/bin/srvctl status service -service $serv -db $database
done < "$file"
