## Alterações para o Servidor Hyper-V
#########################################
##            No Hyper-V               ##
## Atenção: Ajustar essa configuração  ##
## de acordo com suas preferências     ##
#########################################

$hostname = 'SRVHYPV001M'
$pwdhost = 'Passw0rd$2'
$ip = '192.168.0.10'
$mask = '24'
$gateway = '192.168.0.1'
$dns1 = '192.168.0.250'
$dns2 = '8.8.8.8'

#########################################
## Troca a senha do administrador      ##
#########################################

net user $ENV:username $pwdhost

#########################################
##          Desativa o DHCP            ##
#########################################

$interface = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | findstr Index
$index = ($interface.Split())[-1]
Set-NetIPInterface -InterfaceIndex $index -Dhcp Disabled

#########################################
## Define IP, Mascara, Gateway e DNS   ##
#########################################

New-NetIPAddress -InterfaceIndex $index -IPAddress $ip -PrefixLength $mask -DefaultGateway $gateway
Set-DNSClientServerAddress -InterfaceIndex "$index" –ServerAddresses ("$dns1","$dns2")
Get-NetIPConfiguration

#########################################
##           Desativa o IPV6           ##
#########################################

Get-NetIPv6Protocol | fl RandomizeIdentifiers
Set-NetIPv6Protocol -RandomizeIdentifiers Disabled
Get-NetIPv6Protocol | fl RandomizeIdentifiers

Get-NetAdapterBinding -ComponentID ms_tcpip6
Disable-NetAdapterBinding -InterfaceAlias "Ethernet" -ComponentID ms_tcpip6
Get-NetAdapterBinding -ComponentID ms_tcpip6

#########################################
## Habilita Conexão de                 ##
## Area de Trabalho Remota             ##
#########################################

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0

#########################################
## Habilita resposta                   ##
## ping (ICMPv4 e ICMPv6)              ##
#########################################

netsh advfirewall firewall add rule name="Allow ICMPv4" protocol=icmpv4:8,any dir=in action=allow
#netsh advfirewall firewall add rule name="Allow ICMPv6" protocol=icmpv6:8,any dir=in action=allow

#########################################
## HABILITA O WINRM PARA GERENCIAMENTO ##
## REMOTO PELO GERENCIADOR DE SERVIDOR ##
#########################################

#set-item wsman:localhost\client\trustedhosts -value * -Force
wmic process call create 'cmd.exe /c winrm set winrm/config/client @{TrustedHosts="*"}'

winrm qc -Force

#########################################
## Habilitar Regras no Firewall        ##
#########################################

$lang = Get-WinUserLanguageList | findstr LanguageTag
$language = ($lang.Split())[-1]
$language

#########################################
## Sistema Operacional em Inglês       ##
#########################################

if ($language -eq "=en-US") {
Set-NetFirewallRule -DisplayGroup "Windows Management Instrumentation (WMI)" -Enabled True
Set-NetFirewallRule -DisplayGroup "Remote Event Log Management" -Enabled True
Set-NetFirewallRule -DisplayGroup "Remote Service Management" -Enabled True
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
Set-NetFirewallRule -DisplayGroup "Remote Scheduled Tasks Management" -Enabled True
Set-NetFirewallRule -DisplayGroup "Performance Logs and Alerts" -Enabled True
Set-NetFirewallRule -DisplayGroup "Remote Volume Management" -Enabled True
Set-NetFirewallRule -DisplayGroup "Windows Firewall Remote Management" -Enabled True
Set-NetFirewallRule -DisplayGroup "Remote Desktop" -Enabled True
}

#########################################
## Sistema Operacional em Português    ##
#########################################

if ($language -eq "pt-BR") {
Set-NetFirewallRule -DisplayGroup "Instrumentação de Gerenciamento do Windows (WMI)" -Enabled True
Set-NetFirewallRule -DisplayGroup "Gerenciamento Remoto do Log de Eventos" -Enabled True
Set-NetFirewallRule -DisplayGroup "Gerenciamento Remoto de Serviços" -Enabled True
Set-NetFirewallRule -DisplayGroup "Compartilhamento de Arquivo e Impressora" -Enabled True
Set-NetFirewallRule -DisplayGroup "Gerenciamento Remoto de Tarefas Agendadas" -Enabled True
Set-NetFirewallRule -DisplayGroup "Logs e Alertas de Desempenho" -Enabled True
Set-NetFirewallRule -DisplayGroup "Gerenciamento de Volumes Remoto" -Enabled True
Set-NetFirewallRule -DisplayGroup "Gerenciamento Remoto do Windows Defender Firewall" -Enabled True
Set-NetFirewallRule -DisplayGroup "Área de Trabalho Remota" -Enabled True
}

#########################################
## Instalação dos Recursos do Servidor ##
#########################################

Install-WindowsFeature -Name FileAndStorage-Services, File-Services, FS-FileServer, Storage-Services, Hyper-V, Remote-Desktop-Services, EnhancedStorage, Windows-Server-Backup, BITS, BITS-Compact-Server, Failover-Clustering, BitLocker, Data-Center-Bridging, RSAT, RSAT-Role-Tools, RSAT-Hyper-V-Tools, Hyper-V-PowerShell, RSAT-Feature-Tools, RSAT-Clustering, RSAT-Clustering-PowerShell, RSAT-Clustering-CmdInterface, RSAT-Clustering-AutomationServer, RSAT-DataCenterBridging-LLDP-Tools, RSAT-Feature-Tools-BitLocker, WindowsStorageManagementService, FS-SMBBW, Server-Media-Foundation, Multipath-IO, DiskIo-QoS, NET-Framework-Features, NET-Framework-Core, NET-Framework-45-Features, NET-Framework-45-Core, NET-Framework-45-ASPNET, NET-WCF-Services45, NET-WCF-TCP-PortSharing45, SNMP-Service, SNMP-WMI-Provider, FS-SMB1, FS-SMB1-CLIENT, FS-SMB1-SERVER, Microsoft-Windows-Subsystem-Linux, WoW64-Support, Telnet-Client, Windows-Defender, PowerShellRoot, PowerShell, PowerShell-V2 -IncludeManagementTools

#########################################
## Renomeia um novo nome de HOSTNAME   ##
#########################################

Rename-Computer -NewName "$hostname" -Restart
