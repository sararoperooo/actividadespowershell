$contrasenya="hola01"
$contrasenya_usu=Read-Host "Introduce una contraseña"
If ($contrasenya -ieq $contrasenya_usu){
    Write-Host "La contraseña introducida es correcta"
    }
    Else {
    Write-Host "La contraseña introoducida es incorrecta"
    }