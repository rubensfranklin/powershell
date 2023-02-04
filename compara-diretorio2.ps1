$saidaPath = "C:\SAIDA"
$backupPath = "C:\BACKUP"

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
    }
}

if ($deletedFiles.Count -gt 0)
{
    Write-Host "Os seguintes arquivos foram deletados da pasta de SAIDA:"
    $deletedFiles | ForEach-Object { Write-Host $_ }
}
else
{
    Write-Host "Não houve arquivos deletados da pasta de SAIDA."
}
