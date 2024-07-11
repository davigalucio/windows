###################################
# Reconfigura informações de Rede #
###################################
$dns1 = '192.168.0.250'
$dns2 = '8.8.8.8'
$dns3 = '127.0.0.1'

$interface = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | findstr "InterfaceAlias"
$InterfaceAlias = (($interface.Split(":"))[-1]).trim()
Set-DNSClientServerAddress -InterfaceAlias "$InterfaceAlias" -ServerAddresses ("$dns1","$dns2","$dns3")
Restart-NetAdapter -InterfaceAlias $InterfaceAlias

###################################
# Adiciona Zona Reversa Primaria  #
###################################
$ip1=(Get-NetIPConfiguration | findstr IPv4Address).Split(":,.")[1].trim()
$ip2=(Get-NetIPConfiguration | findstr IPv4Address).Split(":,.")[2].trim()
$ip3=(Get-NetIPConfiguration | findstr IPv4Address).Split(":,.")[3].trim()
$mask=(Get-NetIPAddress -InterfaceAlias "$InterfaceAlias" | findstr PrefixLength).Split(":")[1].trim()

Add-DnsServerPrimaryZone -NetworkID "$ip1.$ip2.$ip3.0/$mask" -ReplicationScope "Forest"


# Fonte:
# https://eltonbordim.com.br/instalando-o-servico-do-active-directory-domain-services-adds/
# https://learn.microsoft.com/pt-br/windows-server/networking/dns/manage-dns-zones?tabs=powershell
