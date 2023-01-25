$sigla = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 0
$caminho = "C:\Users\alanq\Documents"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
if (Test-Path $caminho\$sigla) {
    $arquivo = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 1
    if (Test-Path $caminho\$sigla\$arquivo.txt) {
        Write-Host "Arquivo não foi criado, pois o arquivo já existe!"        
    }
    else {
        Write-Host "Arquivo foi criado"  
        New-Item -ItemType File -Path $caminho\$sigla\$arquivo.txt
    }    
}
else {
    Write-Host "Arquivo não foi criado, pois a sigla $sigla não existe!"
    Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O arquivo não foi criado, a sigla $sigla em $caminho\$sigla não existe."
    $arquivo = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 1  
}