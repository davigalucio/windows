#########################################
## Credenciais do Dominio              ##
#########################################

$domain = 'SKYNET.DOMAIN'
$username = "$domain\administrator"
$pwddom = 'Adds!1234@5.' | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username,$pwddom);

#########################################
## Instalação do Windows Admin Center  ##
#########################################

Invoke-WebRequest -Uri https://aka.ms/WACDownload -OutFile "$ENV:HOMEDRIVE\wac.msi"
New-NetFirewallRule -DisplayName "Allow Windows Admin Center Outbound 443" -Direction Outbound -profile Domain -LocalPort 443 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow Windows Admin Center Inbound 443" -Direction Inbound -profile Domain -LocalPort 443 -Protocol TCP -Action Allow
$msiArgs = @("/i", "C:\WAC.msi", "/qn", "/L*v", "log.txt", "SME_PORT=443", "SSL_CERTIFICATE_OPTION=generate")
Start-Process msiexec.exe -Wait -ArgumentList $msiArgs

#########################################
## Integração ao Dominio               ##
#########################################

Add-Computer -DomainName $domain -Credential $credential -Restart
