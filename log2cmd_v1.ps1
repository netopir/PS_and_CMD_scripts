$file = get-content $args[0] -raw

$fname = [RegEx]::Matches($file, "eac3to.exe\s+(.*)\s+(\d+)\)")
$dname = [RegEx]::Matches($file, "-log=(.*)\\")
$data100 = [RegEx]::Matches($file, "(\d+): Chapters, (.*)")
$data400 = [RegEx]::Matches($file, "(\d+): Subtitle \(PGS\), (.*)")
$data201 = [RegEx]::Matches($file, "(\d+): (h265\/HEVC), (2160p\d+) (.*)")
$data202 = [RegEx]::Matches($file, "(\d+): (h265\/HEVC), (1080p\d+) (.*)")
$data203 = [RegEx]::Matches($file, "(\d+): (h264\/AVC), (1080p\d+) (.*)")
$data204 = [RegEx]::Matches($file, "(\d+): (h264\/AVC  \(left eye\)), (1080p\d+) (.*)")
$data205 = [RegEx]::Matches($file, "(\d+): (h264\/MVC \(right eye\)), (1080p\d+) (.*)")
$data206 = [RegEx]::Matches($file, "(\d+): (h264\/AVC), (480p\d+) (.*)")
$data207 = [RegEx]::Matches($file, "(\d+): (MPEG2), (1080p\d+) (.*)")
$data208 = [RegEx]::Matches($file, "(\d+): (VC-1), (1080p\d+) (.*)")
$data209 = [RegEx]::Matches($file, "(\d+): (VC-1), (480p\d+) (.*)")
$data301 = [RegEx]::Matches($file, "(\d+): (TrueHD\/AC3 \(Atmos\)), (\w+(?: \w+)?), (.*), (.*)[\n\r][\s+](.*), (.*), (.*), (.*)")
$data302 = [RegEx]::Matches($file, "(\d+): (TrueHD\/AC3), (\w+(?: \w+)?), (.*), (.*)[\n\r][\s+](.*), (.*), (.*), (.*)")
$data303 = [RegEx]::Matches($file, "(\d+): (TrueHD), (\w+(?: \w+)?), (.*), (.*), (.*)")
$data304 = [RegEx]::Matches($file, "(\d+): (DTS Master Audio), (\w+(?: \w+)?), (.*) (.*)[\n\r][\s+](.*), (.*), (.*), (.*)")
$data305 = [RegEx]::Matches($file, "(\d+): (DTS Hi-Res), (\w+(?: \w+)?), (.*) (.*)[\n\r][\s+](.*), (.*), (.*), (.*)")
$data306 = [RegEx]::Matches($file, "(\d+): (DTS Express), (\w+(?: \w+)?), (.*), (.*), (.*)")
$data307 = [RegEx]::Matches($file, "(\d+): (DTS), (\w+(?: \w+)?), (.*), (.*), (.*)")
$data308 = [RegEx]::Matches($file, "(\d+): (E-AC3), (\w+(?: \w+)?), (.*), (.*), (.*)")
$data309 = [RegEx]::Matches($file, "(\d+): (E-AC3 EX), (\w+(?: \w+)?), (.*), (.*), (.*)")
$data310 = [RegEx]::Matches($file, "(\d+): (E-AC3 Surround), (\w+), (.*), (.*), (.*)")
$data311 = [RegEx]::Matches($file, "(\d+): (AC3), (\w+(?: \w+)?), (.*), (.*), (.*)")
$data312 = [RegEx]::Matches($file, "(\d+): (AC3 EX), (\w+(?: \w+)?), (.*), (.*), (.*)")
$data313 = [RegEx]::Matches($file, "(\d+): (AC3 Surround), (\w+(?: \w+)?), (.*), (.*), (.*)")
$data314 = [RegEx]::Matches($file, "(\d+): (RAW\/PCM), (\w+(?: \w+)?), (.*), (.*), (.*)")
$out = "`r`n"
foreach($line in $data100) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Chapters.txt`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data201) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video.h265`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data202) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video.h265`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data203) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video.h264`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data204) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video(left_eye).h264`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data205) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video(right_eye).h264`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data206) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video.h264`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data207) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video.mpeg2`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data208) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video.vc1`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data209) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_Video.vc1`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $dname[0].Groups[1].value
}
foreach($line in $data301) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}TrueHD.thd`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data302) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}TrueHD.thd`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data303) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}TrueHD.thd`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data304) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}DTS-MA.dtsma`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data305) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}DTS-HR.dtshr`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data306) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}DTSExpress.dts`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data307) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}DTS.dts`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data308) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}E-AC3.eac3`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data309) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}E-AC3EX.eac3`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data310) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}E-AC3Surround.eac3`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data311) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}AC3.ac3`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data312) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}AC3EX.ac3`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data313) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}AC3Surround.ac3`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data314) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {5}\[{2}]_{4}PCM.wav`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value, $line.Groups[3].value.replace(" ",""), $dname[0].Groups[1].value
}
foreach($line in $data400) {
    #Write-output($line.Groups[1].value, $line.Groups[2].value, $fname[0].Groups[1].value, $fname[0].Groups[2].value)
    $out += "C:\BRtools\eac3to\eac3to.exe {0} {1}) {2}: {4}\[{2}]_{3}SUP.sup`r`n" -f $fname[0].Groups[1].value, $fname[0].Groups[2].value, $line.Groups[1].value, $line.Groups[2].value.replace(" ","").replace("`n","").replace("`r",""), $dname[0].Groups[1].value
}
Write-Output($out)
Add-Content $args[1] $out
