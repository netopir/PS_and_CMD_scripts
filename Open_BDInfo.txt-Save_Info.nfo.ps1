function Open-File([string] $initialDirectory){
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $InitialDirectory
    $OpenFileDialog.filter = "All files (*.*)| *.*"
    $OpenFileDialog.ShowDialog() |  Out-Null
    return $OpenFileDialog.filename
} 

$OpenFile = Open-File "C:\BRtools\BDInfo\REMUX"

Write-Output $OpenFile

$output_name = Read-Host -Prompt (Write-Color "`nEnter Name:" -Color DarkMagenta -NoNewLine)

$file = Get-Content $OpenFile -raw
$data = [RegEx]::Matches($file, "((QUICK SUMMARY:)[\r\n]{1,}((\s.*\S.*)+(\w.*\W.*)(\d.*\D.*)))")
$output = ""
foreach($line in $data) {
    Write-output($line.Groups[1].value) |  Out-Null
    $output += $line[0].Groups[1].value
}

function Save-File([string] $initialDirectory){
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
    $SaveFileDialog.initialDirectory = $InitialDirectory
    $SaveFileDialog.FileName = "$($output_name).nfo"
    $SaveFileDialog.filter = "NFO files (*.nfo)| *.nfo"
    $SaveFileDialog.ShowDialog() |  Out-Null
    return $SaveFileDialog.filename
}

$SaveFil = Save-File "\\NASHDSERVER\Public\SabNzb\BluRay\_REMUX_FULL"

Add-Content $SaveFil $output