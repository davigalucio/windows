Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Type DWord -name "AlwaysOn" -value 1
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Type DWord -name "NoLazyMode" -value 1
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Type DWord -name "NetworkThrottlingIndex" -value 0xffffffff
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Type DWord -name "SystemResponsiveness" -value 0

New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Type DWord -name "AlwaysUnloadDll" -value 1
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -name "Serialize"
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize' -Type DWord -name "StartupDelayInMSec" -value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Type DWord -name "VisualFXSetting" -value 2

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl' -Type DWord -name "Win32PrioritySeparation" -value 26

Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Type DWord -name "MenuShowDelay" -value 10

New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Power' -name "PowerThrottling"
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' -Type DWord -name "PowerThrottlingOff" -value 1

New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583' -Type DWord -name "Attributes" -value 0

New-Item -Path 'HKCU:\SYSTEM\CurrentControlSet\Control\' -name "FileSystem"
New-ItemProperty -Path 'HKCU:\SYSTEM\CurrentControlSet\Control\FileSystem' -Type DWord -name "NtfsDisableLastAccessUpdate" -value 1

New-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Type DWord -name "WaitToKillAppTimeout" -value 10
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control' -Type DWord -name "WaitToKillAppTimeout" -value 10
