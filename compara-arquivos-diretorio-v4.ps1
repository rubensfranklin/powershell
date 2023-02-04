$saidaPath = "C:\Users\alanq\Documents\saida"
$backupPath = "C:\Users\alanq\Documents\backup"
$tempPath = "C:\temp"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logs = "C:\LOGS\log.txt"
$tempFiles = Get-ChildItem -Path $tempPath

$saidaFiles = Get-ChildItem -Path $saidaPath
$backupFiles = Get-ChildItem -Path $backupPath

$movedFiles = @()

foreach ($saidaFile in $saidaFiles)
{
    $backupFile = $backupFiles | Where-Object { $_.Name.Split(".")[0] -eq $saidaFile.Name.Split(".")[0] }
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

# Verifica se existem arquivos com mais de 2 dias no diretório temp, serão removidos
foreach ($tempFile in $tempFiles)
{   
    $fileAge = (Get-Date) - $tempFile.CreationTime    #Obtém a data de criação
    #$fileAge = (Get-Date) - $tempFile.LastWriteTime  #Obtém a data da última modificação
    if ($fileAge.Days -gt 2)
    {
        Remove-Item -Path $tempFile.FullName
        Add-Content -Path $logs -Value "[$timeStamp] - O arquivo $tempFile foi removido do diretório temporário $tempPath porque tem mais de 2 dias"
    }
}
