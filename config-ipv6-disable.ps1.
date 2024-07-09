#########################################
##           Desativa o IPV6           ##
#########################################

# Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | findstr "InterfaceDescription | Index | InterfaceAlias | IPv4Address | IPv4DefaultGateway | DNSServer" | format-list
$interface = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | findstr "InterfaceAlias"
$InterfaceAlias = (($interface.Split(":"))[-1]).trim()

Get-NetIPv6Protocol | fl RandomizeIdentifiers
Set-NetIPv6Protocol -RandomizeIdentifiers Disabled
Get-NetIPv6Protocol | fl RandomizeIdentifiers

Get-NetAdapterBinding -ComponentID ms_tcpip6
Disable-NetAdapterBinding -InterfaceAlias "$InterfaceAlias" -ComponentID ms_tcpip6
Get-NetAdapterBinding -ComponentID ms_tcpip6
