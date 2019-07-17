#!/usr/bin/env bash

PCSCF=$1
NAME=$2
IP=$3

echo "Killing all SIPp instances ..."
pkill -9 sipp
# pkill -9 ffmpeg

# Register 
sipp -i $IP -t u1 -p 5080 $PCSCF -nd -sf ./mcptt_register.xml -s $NAME -m 1 -bg -nostdin

sleep 2
pkill -9 sipp

echo "Starting Peer..."
sipp -i $IP -t u1 -p 5080 $PCSCF -nd -sf ./peer_01.xml -mp 8040 -s $NAME -m 1
