param([string]$source, [string]$destination, [string]$archivename)
Get-ChildItem -Recurse $source | Where { ! $_.PSIsContainer } | Select Name, @{Name="MBytes";Expression={ "{0:N2}" -f ($_.Length / 1MB) }} | Out-File -FilePath $destination\$archivename.nfo
