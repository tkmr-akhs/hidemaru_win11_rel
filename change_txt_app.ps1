$editor = '"D:\Program Files\Hidemaru\Hidemaru.exe" "%1"'
$file_icon = "%SystemRoot%\System32\SHELL32.dll,70"
$exts = @(".txt", ".log")
$key_name = "txt_hidemaru"

New-Item -Path "HKCU:\SOFTWARE\Classes\$($key_name)" | Out-Null
New-Item -Path "HKCU:\SOFTWARE\Classes\$($key_name)\DefaultIcon" | Out-Null
New-Item -Path "HKCU:\SOFTWARE\Classes\$($key_name)\shell" | Out-Null
New-Item -Path "HKCU:\SOFTWARE\Classes\$($key_name)\shell\open" | Out-Null
New-Item -Path "HKCU:\SOFTWARE\Classes\$($key_name)\shell\open\command" | Out-Null

Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\DefaultIcon -Name "(default)" -Value $file_icon
Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\open\command -Name "(default)" -Value $editor

foreach ($ext in $exts) {
    Get-ItemProperty HKCU:\SOFTWARE\Classes\$ext
    Set-ItemProperty HKCU:\SOFTWARE\Classes\$ext -Name "(default)" -Value $key_name
}