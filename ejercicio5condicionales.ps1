$fichero = Read-Host "Intorduce un fichero o carpeta: "
If (Test-Path $fichero){
    Write-Host "El elemento existe"
    }
Else{
     Write-Host "El elemento no existe"
    }