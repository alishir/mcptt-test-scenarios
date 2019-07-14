#!/usr/bin/env bash

PCSCF=$1
NAME=$2

echo "Killing all SIPp instances ..."
pkill -9 sipp
pkill -9 ffmpeg

# Register 
sipp -t u1 -p 5070 $PCSCF -nd -sf ./mcptt_register.xml -s $NAME -m 1 -bg -nostdin

sleep 2
pkill -9 sipp

echo "Starting Caller ..."
sipp -t u1 -p 5070 $PCSCF -nd -sf ./caller.xml -mp 8000 -s $NAME -m 1 
