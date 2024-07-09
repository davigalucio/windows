#########################################
## Instalação do Windows Admin Center  ##
#########################################

$uriDownloader='https://aka.ms/WACDownload'
$outfilepath="$ENV:HOMEDRIVE\wac.msi"

## Download do WAC.msi
Invoke-WebRequest -Uri $uriDownloader -OutFile "$outfilepath"

## Instalação automatizada do WAC.msi com os parametros padrões
$msiArgs = @("/i", "$outfilepath", "/qn", "/L*v", "log.txt", "SME_PORT=443", "SSL_CERTIFICATE_OPTION=generate")
Start-Process msiexec.exe -Wait -ArgumentList $msiArgs

## Habilitando acesso no Firewall ##
New-NetFirewallRule -DisplayName "Allow Windows Admin Center Outbound 443" -Direction Outbound -profile Domain -LocalPort 443 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow Windows Admin Center Inbound 443" -Direction Inbound -profile Domain -LocalPort 443 -Protocol TCP -Action Allow
