#!/bin/bash

SCRIPTS_DIR=`dirname \`realpath $0\``
#SCRIPTPATH2="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"	
OPENC2X_DIR=`dirname $SCRIPTS_DIR`
WEB_DIR=$OPENC2X_DIR/webSite

if [ ! -d $WEB_DIR ]; then
	echo Web Folder does not exists!
	exit 0
fi

cd $WEB_DIR && python3 -m http.server

