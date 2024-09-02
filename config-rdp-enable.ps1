#################################################
## Habilita Conexão de Area de Trabalho Remota ##
#################################################

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0

#################################################
## Habilitando Regra no Firewall               ##
#################################################

Enable-NetFirewallRule -Name "RemoteDesktop-UserMode*"
