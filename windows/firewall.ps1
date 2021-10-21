# Windows Firewall Config script
# Mark Craft

# Remove all firewall rules
Remove-NetFirewallRule -ALL

# Default to block inbound and outbound traffic
Set-NetFirewallProfile -DefaultInboundAction Block -DefaultOutboundAction Block

# Allow inbound and outbound UDP DNS traffic
New-NetFirewallRule -DisplayName 'DNS UDP Inbound' -Direction Inbound -Action Allow -Protocol UDP -LocalPort 53
New-NetFirewallRule -DisplayName 'DNS UDP Outbound' -Direction Outbound -Action Allow -Protocol UDP

# Allow inbound and outbound TCP DNS traffic
New-NetFirewallRule -DisplayName 'DNS TCP Inbound' -Direction Inbound -Action Allow -Protocol TCP -RemoteAddress DNS -LocalPort 53
New-NetFirewallRule -DisplayName 'DNS TCP Outbound' -Direction Outbound -Action Allow -Protocol TCP -RemoteAddress DNS

# Allow HTTPS traffic only though Google chrome
New-NetFirewallRule -DisplayName 'HTTP TCP inbound' -Direction Inbound -Action Allow -Program %ProgramFiles%\Google\Chrome\Application\chrome.exe -Protocol TCP -LocalPort 80
New-NetFirewallRule -DisplayName 'HTTP TCP outbound' -Direction Outbound -Action Allow -Program %ProgramFiles%\Google\Chrome\Application\chrome.exe. -Protocol TCP -RemotePort 80

# Allow HTTPS traffic only though Google chrome
New-NetFirewallRule -DisplayName 'HTTPS TCP inbound' -Direction Inbound -Action Allow -Program %ProgramFiles%\Google\Chrome\Application\chrome.exe -Protocol TCP -LocalPort 443
New-NetFirewallRule -DisplayName 'HTTPS TCP outbound' -Direction Outbound -Action Allow -Program %ProgramFiles%\Google\Chrome\Application\chrome.exe. -Protocol TCP -RemotePort 443

# Allow inbound and outbound UDP LDAP traffic
New-NetFirewallRule -DisplayName 'LDAP UDP Inbound' -Direction Inbound -Action Allow -Protocol UDP -RemoteAddress 192.168.183.0/24 -LocalPort 389
New-NetFirewallRule -DisplayName 'LDAP UDP Outbound' -Direction Outbound -Action Allow -Protocol UDP -RemoteAddress 192.168.183.0/24

# Allow inbound and outbound TCP LDAP traffic
New-NetFirewallRule -DisplayName 'LDAP TCP Inbound' -Direction Inbound -Action Allow -Protocol TCP -RemoteAddress 192.168.183.0/24 -LocalPort 389
New-NetFirewallRule -DisplayName 'LDAP TCP Outbound' -Direction Outbound -Action Allow -Protocol TCP -RemoteAddress 192.168.183.0/24

# Allow inbound and outbound ICMP traffic
New-NetFirewallRule -DisplayName 'ICMP Inbound' -Direction Inbound -Action Allow -Protocol ICMPv4
New-NetFirewallRule -DisplayName 'ICMP Outbound' -Direction Outbound -Action Allow -Protocol ICMPv4

# Allow inbound and outbound TCP Kerberos traffic only using the installed kerberos executable
New-NetFirewallRule -DisplayName 'Kerb. TCP inbound' -Direction Inbound -Action Allow -Program %ProgramFiles%\MIT\Kerberos\bin\MIT\Kerberos.exe -Protocol TCP -RemoteAddress 192.168.183.0/24 -LocalPort 88
New-NetFirewallRule -DisplayName 'Kerb. TCP outbound' -Direction Outbound -Action Allow -Program %ProgramFiles%\MIT\Kerberos\bin\MIT\Kerberos.exe -Protocol TCP -RemoteAddress 192.168.183.0/24

# Allow inbound and outbound UDP Kerberos traffic
New-NetFirewallRule -DisplayName 'Kerb. UDP inbound' -Direction Inbound -Action Allow -Program %ProgramFiles%\MIT\Kerberos\bin\MIT\Kerberos.exe -Protocol UDP -RemoteAddress 192.168.183.0/24 -LocalPort 88
New-NetFirewallRule -DisplayName 'Kerb. UDP outbound' -Direction Outbound -Action Allow -Program %ProgramFiles%\MIT\Kerberos\bin\MIT\Kerberos.exe -Protocol UDP -RemoteAddress 192.168.183.0/24

# Allow inobund and outbound SMB traffic
New-NetFirewallRule -DisplayName 'SMB inbound' -Direction Inbound -Action Allow -Protocol TCP -RemoteAddress 192.168.183.0/24 -LocalPort 445
New-NetFirewallRule -DisplayName 'SMB outbound' -Direction Outbound -Action Allow -Protocol TCP -RemoteAddress 192.168.183.0/24


                                                                                                                                                                                                                             