$numero=Read-Host "Introduce un número"
for ($i=1; $i -le $numero; $i+=2){
    $linea=""
    for ($j=$i; $j -ge 1; $j-=2){
    $linea += "$j"
    }
    Write-Host $linea
}
