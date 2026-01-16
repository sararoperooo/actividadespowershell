[int]$renta=Read-Host "Introduce tu renta anual: "
switch ($renta){
    {$_ -lt 10000}                     {Write-Host "Tu tipo impositivo es 5%"}
    {$_ -gt 10000 -and $_ -lt 20000}   {Write-Host "Tu tipo impositivo es 15%"}
    {$_ -gt 20000 -and $_ -lt 35000}   {Write-Host "Tu tipo impositivo es 20%"}
    {$_ -gt 35000 -and $_ -lt 60000}   {Write-Host "Tu tipo impositivo es 30%"}
    {$_ -gt 60000}                     {Write-Host "Tu tipo impositivo es 45%"}
}