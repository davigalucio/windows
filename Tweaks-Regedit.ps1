REG ADD 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' /v "AlwaysOn" /t REG_DWORD /d 0x00000001 /f
REG ADD 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' /v "NoLazyMode" /t REG_DWORD /d 0x00000001 /f
REG ADD 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
REG ADD 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' /v "SystemResponsiveness" /t REG_DWORD /d 0x00000000 /f
REG ADD 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' /v "AlwaysUnloadDll" /t REG_DWORD /d 0x00000001 /f
REG ADD 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize' /v "StartupDelayInMSec" /t REG_DWORD /d 0x00000000 /f
REG ADD 'HKLM\SYSTEM\CurrentControlSet\Control' /v "WaitToKillAppTimeout" /t REG_DWORD /d 0x00000010 /f
REG ADD 'HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl' /v "Win32PrioritySeparation" /t REG_DWORD /d 0x00000026 /f
REG ADD 'HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' /v "PowerThrottlingOff" /t REG_DWORD /d 0x00000001 /f
REG ADD 'HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583' /v "Attributes" /t REG_DWORD /d 0x00000000 /f

REG ADD 'HKCU\Control Panel\Desktop' /v "WaitToKillAppTimeout" /t REG_DWORD /d 0x00000010 /f
REG ADD 'HKCU\Control Panel\Desktop' /v "MenuShowDelay" /t REG_DWORD /d 0x00000010 /f
REG ADD 'HKCU\SYSTEM\CurrentControlSet\Control\FileSystem' /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 0x00000001 /f
REG ADD 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' /v 'VisualFXSetting' /t REG_DWORD /d 0x00000002 /f
