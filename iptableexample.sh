#To flush:
iptables --flush

#This will only be temporary - if you restart iptables, all the default rules will be enabled again

#To save current iptables:
service iptables save
#should save them to /etc/sysconfig/iptables ?

#To view these:
cat /etc/sysconfig/iptables

#If you flush then save the empty rules, you will permanently delete them


#Script to allow only SSH input to connect to server.

iptables --flush
service iptables save #so all rules are deleted

iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
#This effectively means; All incoming packets through eth0 for ssh will be accepted.

iptables -A INPUT -j DROP
#This line drops all incoming packets - which should TYPICALLY be the last rule in every chain.

iptables -L INPUT #Will list the rules in the INPUT chain
