#!/bin/sh
# This script assumes that instructions in OpenC2X/README.txt have been followed

SESSION=OpenC2X
CURR_DIR=`pwd`
SCRIPTS_DIR=`dirname $0`
OPENC2X=`dirname $SCRIPTS_DIR`
BUILD_DIR=$OPENC2X/build/

tmux -2 new-session -d -s $SESSION
tmux set-option -g mouse
tmux new-window -t $SESSION:1 -n 'App'

tmux split-window -h

tmux select-pane -t 0
tmux split-window -v
 	
tmux select-pane -t 0	#for CAM
tmux send-keys "cam" C-m
tmux split-window -v 	#for DENM
tmux send-keys "denm" C-m

tmux select-pane -t 2	#for LDM
tmux send-keys "ldm" C-m
tmux split-window -v 	#for HTTPSERVER
tmux send-keys "httpServer" C-m

tmux select-pane -t 4
tmux split-window -v

tmux select-pane -t 4	#for DCC
tmux send-keys "dcc" C-m
tmux split-window -v 	#for ODB2
tmux send-keys "obd2" C-m

tmux select-pane -t 6	#for GPS
tmux send-keys "gpsService" C-m
tmux split-window -v 	#for WEB
tmux send-keys "$SCRIPTS_DIR/startWebOpenC2X.sh" C-m

tmux -2 attach-session -t $SESSION
