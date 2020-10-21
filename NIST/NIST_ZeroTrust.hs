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

Part 5 Deployment Models p. 22 
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
https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-207.pdf 

Part 6 Trust Algorithm Data Sources pg.17
policy engine = brain
trust algo = primary thought 
What ultimately grants access to a resource?
--trust algo (TA)
What variables are considered during ACCESS REQUEST? 
--requestor info like OS version, software used to make the request, path level, etc? or no? SECURITY POSTURE
What is a "role?"
--collection of priviliges 
What is in a subject database?
--past behavior, time, geolocation, 
What is in the asset database? 
--OS version, software present on asset, integrity(?), location: network & geo, & patch level.
resource requirements = minimum levels for access e.g. MFA network location, data sensitivity(?), asset configs 
How is the weight of each data source determined? 
--creator(s) of the algorithm determine it, and/or your organization can configure it

Part 7 Trust Algorithm Variations pg. 19 / 28 in pdf
What are the 2 differing characteristics of a TA?
--evaluating factors vs. evaluating requests 
Describe criteria vs score
--criteria configured for every resource, or a score computed based on values obtained from data sources (like we covered above?)
Why is a singular TA awful?
--b/c history matters! else we are doomed to repeat the bad...
Describe a contextual based TA:
--using information from the PE, a break in the pattern of past behavior may trigger a denail to a resource
Trust Algorithms help us not rely on human administrators 

Acronyms 
PA = policy administrator
SIEM = Security Information and Event Monitoring
 trust algorithm (TA)



TODO: SP 800-63
[SP800-162] [NISTIR 7987]
Comments on this publication may be submitted to:
National Institute of Standards and Technology
Attn: Advanced Network Technologies Division, Information Technology Laboratory
100 Bureau Drive (Mail Stop 8920) Gaithersburg, MD 20899-8920
Email: zerotrust-arch@nist.gov 

TODO::Whats FICAM TIC and CDM?
pg. 22 "could be set up lower of the" 
should be: "could be set up on lower layers of the OSI network stack"
pg. 3 "trust is never granted implicitly but must be continually evaluated."
should be: "never granted implicity and be..."
pg. 18 "e.g. CDM systems, threat intelligence services, etc described below"
nit pick: ?pg. 19 "e.g., FISMA, healthcare.."
should be: "FISMA, DOD" 

To update Windows Server go to server manager console. From the Dashboard click local server, the update settings are likely to be "Check for updates but let me choose whether to downlaod and install them" under the Choose your Windows Update settings. Click ok with this setting and now Checking for Updates loading bar will pop up. X number of important updates will be available, click that.
Choose security Update for Windows Server 2012 R2 (KB___?)
Now choose the option to restart.
Don't kill the computer why it's restarting, file corruption/loss can occur. Several reboots may be necessary. 

I know you guys probably don't automatically download updates b/c they can break development environments but at least dowload the security related ones right! Today is Sept 25th, the Aug 11th update was over a month ago I can't imagine an org waiting more than a week before ok'ing a sec update! 
I mean should I put that on my todo list each month, every Patch Tuesday look at the security update, assess whether that'll break dev then make  recommendation to apply? Hopefully all done by the end of the week? 