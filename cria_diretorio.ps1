$sigla = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 0
$caminho = "C:\Users\alanq\Documents"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
if (Test-Path $caminho\$sigla) {
    Write-Host "O diretório $sigla já existe."
    Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O diretório $caminho\$sigla já existe."
}
else {
    New-Item -ItemType Directory -Path $caminho\$sigla
    Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O diretório $sigla foi criado em $caminho\$sigla"
    $arquivo = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 1
    if ($arquivo -eq "criar") {
        New-Item -ItemType File -Path $caminho\$sigla\$sigla.txt
    }    
}