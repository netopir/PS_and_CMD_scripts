# Install from Powershell Gallery https://www.powershellgallery.com/packages/PSWriteColor
# Install-Module -Name PSWriteColor
#PowerShell: Set the location to eac3to programm
$eac3toPath = "C:\BRtools\eac3to\eac3to.exe"
#PowerShell: Set the directory of the Source Path
$source = Read-Host -Prompt (Write-Color "Enter Source Path: " -Color DarkMagenta -NoNewLine)
#PowerShell: scan the BluRay directory
Write-Host "`nReading BluRay" -ForegroundColor DarkCyan
& cmd @('/c', $eac3toPath, $source )
#PowerShell: enter the playlist number from the scaned BluRay
$playlist = Read-Host -Prompt (Write-Color "`nEnter Play List: " -Color DarkMagenta -NoNewLine)
#PowerShell: result from the choisen Playlist
Write-Host "`nContent of BluRay" -ForegroundColor DarkCyan
& cmd @('/c', $eac3toPath, $source, "$($playlist))" )
#PowerShell: Set the directory of the destination Path
$destination = Read-Host -Prompt (Write-Color "`nEnter Destination Path: " -Color DarkMagenta -NoNewLine)
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Get-Item cmdlet to check if folder exists or not and create directory if not exists.
if(Get-Item -Path $destination -ErrorAction Ignore)
{
    Write-Host "`nFolder Exists" -ForegroundColor DarkRed
}
else
{
    Write-Host "`nFolder Doesn't Exists" -ForegroundColor DarkYellow
    #PowerShell: Create directory if not exists
    New-Item $destination -ItemType Directory | Out-Null
    Write-Host "`nFolder Created successfully" -ForegroundColor DarkGreen
}
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set @eac3to_log file
$logfile = "-log=$destination\@eac3to_log.txt"
#PowerShell: Chek if logfile exist then delite it
if (Test-Path $logfile) {
  Remove-Item -Verbose -Force $logfile
  write-Host "`n$logfile has been deleted" -ForegroundColor DarkRed
}
else {
  Write-Host "`n$logfile doesn't exist" -ForegroundColor DarkYellow
}
#PowerShell: Create @eac3to_log file
Write-Host "`nCreate @eac3to_log" -ForegroundColor DarkYellow
& cmd @('/c', $eac3toPath, $source, "$($playlist))", $logfile ) | Out-Null
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set the @remux file
$FileNameremux = "$destination\@remux.txt"
#PowerShell: Chek if FileNameremux exist then delite it
if (Test-Path $FileNameremux) {
  Remove-Item -Verbose -Force $FileNameremux
  write-Host "`n$FileNameremux has been deleted" -ForegroundColor DarkRed
}
else {
  Write-Host "`n$FileNameremux doesn't exist" -ForegroundColor DarkYellow
}
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set the @remux_all file
$FileNameremuxall = "$destination\@remux_all.txt"
#PowerShell: chek if FileNameremuxall exist then delite it
if (Test-Path $FileNameremuxall) {
  Remove-Item -Verbose -Force $FileNameremuxall
  write-Host "`n$FileNameremuxall has been deleted" -ForegroundColor DarkRed
}
else {
  Write-Host "`n$FileNameremuxall doesn't exist" -ForegroundColor DarkYellow
}
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Create @remux file
Write-Host "`nCreate @remux" -ForegroundColor DarkCyan
powershell -f C:\BRtools\eac3to\log2cmd_v1.ps1 "$destination\@eac3to_log.txt" "$destination\@remux.txt" | Out-Null
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Create @remux_all file
Write-Host "`nCreate @remux_all" -ForegroundColor DarkCyan
powershell -f C:\BRtools\eac3to\log2cmd_v1.ps1 "$destination\@eac3to_log.txt" "$destination\@remux_all.txt" | Out-Null
#PowerShell: Open @remux with notepad
Write-Host "`nOpen @remux" -ForegroundColor DarkCyan
powershell notepad.exe "$destination\@remux.txt"
#PowerShell: Press any key to continue . . .
Read-Host (Write-Color "`nPress ENTER to continue..." -Color DarkGray -NoNewLine):
#PowerShell: Remove blank lines from a file
Write-Host "`nRemove blank lines from @remux" -ForegroundColor DarkCyan
(Get-Content "$destination\@remux.txt") | Where-Object {$_.trim() -ne "" } | Set-Content "$destination\@remux.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Remove blank lines from a file
Write-Host "`nRemove blank lines from @remux_all" -ForegroundColor DarkCyan
(Get-Content "$destination\@remux_all.txt") | Where-Object {$_.trim() -ne "" } | Set-Content "$destination\@remux_all.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Copy a file to the specified directory and rename the file
Copy-Item "$destination\@remux.txt" -Destination "C:\BRtools\eac3to\@remux.bat"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: run the remux
Write-Host "`nRun remux" -ForegroundColor DarkCyan
Start-Process -FilePath "C:\BRtools\eac3to\@remux.bat" RunAs -Wait -NoNewWindow
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Delete file hidden, read-only files
Remove-Item -Path "C:\BRtools\eac3to\@remux.bat" -Force
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Open all log files
#Invoke-Item "$destination\*.txt"
#PowerShell: Press any key to continue . . .
Read-Host (Write-Color "`nPress ENTER to continue..." -Color DarkGray -NoNewLine):
