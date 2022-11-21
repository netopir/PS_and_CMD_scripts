#PowerShell: Set the location to rar programm
$rardirectory = "C:\Program Files\WinRAR\Rar.exe"
#PowerShell: Set the location to par2 programm
$par2directory = "C:\Users\Martin\Desktop\Usenet_Programms\ngPost_bluray\par2.exe"
#PowerShell: Set the location to quicksfv programm
$sfvdirectory = "C:\Users\Martin\Desktop\Usenet_Programms\ngPost_bluray\quicksfv.exe"
#PowerShell: Set the directory of the Source Path
$source = Read-Host -Prompt (Write-Color "`nEnter Source Path: " -Color DarkMagenta -NoNewLine)
#PowerShell: Set the name of the destination
$foldername = Read-Host -Prompt (Write-Color "`nEnter Folder Name: " -Color DarkMagenta -NoNewLine)
#PowerShell: Set the name of a Archive
$archivename = Read-Host -Prompt (Write-Color "`nEnter Arcive Name: " -Color DarkMagenta -NoNewLine)
#PowerShell: Set the password of a Archive
$archivepassword = Read-Host -Prompt (Write-Color "`nEnter Arcive Password: " -Color DarkMagenta -NoNewLine)
#PowerShell: Set the directory of the destination Path
$destination = "C:\Users\Martin\Desktop\Usenet_Programms\ngPost_bluray\tmp\$foldername"
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
#PowerShell: Switch to the destination destination
Set-Location $destination
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Start the creation of the Rar arhives
Write-Host "`nCreate rar files" -ForegroundColor Green
& "$rardirectory" a -ep1 -r -idp -m0 -v100m -p"$archivepassword" "$destination\$archivename.rar" $source
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Start the creation of the Par2 
Write-Host "`nCreate par2 files" -ForegroundColor Green
& $par2directory c -l -q -m1024 -r15 "$destination\$archivename" "$destination\$archivename*.rar"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Start the creation of the Sfv file
Write-Host "`nCreate sfv file" -ForegroundColor Green
& $sfvdirectory -c "$archivename.sfv" *.*
#PowerShell: Press any key to continue . . .
read-host "Press ENTER to continue..." 
