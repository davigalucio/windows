$hostname = 'SRVADDS001M'
$pwdhost = 'Adds!1234@5.'

# Ajusta o Fuso Horario
tzutil /s "E. South America Standard Time"

# Altera a senha atual
net user $ENV:username $pwdhost

# Altera o hostname
Rename-Computer -NewName "$hostname" -Restart
