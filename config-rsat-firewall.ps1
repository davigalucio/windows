#########################################
## HABILITA O WINRM PARA GERENCIAMENTO ##
## REMOTO PELO GERENCIADOR DE SERVIDOR ##
#########################################

winrm qc -Force
Enable-PSRemoting -Force

## https://blog.joaoheytor.com/2016/07/08/powershell-habilitando-conexao-remota/
## https://www.jlgregorio.com.br/2021/06/13/conexao-remota-com-powershell-7-x/

#####################
## No Server local ##
##################### 
# $ips_pc_manager='192.168.0.20,192.168.0.21'
# Set-Item WSMan:\localhost\client\TrustedHosts "$ips_pc_manager" -Force

######################################
# Após alterações, reiniciar o WinRM #
######################################

## Local ##
# Restart-Service WinRM

## Remotamente ##
# Get-Service -ComputerName LOCALHOST -Name WinRM | Restart-Service

## Lista os computadores confiavéis para sessão remota ##
# Get-Item WSMan:\localhost\Client\TrustedHosts

## Testando Conexão
# $ip_remoto=192.168.0.20
# Test-WsMan $ip_remoto

#####################
## No PC local ##
##################### 
# $ips_server_remoto='192.168.0.250,192.168.0.251'
# Set-Item WSMan:\localhost\client\TrustedHosts "$ips_server_remoto" -Force

######################################
# Após alterações, reiniciar o WinRM #
######################################

## Local ##
# Restart-Service WinRM

## Remotamente ##
# Get-Service -ComputerName LOCALHOST -Name WinRM | Restart-Service

## Lista os computadores confiavéis para sessão remota ##
# Get-Item WSMan:\localhost\Client\TrustedHosts

## Testando Conexão
# $ip_remoto=192.168.0.20
# Test-WsMan $ip_remoto






# Set-item WSMan:\localhost\client\TrustedHosts -value * -Force
wmic process call create 'cmd.exe /c winrm set winrm/config/client @{TrustedHosts="*"}'


#########################################
## RSAT- Habilita regras no Firewall   ##
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
