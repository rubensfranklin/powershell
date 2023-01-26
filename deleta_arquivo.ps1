$sigla = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 0
$caminho = "C:\Users\alanq\Documents"
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
if (Test-Path $caminho\$sigla) {
    $arquivo = Get-Content "C:\Users\alanq\Documents\sigla.txt" | Select-Object -index 1
    if (Test-Path $caminho\$sigla\$arquivo.txt) {
        Remove-Item -Path $caminho\$sigla\$arquivo.txt
        Write-Host "O arquivo $arquivo.txt foi removido"
        Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O arquivo $arquivo.txt foi removido do diretório $caminho\$sigla " 
    }
    else {
        Write-Host "O arquivo $arquivo.txt não existe na sigla [ $sigla ] no diretório $caminho\$sigla"  
    }    
}
else {
    Write-Host "A sigla $sigla não existe!"
    Add-Content -Path "C:\LOGS\log.txt" -Value "[$timeStamp] O arquivo não foi removido, porque a sigla $sigla não existe."
}

# Para remover um item (arquivo) --> Remove-Item -Path 