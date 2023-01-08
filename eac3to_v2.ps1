# Install from Powershell Gallery https://www.powershellgallery.com/packages/PSWriteColor
# Install-Module -Name PSWriteColor
#PowerShell: 
$StartTime = Get-Date
#PowerShell: Set the location to eac3to programm
#$eac3toPath = "C:\BRtools\eac3to\eac3to.exe"
Write-Host "`nEnter the eac3to version to use" -ForegroundColor Green
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select eac3to version'
$form.Size = New-Object System.Drawing.Size(300,270)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,185)
$okButton.Size = New-Object System.Drawing.Size(75,25)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,185)
$cancelButton.Size = New-Object System.Drawing.Size(75,25)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please Select the eac3to version:'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,80)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 50

[void] $listBox.Items.Add('C:\BRtools\eac3to\eac3to.exe')
[void] $listBox.Items.Add('C:\BRtools\eac3to\eac3to_v3.34.exe')
[void] $listBox.Items.Add('C:\BRtools\eac3to\eac3to_v3.36.exe')

$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $eac3toPath = $listBox.SelectedItem
    }
Write-Host $eac3toPath
#PowerShell: Set the directory of the Source Path
#$source = Read-Host -Prompt (Write-Color "`nEnter Source Path: " -Color DarkMagenta -NoNewLine)
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
#PowerShell: scan the BluRay directory
Write-Host "`nReading BluRay" -ForegroundColor DarkCyan
& cmd @('/c', $eac3toPath, $source )
#PowerShell: enter the playlist number from the scaned BluRay
#$playlist = Read-Host -Prompt (Write-Color "`nEnter Play List: " -Color DarkMagenta -NoNewLine)
Write-Host "`nEnter the playlist number from the scaned BluRay" -ForegroundColor Green
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Enter the playlist number'
$form.Size = New-Object System.Drawing.Size(300,285)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,200)
$okButton.Size = New-Object System.Drawing.Size(75,25)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,200)
$cancelButton.Size = New-Object System.Drawing.Size(75,25)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please Enter Play List:'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 140

[void] $listBox.Items.Add('1')
[void] $listBox.Items.Add('2')
[void] $listBox.Items.Add('3')
[void] $listBox.Items.Add('4')
[void] $listBox.Items.Add('5')
[void] $listBox.Items.Add('6')
[void] $listBox.Items.Add('7')
[void] $listBox.Items.Add('8')
[void] $listBox.Items.Add('9')

$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $playlist = $listBox.SelectedItem
    }
Write-Host $playlist
#PowerShell: result from the choisen Playlist
Write-Host "`nContent of BluRay" -ForegroundColor DarkCyan
& cmd @('/c', $eac3toPath, $source, "$($playlist))" )
#PowerShell: Set the directory of the destination Path
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
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Get-Item cmdlet to check if folder exists or not and create directory if not exists.
if (Get-Item -Path $destination -ErrorAction Ignore)
    {
        Write-Host "`nFolder Exists" -ForegroundColor DarkRed
    }
else
    {
        Write-Host "`nFolder Doesn't Exists" -ForegroundColor DarkYellow
        #PowerShell: Create directory if not exists
        New-Item $destination -ItemType Directory | Out-Null
        Write-Host "`nFolder Created Successfully" -ForegroundColor DarkGreen
    }
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set #eac3to_result file
$logresult = "-log=$destination\#eac3to_result.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set @eac3to_log file
$logfile = "-log=$destination\@eac3to_log.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Chek if logresult exist then delite it
if (Test-Path $logresult) 
    {
        Remove-Item -Verbose -Force $logfile
        Write-Host "`n$logresult has been deleted" -ForegroundColor DarkRed
    }
else 
    {
        Write-Host "`n$logresult doesn't exist" -ForegroundColor DarkYellow
    }
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Chek if logfile exist then delite it
if (Test-Path $logfile) 
    {
        Remove-Item -Verbose -Force $logfile
        Write-Host "`n$logfile has been deleted" -ForegroundColor DarkRed
    }
else 
    {
        Write-Host "`n$logfile doesn't exist" -ForegroundColor DarkYellow
    }
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Create #eac3to_result file
Write-Host "`nCreate #eac3to_result" -ForegroundColor Green
& cmd @('/c', $eac3toPath, $source, $logresult ) | Out-Null
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Create @eac3to_log file
Write-Host "`nCreate @eac3to_log" -ForegroundColor Green
& cmd @('/c', $eac3toPath, $source, "$($playlist))", $logfile ) | Out-Null
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set the @remux file
$FileNameremux = "$destination\@remux.txt"
#PowerShell: Chek if FileNameremux exist then delite it
if (Test-Path $FileNameremux) 
    {
        Remove-Item -Verbose -Force $FileNameremux
        Write-Host "`n$FileNameremux has been deleted" -ForegroundColor DarkRed
    }
else 
    {
        Write-Host "`n$FileNameremux doesn't exist" -ForegroundColor DarkYellow
    }
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Set the @remux_all file
$FileNameremuxall = "$destination\@remux_all.txt"
#PowerShell: chek if FileNameremuxall exist then delite it
if (Test-Path $FileNameremuxall) 
    {
        Remove-Item -Verbose -Force $FileNameremuxall
        Write-Host "`n$FileNameremuxall has been deleted" -ForegroundColor DarkRed
    }
