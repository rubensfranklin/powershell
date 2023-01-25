$dirName = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 0
$caminho = "C:\Users\alanq\Documents"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
if (Test-Path $caminho\$dirName) {
    Write-Host "O diretório $dirName já existe."
    Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O diretório $caminho\$dirName já existe."
}
else {
    New-Item -ItemType Directory -Path $caminho\$dirName
    Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O diretório $dirName foi criado em $caminho\$dirName"
    $arquivo = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 1
    if ($arquivo -eq "criar") {
        New-Item -ItemType File -Path $caminho\$dirName\$dirName.txt
    }    
}