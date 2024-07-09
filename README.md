$URLDOWNLOADER='https://github.com/davigalucio/windows/archive/refs/heads/main.zip'

$GITFILE='git-windows.zip'

Invoke-WebRequest -Uri $URLDOWNLOADER -OutFile $ENV:HOMEDRIVE\$GITFILE

Expand-Archive -Path C:\$GITFILE -DestinationPath $ENV:HOMEDRIVE\
