# Bash Gitlab firewall script
# Mark Craft

# Clear all firewall rules
iptables -F

# Set default firewall policy
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Addresses for the servers
GIT_SERVER="192.168.183.132"
AD_SERVER="192.168.183.129"
# Allow ICMP (ECHO request and response) connections
iptables -A INPUT -p icmp --icmp-type 8 -s 0/0 -d $GIT_SERVER  -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type 0 -d 0/0 -s $GIT_SERVER -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 0 -s 0/0 -d $GIT_SERVER -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type 8 -d 0/0 -s $GIT_SERVER -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT 

# Allow DNS traffic only to and from the AD server
iptables -A INPUT -p udp --sport 53 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 53 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow http traffic
iptables -A INPUT -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow https traffic
iptables -A INPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow ssh traffic only from machines in the same network
iptables -A INPUT -p tcp --dport 22 -s 192.168.183.0/24 -d $GIT_SERVER -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -d 192.168.183.0/24 -s $GIT_SERVER -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow git traffic
iptables -A INPUT -p tcp --dport 9418 -s 192.168.183.0/24 -d $GIT_SERVER -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 9418 -s $GIT_SERVER -d 192.168.183.0/24 -m state --state ESTABLISHED

#Allow LDAP traffic
iptables -A INPUT -p tcp --sport 389 -s $AD_SERVER -j ACCEPT
iptables -A OUTPUT -p tcp --dport 389 -d $AD_SERVER -j ACCEPT

#Allow Kerberos traffic
iptables -A INPUT -p tcp --sport 88 -s $AD_SERVER -j ACCEPT
iptables -A OUTPUT -p tcp --dport 88 -d $AD_SERVER -j ACCEPT
iptables -A INPUT -p udp --sport 88 -s $AD_SERVER -j ACCEPT
iptables -A OUTPUT -p udp --dport 88 -d $AD_SERVER -j ACCEPT

#Allow SMB traffic
iptables -A INPUT -p tcp --sport 445 -s $AD_SERVER -j ACCEPT
iptables -A OUTPUT -p tcp --dport 445 -d $AD_SERVER -j ACCEPT
