#!/bin/bash
# politicalinformantdb

# Stop on errors
# See https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -Eeuo pipefail

# Sanity check command line options
usage() {
	echo "Usage: $0 (create|destroy|reset|dump|random)"
}

if [ $# -ne 1 ]; then
	usage
	exit 1
fi

# Parse argument.  $1 is the first argument
case $1 in
	"create")
    	if [ -e "var/politicalinformant.sqlite3" ]; then
      		echo "Error: database already exists"
    	else
			sqlite3 var/politicalinformant.sqlite3 < ../sql/schema.sql
			sqlite3 var/politicalinformant.sqlite3 < ../sql/data.sql
   	 	fi
    	;;

	"destroy")
    	rm -rf var/politicalinformant.sqlite3
    	;;

  	"reset")
		rm -rf var/politicalinformant.sqlite3
		sqlite3 var/politicalinformant.sqlite3 < ../sql/schema.sql
		sqlite3 var/politicalinformant.sqlite3 < ../sql/data.sql
    	;;
  *)
    usage
    exit 1
    ;;
esac