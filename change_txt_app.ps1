$ro_macro = "`"$($Env:ProgramData)\Hidemaruo\Hidemaru\Macro\OpenAsTemplate.mac`""
$editor_rw = "`"$($Env:ProgramFiles)\Hidemaru\Hidemaru.exe`" `"%1`""
$editor_ro = "`"$($Env:ProgramFiles)\Hidemaru\Hidemaru.exe`" /x$($ro_macro) `"%1`""
$file_icon = '%SystemRoot%\System32\SHELL32.dll,70'
$exts = @(".txt", ".log")
$key_name = "txt_hidemaru"
$opennew_title = "新規(&N)"

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

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)\shell\opennew"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory key '$reg_key' has already exist." }

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)\shell\opennew\command"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory key '$reg_key' has already exist." }

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)\shell\Edit"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory key '$reg_key' has already exist." }

$reg_key = "HKCU:\SOFTWARE\Classes\$($key_name)\shell\Edit\command"
try { New-Item -Path $reg_key -ErrorAction Stop | Out-Null }
catch { Write-Debug "The registory key '$reg_key' has already exist." }

Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\DefaultIcon -Name "(default)" -Value $file_icon
Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\open\command -Name "(default)" -Value $editor_rw
Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\opennew -Name "(default)" -Value $opennew_title
Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\opennew\command -Name "(default)" -Value $editor_ro
Set-ItemProperty HKCU:\SOFTWARE\Classes\txt_hidemaru\shell\Edit\command -Name "(default)" -Value $editor_rw

foreach ($ext in $exts) {
    Get-ItemProperty HKCU:\SOFTWARE\Classes\$ext
    Set-ItemProperty HKCU:\SOFTWARE\Classes\$ext -Name "(default)" -Value $key_name
}