#!/usr/bin/env bash

PCSCF=$1
NAME=$2
IP=$3

# Register 
sipp -i $IP -t u1 -p 5070 $PCSCF -nd -sf ./mcptt_register.xml -s $NAME -m 1 -bg -nostdin

sleep 2

echo "Starting Caller ..."
sipp -i $IP -t u1 -p 5070 $PCSCF -nd -sf ./caller.xml -mp 8000 -s $NAME -m 1  -trace_msg -message_file log/caller.log
