g vpnr

VPNr is a simple helper to setup a SSH reverse tunnel using a public SSH proxy.

Used to setup a SSH reverse tunnel to a known public server.
The topology is as follows:

 A (behind firewall or not directly reachable)
 |
 |
 B (public server with sshd)
 |
 |
 C (client)

With this script we can setup a reverse tunnel from A to B so that C can connect
to A through B.

