APIs, tools, implementations
algorithms, protocols, mechanisms(?)

type-safe & automatic GC 

How are services implemented?
--as "providers" plugged into JDK
What is SPNEGO? SASL?
--?
How is Java designed to be safe?
--automatic mm, gc, and range-checking
What is the bytecode verified checking?
--checks compliance w/ java specs, rules & namespace restrictions. Also, mm violations, stack under/over flows and illegal data typecasts.
What 4 access lvls exist in Java?
--private, protected, public, package-private
What's the diff between protected and package-private?
--check stack overflow
II: providers(services) provide sec not the application made by the developer
II2: interoperable - services -> any apps

Part 2 Sec Providers and Classes 
What class provides security services to the Java app? 
-- java.security.Provider

How would one request a security service provided by a provider?
--use the relevant getInstance method. For ex.
    MessageDigest md = MessageDigest.getInstance("SHA-256");
--ex. 2:
    MessageDigest md = MessageDigest.getInstance("SHA-256", "ProviderC");

The names of the providers in this video are unique to which implementation of the Java platform?
--Oracle

What's DKS stand for?
--Domain keystore





















acronyms to remember: MAC = message authentication code, provides integrity of a message, relates to message digest?
HMAC = a type of MAC
SE = standard edition (JAVA)






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
