$altura=Read-host "Introduce un número: "
for ($i=1; $i -le $altura; $i++){
        $linea=""
       for($j=1; $j -le $i; $j++){
        $linea+= "*"
    }
    Write-Host $linea
}