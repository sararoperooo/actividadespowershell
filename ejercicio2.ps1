[int] $numero1 = Read-Host "Introduce un número: "
[int] $numero2 = Read-Host "Introduce otro número: "
$suma = $numero1 + $numero2
$resta = $numero1 - $numero2
$multiplicacion = $numero1 * $numero2
$division = $numero1 / $numero2
$resto = $numero1 % $numero2
Write-Host "El resultado de la suma es: $suma"
Write-Host "El resultado de la resta es: $resta"
Write-Host "El resultado de la multiplicación es: $multiplicacion"
Write-Host "El resultado de la división es: $division"
Write-Host "El resto es: $resto"