[int]$edad= Read-Host "Introduce tu edad"
switch ($edad){
    {$_ -lt 4}                          {Write-Host "La entrada es gratuita"}
    {$_ -ge 4 -and $_ -le 18}           {Write-Host "El precio de la entrada es: 5€"}
    {$_ -gt 18 }                        {Write-Host "El precio de la entrada es: 10€"}
}