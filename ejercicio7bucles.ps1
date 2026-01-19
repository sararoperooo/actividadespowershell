$altura=Read-host "Introduce un número: "
for ($i=1; $i -le $altura; $i++){
       for($j=1; $j -le $i; $j++){
        Write-Host "*"
    }
    Write-Host ""
}