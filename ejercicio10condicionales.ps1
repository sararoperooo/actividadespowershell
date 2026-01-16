[double]$puntuación=Read-Host "Introduce tu puntuación"
switch ($puntuación){
    {$_ -eq 0.0}              {Write-Host "Tu nivel es Inaceptable"}
    {$_ -eq 0.4}              {Write-Host "Tu nivel es Aceptable"} 
    {$_ -ge 0.6}              {Write-Host "Tu nivel es Meritorio"}
}
$dinero= 2400 * $puntuación
Write-Host "La cantidad de dinero que recibiras es: $dinero €"