$result_value=$(
$reg_path='HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile'
$reg_path_test=$(Test-Path -Path $reg_path -ErrorAction Stop)

$reg_value='AlwaysOn'

function regvalue {
$reg_value_test=$((Get-Item $reg_path -ErrorAction Stop).Property -eq $reg_value)
if ($reg_value_test -like $reg_value){
 echo "Valor existe"
}
else{
 echo "Valor Não existe"
}
}

if ($reg_path_test -like 'False'){
 echo "Chave Não Existe"
}
else{
 echo "Chave Existe"
 regvalue
}
)

echo $result_value

