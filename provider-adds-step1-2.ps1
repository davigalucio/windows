$hostname = 'SRVADDS001M'
$pwdhost = 'Adds!1234@5.'

$ip = '192.168.0.250'
$mask = '24'
$gateway = '192.168.0.1'
$dns1 = '192.168.0.250'
$dns2 = '8.8.8.8'
$dns3 = '127.0.0.1'

# Ajusta o Fuso Horario
tzutil /s "E. South America Standard Time"

# Altera a senha atual
net user $ENV:username $pwdhost

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

#########################################
##          Desativa o DHCP            ##
#########################################
$interface = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | findstr "InterfaceAlias"
$InterfaceAlias = (($interface.Split(":"))[-1]).trim()
Set-NetIPInterface -InterfaceAlias "$InterfaceAlias" -Dhcp Disabled

#########################################
## Define IP, Mascara, Gateway e DNS   ##
#########################################
New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $ip -PrefixLength $mask -DefaultGateway $gateway
Set-DNSClientServerAddress -InterfaceAlias "$InterfaceAlias" -ServerAddresses ("$dns1","$dns2","$dns3")

#########################################
## Lista as Configurações setadas      ##
#########################################
echo
Get-NetIPConfiguration
echo
sleep 10
echo
# Altera o hostname
Rename-Computer -NewName "$hostname" -Restart
