general_research.hs
SNMPv3
oid define what you can monitor
coffe pot example is great but maybe a more relevant one is the "interface" one, for each oid associated with a particular interface, I can monitor how many packets are coming in.  
snmp creates the structure you can use through monitoring services like PRTG
PRTG can import the MIB (database) of oids, MIB is like a library of oids
below are configuration commands 
to configure:
conf t
snmp-server view ALL-ACCESS 