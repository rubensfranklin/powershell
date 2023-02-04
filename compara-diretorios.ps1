$saidaPath = "C:\Users\alanq\Documents\temp"
$backupPath = "C:\Users\alanq\Documents\backup"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logs = "C:\LOGS\log.txt"

Get-ChildItem $saidaPath | ForEach-Object {
    $file = $_.Name
    if (Test-Path "$backupPath\$file") {
        $arquivos = Get-ChildItem $saidaPath        
        Remove-Item "$saidaPath\$file"       
    }
    Add-Content -Path $logs -Value "[$timeStamp] O arquivo $arquivos foi removido do diretório $saidaPath" 
    Write-Host "O arquivo $arquivos foi removido do diretório $saidaPath"
}