#########################################
##           Desativa o IPV6           ##
#########################################

## Lista o status dos adaptadores com IPV6
Get-NetAdapterBinding -ComponentID ms_tcpip6
## Verifica se esta ativo o protocolo IPV6
Get-NetIPv6Protocol | fl RandomizeIdentifiers

## Seleciona o primeiro adaptador de rede ativo
$interface = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | findstr "InterfaceAlias"
$InterfaceAlias = (($interface.Split(":"))[-1]).trim()

## Desativa o protocolo IPV6
Set-NetIPv6Protocol -RandomizeIdentifiers Disabled

## Desativa o componente IPV6 da interface de rede ativa
Disable-NetAdapterBinding -InterfaceAlias "$InterfaceAlias" -ComponentID ms_tcpip6

# Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | findstr "InterfaceDescription | Index | InterfaceAlias | IPv4Address | IPv4DefaultGateway | DNSServer" | format-list
