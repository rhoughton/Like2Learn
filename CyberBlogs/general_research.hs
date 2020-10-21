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


My joke for CFB8 is it should be called CCFB b/c it's cipher crap feedback we want from it, that's to say using an initialization vector whenever the same input is converted to ciphertext that ciphertext will be different everytime! So one time cat will become 2353 and the next time its 9948 b/c a different initialization vector was used... esentially the feedback a bad guy would get from the ciphertext is crap! We want them to have crap. 
Remote Procedure Call (RPC)

Posted by: Margaret Rouse
WhatIs.com
  
Contributor(s): Linda Rosencrance; Bree Matturro; Phil Bowman; Fred Hazan

Remote Procedure Call (RPC) is a protocol that one program can use to request a service from a program located in another computer on a network without having to understand the network's details. RPC is used to call other processes on the remote systems like a local system. A procedure call is also sometimes known as a function call or a subroutine call.

RPC uses the client-server model. The requesting program is a client, and the service-providing program is the server. Like a regular or local procedure call, an RPC is a synchronous operation requiring the requesting program to be suspended until the results of the remote procedure are returned. However, the use of lightweight processes or threads that share the same address space enables multiple RPCs to be performed concurrently.

CONTENT CONTINUES BELOW
DOWNLOAD THIS FREE GUIDE

Your Complete Guide to API Design and Management
APIs allow organizations new and old, large and small to drastically improve the speed and efficiency of their operations, but getting to this point with APIs can be difficult. Read this guide to learn our experts’ best practices for designing and managing APIs.

Corporate E-mail Address:

I agree to TechTarget’s Terms of Use, Privacy Policy, and the transfer of my information to the United States for processing to provide me with relevant information as described in our Privacy Policy.

I agree to my information being processed by TechTarget and its Partners to contact me via phone, email, or other means regarding information relevant to my professional interests. I may unsubscribe at any time.
The interface definition language (IDL) -- the specification language used to describe a software component's application programming interface (API) -- is commonly used in Remote Procedure Call software. In this case, IDL provides a bridge between the machines at either end of the link that may be using different operating systems (OSes) and computer languages.

RPC message procedure
When program statements that use the RPC framework are compiled into an executable program, a stub is included in the compiled code that acts as the representative of the remote procedure code. When the program is run and the procedure call is issued, the stub receives the request and forwards it to a client runtime program in the local computer. The first time the client stub is invoked, it contacts a name server to determine the transport address where the server resides.

The client runtime program has the knowledge of how to address the remote computer and server application and sends the message across the network that requests the remote procedure. Similarly, the server includes a runtime program and stub that interface with the remote procedure itself. Response-request protocols are returned the same way.


RPC models and alternative methods for client-server communication
There are several RPC models and distributed computing implementations. A popular model and implementation is the Open Software Foundation's (OSF) Distributed Computing Environment (DCE). The Institute of Electrical and Electronics Engineers (IEEE) defines RPC in its ISO Remote Procedure Call Specification, ISO/IEC CD 11578 N6561, ISO/IEC, November 1991.

Alternative methods for client-server communication include message queueing and IBM's Advanced Program-to-Program Communication (APPC).

TLDr: L3 Telemetry-West tutorial
the word telemetry may differ in definition between industries (ie space, airborne, ground, etc)
tlm is data from an object (satellite) transmitted to a station to be displayed, recorded and/or analyzed. 
Transmission may occur over air, copper wire, and/or fiber optics. 
For today's telemetry applications a large # of measurands are transmitted in a group format (as a single data stream). Once recieved the stream is separated into individual componenents for analyis. 
Quote: "Real-time data is also
captured to storage media, such as disk and tape, for later analysis and archiving." is that what the res is for? 
time division multiplexing PCM
amplitude = height
frequency = timing

path name is the stuff with the slashes in it

-learning about boot code in an iso file, and the corresponding folders/files/drivers/executables
-7 Zip will allow you to extract those files from an iso "image"
-iptables blocked my nc requests, I discovered this by creating 2 Cent VMs and trying to connect.
-3rd sent tried to nc to 2nd Cent but recieved the msg "No route" which gave me something to ggl
-then discoverd via U&L stack, iptables were the culprit, and before with Pop & Ubu they were
just being plain dropped! No polite ICMP msg lol
-now before changing iptable rules I thought I'd get 3rd Cent to nmap 2nd just to see.
-I accidentily created a redundant folder, so went through the painstaking process of
navigating up the directory: cd ~/Documents/Emacs then mv (because rn didn't work, rename?)
so I mv old new directory.

-one of my learned assumptions today: by moving the iso file to another folder, my old vm
that relied on the file STILL worked! Then the new vm worked, yet couldn't accept the old file
path? That's ...buggy? Should I fix that? It's all about the "state" I think of the iso file
though that doesn't change! So it must not be a bug it's intended to keep the user from
confusing themselves.
-use sudo apt install speedtest-cli for a quick command line check of your internet speed
-day 1 speedtest output: 16Mbits down 8am
-interesting! if you cat /proc/cpuinfo or lscpu you get cpu info but two different versions of similar thingsP




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

Installing programs on Linux is different from Windows.
files come from a repository of programs that is usually tailored to your distro 
You access this repository using a Linux package manager or a Linux app store. 
The files that make up the programs in these repositories come in an archive format. This bundles everything into a single file for easy access and distribution. Debian, for example, uses the DEB format to store and distribute programs. These bundles are called binary packages.
You need a special program to extract these files and install them onto your computer, typically your package manager or app store. These tools also perform other useful functions, such as managing software updates.
Gentoo, being source-based, compiles a lot of its software, potentially making these systems run much lighter.

