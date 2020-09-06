NIST zero trust architecture
-zt = no implicit trust based on location
Q: what types of resources will zt protect?
-- serices, network accounts, assets(applications?)
-focus = data & service protection
Q: what are some other examples of assets?
-- devices, ...virtual and cloud components
-stop = data beaches & lat mvmt 
Q: these principles can guide what?
-- system design, and operations.
---Q: What's in FIPS 199?

Part 2 Tenets of Zero Trust
-TIC & Firewalls = protection limited to outside the network
Q: what does PDP and PEP stand for?
-- policy decision point, policy envorcement point. 
Q: what is an analogy for the implicit zone of trust?
--Airport security, PDP/PEP is the security checkpoint
Q: name some tools used to implement a dynamic policy based on previously observed behavior?
-- subject and device analytics as well as measured deviations from observed usage patterns.

Part 3 pg. 17 ZT View of a Network
-always assume you are under attack, always use max security 
-PEP: policy enforcement point
-PDP: policy decision point 
Q: what does a PEP do?
--evaluates an orgs security posture
-section 3 (intro) Logical components
-"we've deployed a zero trust architecture in our organization" or "we use a zero trust architecture to secure our network & devices?"
Q: What inputs go into a trust algorithm? 
--CDM system, industry compliance, threat intelligence, activity logs
Q: What are the outputs? *hint 3
--grant, deny, or revoke access to resource
Q: What 2 intro components can go into a single service? 
--PA, policy dministrator and PE, policy engine. Bonus: What is each of these doing?
    --pa executes decisions, pe decides approve or deny
Q: what's in the great beyond? aka beyond PEP? 
--the trust zone

Part 4 detailing the data sources to the components
Q: What does a CDM system deliver?
--information like if there's an OS patch, vulnerable software detected, etc.
-Threat Intelligence nice for timeliness 
Q: What is an example of a ID mgmt sys?
--LDAP
Q: what are 3 approaches to ZTA for workflows?
--enhanced id gov, logical micro-segmentation, and net-based segmentation
-access to resources can be restricted based on a devices location

-place ppl in groups
-use gateway security components like firewalls to use as PEPs
-what is identify governance program (IGP)? 
-know your: SDP, SDN, and IBN (intent based networking) concepts.
-research what an overlay network refers to. 

Part 5 ? p. 22 
-intermediate certificates 
-certificate authorities
-organizations can use multiple models of ZTA
- what is the software agent responsible for in a agent/gateway deployment?
--directs traffic to the PEP (gateway)
Q: what type of model is used when hosting resources on a cloud?
--CSA-SDP cloud security alliance software defined perimiter the anti-byod approach
-models can be hybrid
-enclave good for situations lacking individual gateways
-individual resource protection can be an issue using this model 
Q: What is the one downside to using a application sandboxes?
--the PEP isn't scanning the device, so though threats exist and can't interact with apps, they still exist unknown to the org...



PEP -> PA -> PE ---
        agent<-- "configs"
        ---> trust zone 








TODO::Whats FICAM TIC and CDM?
pg. 22 "could be set up lower of the" 
should be: "could be set up on lower layers of the OSI network stack"
pg. 3 "trust is never granted implicitly but must be continually evaluated."
should be: "never granted implicity and be..."
pg. 18 "e.g. CDM systems, threat intelligence services, etc described below"
nit pick: ?pg. 19 "e.g., FISMA, healthcare.."
should be: "FISMA, DOD" 

Comments on this publication may be submitted to:
National Institute of Standards and Technology
Attn: Advanced Network Technologies Division, Information Technology Laboratory
100 Bureau Drive (Mail Stop 8920) Gaithersburg, MD 20899-8920
Email: zerotrust-arch@nist.gov 