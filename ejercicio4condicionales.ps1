[int] $num1 = Read-Host "Introduce un número: "
[int] $num2 = Read-Host "Introduce otro número: "
Write-Host "****** CALCULADORA ******"
Write-Host "1.Sumar"
Write-Host "2.Restar"
Write-Host "3.Multiplicar"
Write-Host "4.Dividir"
$opcion = Read-Host "¿Qué desea hacer? Elige una opción"
switch ($opcion) {
        {$_ -eq "Sumar"}{
            $resultado = $num1 + $num2
            Write-Host "El resultado de la operación es: $resultado"
            }
        
        {$_ -eq "Restar"}{
            $resultado = $num1 - $num2
            Write-Host "El resultado de la operación es: $resultado"
            }
        
        {$_ -eq "Multiplicar"}{
            $resultado = $num1 * $num2
            Write-Host "El resultado de la operación es: $resultado"
            }
        {$_ -eq "Dividir"}{
            $resultado = $num1 / $num2
            Write-Host "El resultado de la operación es: $resultado"
            }
        {default}{
            Write-Host "Introduce una opción válida"
        }
    
        