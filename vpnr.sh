#!/bin/bash
#
# Author: Alessandro Paganelli (alessandro.paganelli@gmail.com)
# 2020/3/11
#
#------------------------------------------------------------------------------
# Used to setup a SSH reverse tunnel to a known public server.
# The topology is as follows:
#
# A (behind firewall or not directly reachable)
# |
# |
# B (public server with sshd)
# |
# |
# C (client)
#------------------------------------------------------------------------------

# This is the port used by SSHd on A 
HIDDEN_NODE_PORT=22
# This is the port used by SSHd on B that we (C) use to connect to A through B (i.e., ssh -p $PROXYPORT user@B
REVERSE_TUNNEL_PORT=6644
# This is the port used by SSHd on B to listen for incoming SSH connections. Normally it is 22.
PROXY_SSHD_PORT=22

# User on B
USER_B=user

# B fqdn or IP
PROXY=publicip.example.org

#------------------------------------------------------------------------------
# Actual script

echo "------------------------------"
echo "        VPNr started"
echo
echo "Using proxy:                   $PROXY"
echo "Proxy ssh port:                $PROXY_SSHD_PORT"
echo "Reverse tunnel ssh port:       $REVERSE_TUNNEL_PORT"
echo "Remote (hidden) node ssh port: $HIDDEN_NODE_PORT"


ssh -Ng -R *:$REVERSE_TUNNEL_PORT:localhost:$HIDDEN_NODE_PORT -p $PROXY_SSHD_PORT -o ServerAliveInterval=20 $USER_B@$PROXY


