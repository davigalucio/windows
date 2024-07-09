$URLDOWNLOADER='https://github.com/davigalucio/windows/archive/refs/heads/main.zip'

$GITFILE="$ENV:HOMEDRIVE\git-windows.zip"

Invoke-WebRequest -Uri $URLDOWNLOADER -OutFile $GITFILE

Expand-Archive -Path "$GITFILE" -DestinationPath $ENV:HOMEDRIVE\