else 
    {
        Write-Host "`n$FileNameremuxall doesn't exist" -ForegroundColor DarkYellow
    }
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Create @remux file
Write-Host "`nCreate @remux" -ForegroundColor Green
powershell -f C:\BRtools\eac3to\log2cmd_v2.ps1 $eac3toPath "$destination\@eac3to_log.txt" "$destination\@remux.txt" | Out-Null
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Create @remux_all file
Write-Host "`nCreate @remux_all" -ForegroundColor Green
powershell -f C:\BRtools\eac3to\log2cmd_v2.ps1 $eac3toPath "$destination\@eac3to_log.txt" "$destination\@remux_all.txt" | Out-Null
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: 
function Sort-STNumerical {
    [CmdletBinding()]
    Param(
        [Parameter(
            Mandatory = $True,
            ValueFromPipeline = $True,
            ValueFromPipelineBypropertyName = $True)]
        [System.Object[]]
        $InputObject,
        
        [ValidateRange(2, 100)]
        [Byte]
        $MaximumDigitCount = 100,

        [Switch] $Descending
    )
    
    Begin {
        [System.Object[]] $InnerInputObject = @()

        [Bool] $SortDescending = $False
        if ($Descending) {
            $SortDescending = $True
        }
    }
    
    Process {
        $InnerInputObject += $InputObject
    }

    End {
        $InnerInputObject |
            Sort-Object -Property `
                @{ Expression = {
                    [Regex]::Replace($_, '(\d+)', {
                        "{0:D$MaximumDigitCount}" -f [Int] $Args[0].Value })
                    }
                },
                @{ Expression = { $_ } } -Descending:$SortDescending
    }
}
#PowerShell: Sort @remux file
Write-Host "`nSort @remux" -ForegroundColor Green
(Get-Content "$destination\@remux.txt") | Sort-STNumerical | Set-Content "$destination\@remux.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Sort @remux_all file
Write-Host "`nSort @remux_all" -ForegroundColor Green
(Get-Content "$destination\@remux_all.txt") | Sort-STNumerical | Set-Content "$destination\@remux_all.txt"
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Open @remux with notepad
Write-Host "`nOpen @remux" -ForegroundColor DarkCyan
powershell notepad.exe "$destination\@remux.txt"
#PowerShell: Press any key to continue ...
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
Write-Host "`nRun remux" -ForegroundColor Green
Start-Process -FilePath "C:\BRtools\eac3to\@remux.bat" RunAs -Wait -NoNewWindow
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Delete file hidden, read-only files
Remove-Item -Path "C:\BRtools\eac3to\@remux.bat" -Force
#PowerShell: Pause for 2 seconds
timeout /t 2 | Out-Null
#PowerShell: Open all log files
#Invoke-Item "$destination\* - Log.txt"
#PowerShell: Press any key to continue . . .
#Read-Host (Write-Color "`nPress ENTER to continue..." -Color DarkGray -NoNewLine):
#PowerShell: 
$EndTime = Get-Date
#PowerShell: 
Function Get-TimeSpanPretty {
      [CmdletBinding()]
      Param
      (
          # Param1 help description
          [Parameter(Mandatory,ValueFromPipeline)][ValidateNotNull()][timespan]$TimeSpan
      )
  
      Begin {}
      Process{
  
          # Initialize $TimeSpanPretty, in case there is more than one timespan in the input via pipeline
          [string]$TimeSpanPretty = ""
      
          $Ts = [ordered]@{
              Weeks   = [math]::Floor($TimeSpan.Days / 7)
              Days    = [int]$TimeSpan.Days % 7
              Hours   = [int]$TimeSpan.Hours
              Minutes = [int]$TimeSpan.Minutes
              Seconds = [int]$TimeSpan.Seconds
          } 
  
          # Process each item in $Ts (week, day, etc.)
          foreach ($i in $Ts.Keys){
  
              # Skip if zero
              if ($Ts.$i -ne 0) {
                  
                  # Append the value and key to the string
                  $TimeSpanPretty += "{0} {1}, " -f $Ts.$i,$i
                  
              } #Close if
      
          } #Close for
      
      # If the $TimeSpanPretty is not 0 (which could happen if start and end time are identical.)
      if ($TimeSpanPretty.Length -ne 0){
  
          # delete the last coma and space
          $TimeSpanPretty = $TimeSpanPretty.Substring(0,$TimeSpanPretty.Length-2)
      }
      else {
          
          # Display "Less than a second" instead of an empty string.
          $TimeSpanPretty = "Less than a second"
      }
  
      $TimeSpanPretty
  
      } # Close Process
  
      End {}
  
} #Close function Get-TimeSpanPretty
#PowerShell: 
New-TimeSpan -Start $StartTime -End $EndTime | Get-TimeSpanPretty
#PowerShell: 
$EndTimeOut = Get-Date -UFormat %T
Write-Output $EndTimeOut
#PowerShell: 
$caption = "Please Confirm"    
$message = "Are you Sure You Want To Proceed:"
[int]$defaultChoice = 0
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription " &Yes ", "Do the job."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription " &No ", "Do not do the job."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $choiceRTN = $host.ui.PromptForChoice($caption,$message, $options,$defaultChoice)
        if ( $choiceRTN -ne 1 )
            {
                Clear-Host
            }
        else
            {
                "Your Choice was NO"
            }
#PowerShell: 
exit