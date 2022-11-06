param([string]$source, [string]$destination, [string]$archivename)
Get-ChildItem -Recurse $source | Where { ! $_.PSIsContainer } | Select Name | Out-File -FilePath $destination\$archivename.nfo