$hidemaru = "D:\Program Files\Hidemaru\Hidemaru.exe"
$file_icon = "%SystemRoot%\System32\SHELL32.dll,70"
$exts = @(".txt", ".log")

New-Item -Path HKCU:\SOFTWARE\Classes\txt_hidemaru
New-Item -Path HKCU:\SOFTWARE\Classes\txt_hidemaru\DefaultIcon
New-Item -Path HKCU:\SOFTWARE\Classes\txt_hidemaru\shell
New-Item -Path HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\open
New-Item -Path HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\open\command

Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\DefaultIcon -Name "(default)" -Value $file_icon
Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\open\command -Name "(default)" -Value $hidemaru

foreach ($ext in $exts) {
    Get-ItemProperty HKCU:\SOFTWARE\Classes\$ext
    Set-ItemProperty HKCU:\SOFTWARE\Classes\$ext -Name "(default)" -Value "txt_hidemaru"
}