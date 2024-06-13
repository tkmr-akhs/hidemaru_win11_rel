$editor = '"D:\Program Files\Hidemaru\Hidemaru.exe" "%1"'
$file_icon = "%SystemRoot%\System32\SHELL32.dll,70"
$exts = @(".txt", ".log")
$key_name = "txt_hidemaru"

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory '$reg_key' key has already exist." }

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)\DefaultIcon"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory '$reg_key' key has already exist." }

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)\shell"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory key '$reg_key' has already exist." }

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)\shell\open"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory key '$reg_key' has already exist." }

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)\shell\open\command"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory key '$reg_key' has already exist." }

Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\DefaultIcon -Name "(default)" -Value $file_icon
Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\open\command -Name "(default)" -Value $editor

foreach ($ext in $exts) {
    Get-ItemProperty HKCU:\SOFTWARE\Classes\$ext
    Set-ItemProperty HKCU:\SOFTWARE\Classes\$ext -Name "(default)" -Value $key_name
}