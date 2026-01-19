[int]$numero=Read-Host "Introduce un número positivo"
If ($numero -gt 0){
    for($i=$numero; $i -ge 0; $i--){
        Write-Host ($i -join ', ')
    }
}
Else {
    Write-Host "El número debe ser porsitivo"
}