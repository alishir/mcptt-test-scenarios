#!/usr/bin/env bash

echo "Killing all SIPp instances ..."
pkill -9 sipp
echo "Registering MCPTT clients"
sipp -t u1 -p 5070 127.0.0.1:5060 -nd -sf ./mcptt_register.xml -s mcptt_01 -m 1 -bg -nostdin
sipp -t u1 -p 5080 127.0.0.1:5060 -nd -sf ./mcptt_register.xml -s mcptt_02 -m 1 -bg -nostdin
sipp -t u1 -p 5090 127.0.0.1:5060 -nd -sf ./mcptt_register.xml -s mcptt_03 -m 1 -bg -nostdin

sleep 2
pkill -9 sipp
echo "Starting Callee instances ..."
sipp -t u1 -p 5080 127.0.0.1:5060 -nd -sf ./peers.xml -s mcptt_02 -m 1 -bg -nostdin
sipp -t u1 -p 5090 127.0.0.1:5060 -nd -sf ./peers.xml -s mcptt_03 -m 1 -bg -nostdin

echo "Starting Caller ..."
sipp -t u1 -p 5070 127.0.0.1:5060 -nd -sf ./caller.xml -s mcptt_01 -m 1 
