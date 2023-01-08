#PowerShell: 
$eac3toPath = "C:\BRtools\eac3to\eac3to.exe"
#$source = Read-Host -Prompt (Write-Color "Enter Source Path: " -Color DarkMagenta -NoNewLine)
Write-Host "`nSet the directory of the Source Path" -ForegroundColor Green
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Set the directory of the Source Path'
$form.Size = New-Object System.Drawing.Size(850,150)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(650,70)
$okButton.Size = New-Object System.Drawing.Size(75,25)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(730,70)
$cancelButton.Size = New-Object System.Drawing.Size(75,25)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(17.5,10)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please Enter Source Path:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(17.5,30)
$textBox.Size = New-Object System.Drawing.Size(800,60)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $source = $textBox.Text
}
#PowerShell: 
Write-Host $source
#$destination = Read-Host -Prompt (Write-Color "`nEnter Destination Path: " -Color DarkMagenta -NoNewLine)
Write-Host "`nSet the directory of the destination Path" -ForegroundColor Green
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Set the directory of the destination Path'
$form.Size = New-Object System.Drawing.Size(850,150)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(650,70)
$okButton.Size = New-Object System.Drawing.Size(75,25)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(730,70)
$cancelButton.Size = New-Object System.Drawing.Size(75,25)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(17.5,10)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please Enter Destination Path:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(17.5,30)
$textBox.Size = New-Object System.Drawing.Size(800,60)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $destination = $textBox.Text
}
#PowerShell: 
Write-Host $destination
$logresult = "-log=$destination\#eac3to_result.txt"
Write-Host "`nCreate #eac3to_result" -ForegroundColor Green
& cmd @('/c', $eac3toPath, $source, $logresult ) | Out-Null