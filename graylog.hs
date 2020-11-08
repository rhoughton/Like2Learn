Graylog 
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

now to copy and paste, I had to create a virtual frame buffer so I can copy and paste (which relies on a graphical dependency)
yum install xorg-x11-server-Xvfb