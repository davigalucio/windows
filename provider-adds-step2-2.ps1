#####################################################################################
## Atenção, não esqueça de rodar primeiramente o arquivo "provider-adds-step1-2.ps1 #
#####################################################################################

$pwdhost = 'Adds!1234@5.'
$domain = 'skynet.domain'
$domainnetbiosname=($domain.Split("."))[0].ToUpper()

#################################################################
# Instala as Features para provisionamento do Active Directory  #
#################################################################

Install-WindowsFeature -Name 'AD-Domain-Services' -Verbose

#################################################################
# Provisionado o Controlador de Dominio                         #
#################################################################
$ADDSForest = @{
    CreateDnsDelegation  = $False
    DatabasePath         = 'C:\Windows\NTDS'
    DomainMode           = 'Win2012R2'
    DomainName           = "$domain"
    DomainNetbiosName    = "$domainnetbiosname"
    ForestMode           = 'Win2012R2'
    InstallDns           = $True
    LogPath              = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $False
    SysvolPath           = 'C:\Windows\SYSVOL'
    Force                = $True
    Verbose              = $True
}
Install-ADDSForest @ADDSForest -SafeModeAdministratorPassword (ConvertTo-SecureString "$pwdhost" -AsPlainText -Force)


# Para adicionar um novo servidor a um dominio ja existente, executar os comandos abaixo:

# Instala o Recurso de compatibilidade de aplicativo do Server Core sob demanda (FOD) usando o Windows Update.
# Add-WindowsCapability -Online -Name ServerCore.AppCompatibility~~~~0.0.1.0

# Instala as Features para provisionamento do Active Directory
#Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

# Testa o Controlador instalado
# Test-ADDSDomainControllerInstallation -InstallDns -DomainName "$domain"

# Provisionando o Dominio
# Install-ADDSDomainController -CreateDnsDelegation:$false -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName "$domain" -InstallDNS:$True -LogPath "C:\Windows\NTDS" -SiteName "Default-First-Site-Name" -SYSVOLPath "C:\Windows\SYSVOL" -Force:$true -SafeModeAdministratorPassword (ConvertTo-SecureString "$pwdhost" -AsPlainText -Force)


## Testes 
## Get-Service adws,kdc,netlogon,dns

## Get-ADDomainController

## Get-ADDomain $domain

## Get-ADForest $domain

## Get-smbshare SYSVOL

## Get-ADDomainController -Discover

## Créditos:
## https://www.youtube.com/watch?v=M5ij9c2ee2s
## https://www.youtube.com/watch?v=yjMuG9USkbY
## https://gabrielluiz.com/2022/11/deploy-adds-domain-controller/
## https://github.com/gabrielluizbh/Install-ADDSDomainController
## https://eltonbordim.com.br/instalando-o-servico-do-active-directory-domain-services-adds/
## https://learn.microsoft.com/pt-br/windows-server/identity/ad-ds/deploy/install-active-directory-domain-services--level-100-
## https://infrahoje.com/instalacao-do-active-directory-e-criacao-de-dominio-via-powershell/
