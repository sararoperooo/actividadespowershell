$nombre=Read-Host "Introduce tu nombre"
$sexo=Read-Host "Introduce tu sexo"
$primeraletra=$nombre.Substring(0,1).ToUpper()
If (($sexo -eq "mujer") -and ($primeraletra -lt "M") -or (($sexo -eq "hombre") -and ($primeraletra -gt "M"))) {
    Write-Host "$nombre está en el grupo A"
    }
    Else{
        Write-Host "$nombre está en el grupo B"
    }