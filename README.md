# SNMP
SNMP stands for Simple Network Monitoring Protocol. SNMP is a protocol for management information transfer in networks, for use in LANs especially, depending on the chosen version. Its usefulness in network administration comes from the fact that it allows information about network-connected devices to be collected in a standardized way across a large variety of hardware and software types.

# Use the below commands to install and Configure Net-SNMP

* wget http://sourceforge.net/projects/net-snmp/files/net-snmp/5.7.3/net-snmp-5.7.3.tar.gz
* sudo apt-get install libperl-dev
* tar -xvzf net-snmp-5.7.3.tar.gz
* cd net-snmp-5.7.3/
* sudo ./configure
* sudo make
* sudo make install
* sudo apt-get install snmp-mibs-downloader
* sudo apt-get install snmpd
* /etc/init.d/snmpd start
