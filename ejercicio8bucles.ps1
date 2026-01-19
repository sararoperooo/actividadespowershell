$numero=Read-Host "Introduce un número"
for ($i=1; $i -le $numero; $i+=2){
    Write-Host $i
    for ($j=1; $j -le $i; $j+=2){
    Write-Host $j
    }
}