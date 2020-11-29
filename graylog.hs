do I have to do this everytime I fire up the vm?
systemctl enable elasticsearch.service
systemctl start elasticsearch.service 
systemctl enable graylog-server
systemctl start graylog-server 

powered by elastic search (stores then queries)
applications typically output through stdout
which can be cached using a docker driver
sends to Fluentd (TCP input, kafka produce)
a kafka logging driver doesn't exist for docker or we'd go directly from docker to kafka but instead we use Fluentd
after kafka, we use fluentd container as a kafka customer (instead of a kafka producer like before)
now all this goes to graylog server which tx and rx from elasticsearch.

1st I update centos via "yum update" 
cached mirrors of your "yum repositories" so on the next run of yum update it'll get a new list of mirrors. 
cat /etc/yum.repos.d 

Steps to install graylog:
type$ ip addr show (write this down)

cd /etc/sysconfig/network-scripts/
then ls, you should see "ifcfg-eth0" 
then vi ifcfg-eth0  
so you can ensure BOOTPROTO = "static"
IPADDR= ? (what you wrote down) 

yum install java headless

sudo yum install epel-release
sudo yum install pwgen

vi "/etc/yum.repos.d/mongodb-org-4.0.repo"
[mongodb-org-4.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc 
yum install mongodb-org 

systemctl daemon-reload 
systemctl enable mongod.service
systemctl start mongod.service
status mongod 
ps aux | grep mongo

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch 
vi /etc/yum.repos.d/elasticsearch.repo 
[elasticsearch-7.x]
name=elasticsearch repository for 7.x packages 
baseurl=https://artifacts.elastic.co/packages/oss-7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0 (I had to change this to zero for it to work)
autorefresh=1
type=rpm-md 

vi /etc/elasticsearch/elasticsearch.yml 
change the cluster name to graylog 
then add action.auto_create_index:false
:wq!

 chkconfig --add elasticsearch 
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl restart elasticsearch.service
now run a ps to see if elasticsearch is running
ps aux |grep elastic 
rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-3.0-repository_latest.rpm 

yum install graylog-server 

vi /etc/graylog/server/server.conf
password_secret = whatever you get from: pwgen -N 1 -s 96

now for the root_password_sha2 = whatever you get from:  
echo "admin" | sha256sum

chkconfig --add graylog-server
systemctl daemon-reload
systemctl enable graylog-server
systemctl start graylog-server

to see if it's running
    tail -f /var/log/graylog-server/server.log

start putting in logs
vi /etc/rsyslog.conf 
systemctl rsyslog
*.* @10.0.1.16:1514; 

service graylog-server restart 


I'm an idiot, i misspelled baseurl so ignore the below comment but keep for learning purposes and memory
this didn't work for me so I had to wget, but with a "broke" elasticsearch repo I typed in yum --disablerepo=elasticsearch yum install wget 
Then I typed 
https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-7.9.3-x86_64.rpm

establish ssh / ncat ability for centos:
I had to use a bridged adapter, I kept promiscious mode to deny, now ssh no prob. 

to create a virtual frame buffer so I can copy and paste (which relies on a graphical dependency)
yum install xorg-x11-server-Xvfb

Graylog: Arch Considerations 

Where are ingested messages stored?
--only in Elasticsearch

How bad would loosing an Elasticsearch cluster be? 
--horrible, unless you have baks of indices

What can a load balancer do in a bigger production setup?
--ping graylog nodes to see if alive, then take dead ones out. 

fastest machine data processing engine on the planet

What's another name for the syslog stream? 
--message cloud

What effects "seek time?"
--the location of the write "needle"

Why is putting the journal on disk in append only format (similar to Linkedin via Apache Kafka) a great idea?
--b/c messages won't get droped during spikes 

Disruptor library from LMAX (high speed trading company)

Messages written into process buffer (ring). 

Describe the CPU intensive part of the processing chain:
--msgs in the process buffer go through stream routing (?) and fields are extracted then sent to Elasticsearch(ES)

Where can fine tuning happen?
--processors per buffer (they should never exceed the # of cpu cores available)

What should happen if you see low throughput?
    --increase # of processors in process buffer NOT output buffer.

What's Mongo used for?
--storying metadata like users, settings, and configs on streams, dashboards, extrators, etc. 

Suggestion: run 3 instances 

How does graylog connect to ES? 
--as an embedded node that doesn't share data 

What are shards good for?
--fast searches 

Which questions should you ask when designing an index model?
--How much data do I have? How far back do I normally search? The answers will determine the size you make your indexes (which are then sharded). 

What is the deflector?
--an index alias ''

Reading Graylog docs part 2 
"Planning Log Collection"
-Guide 1st time users-
-use virt mach appliances (I editied!)-
-WARNING: appliances for PoC, labs, etc. not used in prod

What is 1 reason to go with a minimalist design? 
--performance (system and query)

What are some examples of "critical resources" that event sources are based on?
--LDAP server, Local servers, firewalls, network devices and key applications

Understanding the answer to these 2 questions is critical: 
1. What method does each event source use?
2. What resources are required? 

What is a log shipper?
--An applicaiton that reads logs from a local file on all servers (vet this before using)

What can you find at the graylog marketplace?
--plugins, content packs, GELF libraries, etc.

What are the 2 ways to retain logs?
--online or archived 

Describe the diff between online vs archived?
--Online is via Elasticsearch & you get to use the GUI, archive is compressed on graylog server or a file share but no GUI unless "reconstituted" 

What does this equation mean: GB/day x Ret. Days x 1.3 = storage req?
--You take the GB a day you log, multiply this by the retention your team decides on, then add a little to account for meta data. 

For example 5GB x 90 x 1.3 = 585 GB
 780 GB x 75% = 585

Notes on the Config section: 
 Why shouldn't you use an appliance in production? 
 --very UNSECURE

 What is SLES (OS package)? 
--?

What config mgmt tools are supported?
--chef, puppet, ANSIBLE

Should you use the same password_secret (64+ chars) on all graylog server nodes?
--yes! 

What is Lucene?
--? 

What do content packs provide?
--imports/exports of entire dashboards! 
--alerts!~

Graylog Docs pt 3 Downloading & Installing 
https://docs.graylog.org/en/3.3/pages/getting_started/download_install.html 

What's SLES?
--? 

what 2 files will you need to edit right after installation? 
--server.conf and elasticsearch.yml 

**DO NOT DO THIS STEP after the Virtual Appliance install***

Why do you need a master graylog server node?
--so it can perform periodical maintenance actions. 

What address is fine for a single development node on a server? 
--a loopback (127.0.0.1) address 

Part 4 Getting started - the pages  

use the pswd from the pswd secrete you derived 

What are streams?
--a form of tagging incoming messages 

What are they good for?
--categorizing! which message -> stream 

Where are messages routed? (logs?)
--to an index for storage

edit* Streams will also help determine which messages will be archived.

What are some examples of field values?
--counts, avgs, totals

What's the node page show?
--detailed health info and metrics 

What 2 types of auth does Graylog support?
--LDAP & Active Directory 

What does a processing pipeline allow?
--to run rules against specific events

Where are pipelines tied to?
--streams!

Give examples of pipeline actions?
--routing, blacklisting, or modifying messages 

Part 5 collecting messages

What type of file format is used to share content packs?
--json 

What has to happen if Graylog isn't running as root?
--you have to use ports higher than 1024 

What cmd can you use to see if traffic is incoming to a particular port?
    --sudo tcpdump -i lo host 127.0.0.1 and udp port 5014 
--sudo netstat -peanut | grep ":5014"

Part 6 (but you can watch this in any order) 

Java 11 testers welcome!
--still true? 11/29/20

Appliance: user ubuntu and the password ubuntu

Maybe I need this:
/etc/netplan/ (setup fixed IP) 
/var/lib/graylog-server/firstboot
-----------
To update my CentOS:
$ sudo rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-3.3-repository_latest.rpm
$ sudo yum clean all
$ sudo yum install graylog-server

To update plugins:
sudo yum install graylog-server graylog-enterprise-plugins graylog-integrations-plugins graylog-enterprise-integrations-plugins

What's challenging about using Graylog in Kubernets? 
--setting the is_master=true in only one node of the cluster 
