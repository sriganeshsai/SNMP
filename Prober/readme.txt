
1. Save subagent.pl and counters.conf  files under "/tmp/t1/"

2. sudo chmod 777 snmpd.conf command is used to remove lock and edit snmpd.conf file

3. Restart snmpd by running below command in terminal
* sudo service snmpd restart

4. by running the below command in terminal we can see the counter values
* snmpget -v1 127.0.0.1:161 -cpublic <conuter oid1> <counter oid2> <counter oidn>

  example :  snmpget -v1 127.0.0.1:161 -cpublic 1.3.6.1.4.1.4171.40.1.5 1.3.6.1.4.1.4171.40.1.1 1.3.6.1.4.1.4171.40.1.3


Code explanation :

1.3.6.1.4.1.4171.40.1	Current unix timestamp
1.3.6.1.4.1.4171.40.2	Value of counter 1
1.3.6.1.4.1.4171.40.3	Value of counter 2
1.3.6.1.4.1.4171.40.4	Value of counter 3
....	....
1.3.6.1.4.1.4171.40.N	Value of counter N-1


The values of the counters are generated based on the following function:

y(t)=C*T;  (Make sure you only use the lower 32-bits when storing into OID)
Where,

T is the current UNIX time of the agent, integer seconds since 1970-01-01. 
C is the bitrate of the process [0,10e9] bit/second.

C is provided though a configuration file, 'counters.conf' that has the following format (ONLY and example, config file handle N counters):

id,C	Description
1,10e6	for counter 1,C = 10Mbps
2, 5e6	for counter 2,C = 5Mbps
3,100e6	for counter 3,C = 100Mbps
 
Values of 'y' are the values of the counter. configure SNMP agent to execute the subagent when an SNMP request is received.

