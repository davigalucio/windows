$URLDOWNLOADER='https://github.com/davigalucio/windows/archive/refs/heads/main.zip'

$GITFILE="$ENV:HOMEDRIVE\git-windows.zip"

Invoke-WebRequest -Uri $URLDOWNLOADER -OutFile $GITFILE

Expand-Archive -Path "$GITFILE" -DestinationPath $ENV:HOMEDRIVE\

dir  $ENV:HOMEDRIVE\


$url_file='https://raw.githubusercontent.com/davigalucio/windows/main/AppxRemove.ps1'

Invoke-Expression "& { $(Invoke-RestMethod $url_file) }"


$config_list=@(
'https://raw.githubusercontent.com/davigalucio/windows/main/config-rdp-enable.ps1'
'https://raw.githubusercontent.com/davigalucio/windows/main/AppxRemove.ps1'
'https://raw.githubusercontent.com/davigalucio/windows/main/Tweaks-Regedit.ps1'
'https://raw.githubusercontent.com/davigalucio/windows/main/disable-services.ps1'
)

foreach ($config in $config_list)
{
 echo "----------------------------------------------------"
 Invoke-Expression "& { $(Invoke-RestMethod $config) }"
}
