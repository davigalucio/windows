#Assistente de Conexão de Conta da Microsoft
Set-Service -name wlidsvc -startupType disabled
#Gerenciador de NFC/SE e Pagamentos
Set-Service -name SEMgrSvc -startupType disabled
#Descoberta SSDP
Set-Service -name SSDPSRV -startupType disabled
#Gerenciador de Conta da Web
Set-Service -name TokenBroker -startupType disabled
#Instalação Automática de Dispositivos Conectados
Set-Service -name NcdAutoSetup -startupType disabled
#Serviço de Geolocalização
Set-Service -name lfsvc -startupType disabled
#Serviço de Teclado Virtual e Painel de Manuscrito
Set-Service -name TabletInputService -startupType disabled
#Windows Search
Set-Service -name WSearch -startupType disabled
#Themes
Set-Service -name Themes -startupType disabled
#SysMain
Set-Service -name SysMain -startupType disabled
#WalletService
Set-Service -name WalletService -startupType disabled
#Xbox Accessory Management Service
Set-Service -name XboxGipSvc -startupType disabled
#Microsoft Edge Elevation Service (MicrosoftEdgeElevationService)
Set-Service -name MicrosoftEdgeElevationService -startupType disabled
#Microsoft Edge Update Service (edgeupdate)
Set-Service -name edgeupdate -startupType disabled
#Microsoft Edge Update Service (edgeupdatem)
Set-Service -name edgeupdatem -startupType disabled
#Gerenciador de Mapas Baixados
Set-Service -name MapsBroker -startupType disabled
#Controles dos Pais
Set-Service -name WpcMonSvc -startupType disabled
#Extensões e Notificações da Impressora
Set-Service -name PrintNotify -startupType disabled
#Fax
Set-Service -name Fax -startupType disabled
#Gerenciador de Autenticação Xbox Live
Set-Service -name XblAuthManager -startupType disabled
#Instalador de Módulos do Windows
Set-Service -name TrustedInstaller -startupType disabled
#Serviço de identidade Microsoft Cloud
Set-Service -name cloudidsvc -startupType disabled
#Serviço de Rede Xbox Live
Set-Service -name XboxNetApiSvc -startupType disabled
#Salvar Jogos no Xbox Live
Set-Service -name XblGameSave -startupType disabled
#Microsoft Passport
Set-Service -name NgcSvc -startupType disabled
