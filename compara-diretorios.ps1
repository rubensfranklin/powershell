$saidaPath = "C:\Users\alanq\Documents\saida"
$backupPath = "C:\Users\alanq\Documents\backup"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logs = "C:\LOGS\log.txt"
$controle = 0

Get-ChildItem $saidaPath | ForEach-Object {
    $file = $_.Name
    if (Test-Path "$backupPath\$file") {
        $arquivos = Get-ChildItem $saidaPath
        Remove-Item "$saidaPath\$file"   
        $controle = 1
    }
 
    if ($controle = 1) {
        Add-Content -Path $logs -Value "[$timeStamp] O arquivo $arquivos foram removido do diretório $saidaPath" 
        Write-Host "O arquivo $arquivos foi removido do diretório $saidaPath"
    }
}


 