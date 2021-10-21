# This will test the git_firewall.sh script
# Use "sudo bash git_firewall.sh to run that script
# Mark Craft

# Testing DNS
echo "Testing DNS"
echo "###################################################################"
nslookup espn.com

# Testing ping
echo "Testing ping"
echo "###################################################################"
ping -c 4 8.8.8.8

# Viewing icmp rules
echo "Viewing icmp rules"
echo "###################################################################"
iptables -L INPUT | grep "icmp"
iptables -L OUTPUT | grep "icmp"

# Viewing DNS rules
echo "Viewing DNS rules"
echo "###################################################################"
iptables -L INPUT | grep "domain state"
iptables -L OUTPUT | grep "domain state"

# Viewing HTTP and HTTPS rules
echo "Viewing http and https rules"
echo "###################################################################"
iptables -L INPUT | grep "http"
iptables -L OUTPUT | grep "http"

# Viewing LDAP rules
echo "Viewing LDAP rules"
echo "###################################################################"
iptables -L INPUT | grep "ldap"
iptables -L OUTPUT | grep "ldap"

# Viewing git rules
echo "Viewing git rules"
echo "###################################################################"
iptables -L INPUT | grep "git"
iptables -L OUTPUT | grep "git"

# Vieweing kerberos rules
echo "Viewing kerberos rules"
echo "###################################################################"
iptables -L INPUT | grep "kerberos"
iptables -L OUTPUT | grep "kerberos"

#Viewing SMB rules
echo "Viewing SMB rules"
echo "###################################################################"
iptables -L INPUT | grep "microsoft"
iptables -L OUTPUT | grep "microsoft"
#Viewing all OUTPUT rules
#iptables -L OUTPUT
#iptables -L OUTPUT
#iptables -L INPUT

