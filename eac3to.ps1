#PowerShell: Set the location to eac3to programm
$eac3toPath = "C:\BRtools\eac3to\eac3to.exe"
#PowerShell: Set the directory of the Source Path
$source = Read-Host -Prompt "Enter Source Path"
#PowerShell: scan the BluRay directory
Write-host "Reading BluRay" -ForegroundColor Gray
& cmd @('/c', $eac3toPath, $source )
#PowerShell: enter the playlist number from the scaned BluRay
$playlist = Read-Host -Prompt "Enter Play List"
#PowerShell: result from the choisen Playlist
Write-host "Content of BluRay" -ForegroundColor Gray
& cmd @('/c', $eac3toPath, $source, $playlist )
#PowerShell: Set the directory of the destination Path
$destination = Read-Host -Prompt "Enter Destination Path"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Get-Item cmdlet to check if folder exists or not and create directory if not exists.
if(Get-Item -Path $destination -ErrorAction Ignore)
{
    Write-Host "Folder Exists" -ForegroundColor Gray
}
else
{
    Write-Host "Folder Doesn't Exists" -ForegroundColor Gray
    #PowerShell: Create directory if not exists
    New-Item $destination -ItemType Directory | Out-Null
    Write-Host "Folder Created successfully" -ForegroundColor Gray
}
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set @eac3to_log file
$logfile = "-log=$destination\@eac3to_log.txt"
#PowerShell: Chek if logfile exist then delite it
if (Test-Path $logfile) {
  Remove-Item -Verbose -Force $logfile
  write-host "$logfile has been deleted" -ForegroundColor Gray
}
else {
  Write-host "$logfile doesn't exist" -ForegroundColor Gray
}
#PowerShell: Create @eac3to_log file
Write-host "Create @eac3to_log" -ForegroundColor Gray
& cmd @('/c', $eac3toPath, $source, $playlist, $logfile )
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set the @remux file
$FileNameremux = "$destination\@remux.txt"
#PowerShell: Chek if FileNameremux exist then delite it
if (Test-Path $FileNameremux) {
  Remove-Item -Verbose -Force $FileNameremux
  write-host "$FileNameremux has been deleted" -ForegroundColor Gray
}
else {
  Write-host "$FileNameremux doesn't exist" -ForegroundColor Gray
}
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set the @remux_all file
$FileNameremuxall = "$destination\@remux_all.txt"
#PowerShell: chek if FileNameremuxall exist then delite it
if (Test-Path $FileNameremuxall) {
  Remove-Item -Verbose -Force $FileNameremuxall
  write-host "$FileNameremuxall has been deleted" -ForegroundColor Gray
}
else {
  Write-host "$FileNameremuxall doesn't exist" -ForegroundColor Gray
}
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Create @remux file
Write-host "Create @remux" -ForegroundColor Gray
powershell -f C:\BRtools\eac3to\log2cmd_v1.ps1 "$destination\@eac3to_log.txt" "$destination\@remux.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Create @remux_all file
Write-host "Create @remux_all" -ForegroundColor Gray
powershell -f C:\BRtools\eac3to\log2cmd_v1.ps1 "$destination\@eac3to_log.txt" "$destination\@remux_all.txt" | Out-Null
#PowerShell: Open @remux with notepad
Write-host "Open @remux" -ForegroundColor Gray
powershell notepad.exe "$destination\@remux.txt"
#PowerShell: Press any key to continue . . .
read-host "Press ENTER to continue..."
#PowerShell: Remove blank lines from a file
(Get-Content "$destination\@remux.txt") | Where-Object {$_.trim() -ne "" } | Set-Content "$destination\@remux.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Remove blank lines from a file
(Get-Content "$destination\@remux_all.txt") | Where-Object {$_.trim() -ne "" } | Set-Content "$destination\@remux_all.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: run the remux
& cmd @('/c', $FileNameremux )
#PowerShell: Press any key to continue . . .
read-host "Press ENTER to continue..."