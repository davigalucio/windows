$ip = '192.168.0.250'
$mask = '24'
$gateway = '192.168.0.1'
$dns1 = '192.168.0.1'    ## Se tiver AD, alterar para o IP do Servidor AD
$dns2 = '8.8.8.8'        ## DNS Público da Internet
$dns3 = '127.0.0.1'      ## DNS Local configurado em "C:\Windows\System32\drivers\etc\hosts"

#########################################
##          Desativa o DHCP            ##
#########################################

$interface = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | findstr "InterfaceAlias"
$InterfaceAlias = (($interface.Split(":"))[-1]).trim()
Set-NetIPInterface -InterfaceInterfaceAlias $InterfaceAlias -Dhcp Disabled

#########################################
## Define IP, Mascara, Gateway e DNS   ##
#########################################
New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $ip -PrefixLength $mask -DefaultGateway $gateway
Set-DNSClientServerAddress -InterfaceAlias "$index" –ServerAddresses ("$dns1","$dns2","$dns3")

#########################################
## Lista as Configurações setadas      ##
#########################################
Get-NetIPConfiguration
