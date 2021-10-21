# Checking firewall script
# Mark Craft
# YOU MUST RUN THE firewall.ps1 script first


# Listing all the rules
# Get-NetFirewallRule -All
ECHO "#####################################################################################"
# Testing DNS
ECHO "Testing DNS"
Resolve-DnsName -Name espn.com
Resolve-DnsName -Name facebook.com

# Testing ping
ECHO "Testing ping"
ping 8.8.8.8
ECHO "#####################################################################################"
ECHO "DNS UDP Inbound" 
ECHO "#####################################################################################"
# Checking rules and ports for DNS
Get-NetFirewallRule -DisplayName "DNS UDP Inbound" | Get-NetFirewallAddressFilter
Get-NetFirewallRule -DisplayName "DNS UDP Inbound" | Get-NetfirewallPortFilter
ECHO "DNS UDP outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "DNS UDP outbound" | Get-NetFirewallAddressFilter
Get-NetFirewallRule -DisplayName "DNS UDP outbound" | Get-NetFirewallPortFilter
ECHO "DNS TCP inbound "
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "DNS TCP Inbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "DNS TCP Inbound" | Get-NetFirewallAddressFilter
ECHO "DNS TCP outbound "
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "DNS TCP Outbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "DNS TCP Outbound" | Get-NetFirewallAddressFilter

#Checking rules and ports for HTTPS and HTTP
ECHO "HTTP TCP inbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "HTTP TCP inbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "HTTP TCP inbound" | Get-NetFirewallAddressFilter
ECHO "HTTP TCP outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "HTTP TCP outbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "HTTP TCP outbound" | Get-NetFirewallAddressFilter
ECHO "HTTPS TCP inbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "HTTPS TCP inbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "HTTPS TCP inbound" | Get-NetFirewallAddressFilter
ECHO "HTTPS TCP outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "HTTPS TCP outbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "HTTPS TCP outbound" | Get-NetFirewallAddressFilter

#Checking rules and ports for LDAP
ECHO "LDAP UDP Inbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "LDAP UDP inbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "LDAP UDP inbound" | Get-NetFirewallAddressFilter
ECHO "LDAP UDP Outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "LDAP UDP outbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "LDAP UDP outbound" | Get-NetFirewallAddressFilter
ECHO "LDAP TCP Inbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "LDAP TCP inbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "LDAP TCP Inbound" | Get-NetFirewallAddressFilter
ECHO "LDAP TCP Outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "LDAP TCP outbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "LDAP TCP outbound" | Get-NetFirewallAddressFilter

#Checking rules and ICMP
ECHO "ICMP inbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "ICMP Inbound"
ECHO "ICMP outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "ICMP Outbound"

#Checking rules and ports for kerberos
ECHO "Kerberos TCP inbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "Kerb. TCP inbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "Kerb. TCP inbound" | Get-NetFirewallAddressFilter
ECHO "Kerberos TCP outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "Kerb. TCP outbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "Kerb. TCP outbound" | Get-NetFirewallAddressFilter
ECHO "Kerberso UDP inbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "Kerb. UDP inbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "Kerb. UDP inbound" | Get-NetFirewallAddressFilter
ECHO "Kerberos UDP outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "Kerb. UDP outbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "kerb. UDP outbound" | Get-NetFirewallAddressFilter

#Checking ruels and ports for SMB
ECHO "SMB inbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "SMB inbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "SMB inbound" | Get-NetFirewallAddressFilter
ECHO "SMB outbound"
ECHO "#####################################################################################"
Get-NetFirewallRule -DisplayName "SMB outbound" | Get-NetFirewallPortFilter
Get-NetFirewallRule -DisplayName "SMB outbound" | Get-NetFirewallAddressFilter