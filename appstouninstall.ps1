$appsToUninstall = @($( Get-AppxPackage -AllUsers |  Sort-Object Name | Format-Table Name | findstr /s /i /m "microsoft windows"))
foreach ($app in $appsToUninstall) {
Write-Host "Desinstalando o aplicativo: $app"
Get-AppxPackage | Where-Object { $_.Name -eq $app } | Remove-AppxPackage
}
Write-Host "Limpeza de aplicativos concluída."

