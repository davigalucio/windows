#########################################
## HABILITA O WINRM PARA GERENCIAMENTO ##
## REMOTO PELO GERENCIADOR DE SERVIDOR ##
#########################################

#set-item wsman:localhost\client\trustedhosts -value * -Force
wmic process call create 'cmd.exe /c winrm set winrm/config/client @{TrustedHosts="*"}'

winrm qc -Force

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
