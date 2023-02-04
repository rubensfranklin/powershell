$saidaPath = "C:\Users\alanq\Documents\saida"
$backupPath = "C:\Users\alanq\Documents\backup"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logs = "C:\LOGS\log.txt"


$saidaFiles = Get-ChildItem -Path $saidaPath
$backupFiles = Get-ChildItem -Path $backupPath

$deletedFiles = @()

foreach ($saidaFile in $saidaFiles)
{
    $backupFile = $backupFiles | Where-Object { $_.Name -eq $saidaFile.Name }
    if ($backupFile)
    {
        Remove-Item -Path $saidaFile.FullName
        $deletedFiles += $saidaFile.Name
        Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] - O arquivo $saidaFile foi removido do diretório $saidaPath" 
    }
}

if ($deletedFiles.Count -gt 0)
{
    Write-Host "[$timeStamp] - Os seguintes arquivos foram deletados da pasta de SAIDA:"
    $deletedFiles | ForEach-Object { Write-Host $_ }
}
else
{
    Write-Host "[$timeStamp] - Não houve arquivos deletados da pasta de SAIDA."
}

 