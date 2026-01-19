[int]$numero=Read-Host "Introduce un número: "
for ($i=1; $i -le 10; $i++){
    Write-Host ($i * $numero)
}