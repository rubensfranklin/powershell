$saidaPath = "C:\Users\alanq\Documents\saida"
$backupPath = "C:\Users\alanq\Documents\backup"
$tempPath = "C:\temp"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logs = "C:\LOGS\log.txt"

$saidaFiles = Get-ChildItem -Path $saidaPath
$backupFiles = Get-ChildItem -Path $backupPath

$movedFiles = @()

foreach ($saidaFile in $saidaFiles)
{
    $backupFile = $backupFiles | Where-Object { $_.Name -eq $saidaFile.Name }
    if ($backupFile)
    {
        Move-Item -Path $saidaFile.FullName -Destination $tempPath
        $movedFiles += $saidaFile.Name
        Add-Content -Path $logs -Value "[$timeStamp] - O arquivo $saidaFile foi movido do diretório $saidaPath para o diretório temporário $tempPath"
    }
}

if ($movedFiles.Count -gt 0)
{
    Write-Host "[$timeStamp] - Os seguintes arquivos foram movidos da pasta de SAIDA para o diretório temporário:"
    $movedFiles | ForEach-Object { Write-Host $_ }
}
else
{
    Write-Host "[$timeStamp] - Não houve arquivos movidos da pasta de SAIDA."
}
