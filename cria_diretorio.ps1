$dirName = Get-Content C:\Users\alanq\Documents\sigla.txt | Select-Object -Index 1
$caminho = "C:\Users\alanq\Documents"
$checkLine = Get-Content $caminho\$dirName | Select-Object -Index 1
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
if (Test-Path $caminho\$dirName) {
    Write-Host "O diretório $caminho\$dirName já existe."
    Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O diretório $dirName já existe."
}
else {
    New-Item -ItemType Directory -Path $caminho\$dirName
    Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O diretório $dirName foi criado em $dirName"
    if ($checkLine -eq "criar") {
        New-Item -ItemType File -Path $caminho\$dirName\$dirName.txt
    }
}