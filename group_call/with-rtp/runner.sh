#!/usr/bin/env bash

pkill -9 ffmpeg
./register.sh

sleep 2
pkill -9 sipp
echo "Starting Callee instances ..."
sipp -t u1 -p 5080 127.0.0.1:5060 -nd -sf ./peer_01.xml -mp 8040 -s mcptt_02 -m 1 -bg -nostdin
sipp -t u1 -p 5090 127.0.0.1:5060 -nd -sf ./peer_02.xml -mp 8080 -s mcptt_03 -m 1 -bg -nostdin

echo "Starting Caller ..."
sipp -t u1 -p 5070 127.0.0.1:5060 -nd -sf ./caller.xml -mp 8000 -s mcptt_01 -m 1 
