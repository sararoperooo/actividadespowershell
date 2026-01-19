[int]$numero = Read-Host "Introduce un número positivo"
$contador_impares=0
for($i=1; $i -le $numero; $i+=2){
    $contador_impares+=$i

}
Write-Host ($contador_impares -join ", ")