Graylog 
powered by elastic search (stores then queries)
applications typically output through stdout
which can be cached using a docker driver
sends to Fluentd (TCP input, kafka produce)
a kafka logging driver doesn't exist for docker or we'd go directly from docker to kafka but instead we use Fluentd
after kafka, we use fluentd container as a kafka customer (instead of a kafka producer like before)
now all this goes to graylog server which tx and rx from elasticsearch.

1st I update centos via "yum update" interesting someone recieved an error after this on Stack Ex and the solution was the clean metadata? Well the cached mirrors of "your yum repositories" so on the next run of yum update it'll get a new list of mirrors. 
Also, I want to cat /etc/yum.repos.d but found out it's a folder but after a quick ls obviously the mirror list is in the file named base. 
Steps to install graylog:
ip addr show (write this down)
cd /etc/sysconfig/network-scripts/
then ls, you should see "ifcfg-eth0" then vi this 
so you can ensure BOOTPROTO = "static"
IPADDR= ? (what you wrote down) 
also note netmask, gateway, dns 1 & 2 then :q!
cd /
yum install java headless

sudo yum install epel-release
sudo yum install pwgen

Now you'll need to follow the directions from the mongodb documentation to set up a .repo file. 
yum install mongodb-org 

systemctl enable mongod.service
systemctl start mongod.service
status mongod 
ps aux | grep mongo

@9:52 rpms elastic search 

@15:50 take careful notes!
vi /etc/graylog/server/server.conf
password_secret = whatever 
 
echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1 
Enter password: admin
copy the hash and paste in server.conf 