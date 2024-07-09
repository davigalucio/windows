$hostname = 'SRVADDS001M'
$pwdhost = 'Adds!1234@5.'
$ip = '192.168.0.250'
$mask = '24'
$gateway = '192.168.0.1'
$dns1 = '192.168.0.250'
$dns2 = '8.8.8.8'
$dns2 = '127.0.0.1'
$domain = 'skynet.domain'

# Altera a senha do administrator
net user $ENV:username $pwdhost

# Ajustar Fuso Horario
tzutil /s “E. South America Standard Time”

# Altera o hostname
Rename-Computer -NewName "$hostname"

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
Set-DNSClientServerAddress -InterfaceAlias "$InterfaceAlias" –ServerAddresses ("$dns1","$dns2","$dns3")

#########################################
## Lista as Configurações setadas      ##
#########################################
Get-NetIPConfiguration

# Instala o Recurso de compatibilidade de aplicativo do Server Core sob demanda (FOD) usando o Windows Update.
Add-WindowsCapability -Online -Name ServerCore.AppCompatibility~~~~0.0.1.0

# Instala as Features para provisionamento do Active Directory
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

# Testa o Controlador instalado
Test-ADDSDomainControllerInstallation -InstallDns -DomainName "$domain"

# Provisionando o Dominio
Install-ADDSDomainController -CreateDnsDelegation:$false -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "$domain" -InstallDNS:$True -LogPath "C:\Windows\NTDS" -SiteName "Default-First-Site-Name" -SYSVOLPath "C:\Windows\SYSVOL" -Force:$true -SafeModeAdministratorPassword (ConvertTo-SecureString "$pwdhost" -AsPlainText -Force)


## Testes 
## Get-Service adws,kdc,netlogon,dns

## Get-ADDomainController

## Get-ADDomain gabrielluiz.lan

## Get-ADForest gabrielluiz.lan

## Get-smbshare SYSVOL

## Get-ADDomainController -Discover

## Add-WindowsCapability -Online -Name ServerCore.AppCompatibility~~~~0.0.1.0 # Instala o Recurso de compatibilidade de aplicativo do Server Core sob demanda (FOD) usando o Windows Update.


## https://www.youtube.com/watch?v=yjMuG9USkbY
## https://gabrielluiz.com/2022/11/deploy-adds-domain-controller/
## https://github.com/gabrielluizbh/Install-ADDSDomainController
## https://eltonbordim.com.br/instalando-o-servico-do-active-directory-domain-services-adds/
## https://learn.microsoft.com/pt-br/windows-server/identity/ad-ds/deploy/install-active-directory-domain-services--level-100-
## https://infrahoje.com/instalacao-do-active-directory-e-criacao-de-dominio-via-powershell/
