Function sumar {
    param (
        [int]$x,
        [int]$y
    )
    $sumar = $x + $y
    Write-Host "La respuesta es $sumar"
}

Function restar {
    param (
        [int]$x,
        [int]$y
    )
    $restar = $x - $y
    Write-Host "La respuesta es $restar"
}

Function multiplicar {
    param (
        [int]$x,
        [int]$y
    )
    $multiplicar = $x * $y
    Write-Host "La respuesta es $multiplicar"
}


Function dividir {
    param (
        [int]$x,
        [int]$y

    )
    $dividir = $x / $y
    Write-Host "La respuesta es $dividir"
}


Write-Host "****** CALCULADORA ******"
Write-Host "1.Sumar"
Write-Host "2.Restar"
Write-Host "3.Multiplicar"
Write-Host "4.Dividir"
Write-Host "5.Salir"

$opcion = Read-Host "¿Qué desea hacer?"
switch ($opcion) {
        {$_ -eq "Sumar"}{
            $x=Read-Host "Introduce un número: "
            $y=Read-Host "Introduce otro número: "
            Sumar $x $y
            
            }
        
        {$_ -eq "Restar"}{
            $x=Read-Host "Introduce un número: "
            $y=Read-Host "Introduce otro número: "
            restar $x $y
            }
        
        {$_ -eq "Multiplicar"}{
            $x=Read-Host "Introduce un número: "
            $y=Read-Host "Introduce otro número: "
            multiplicar $x $y
            }
        {$_ -eq "Dividir"}{
            $x=Read-Host "Introduce un número: "
            $y=Read-Host "Introduce otro número: "
            dividir $x $y
            }
        
}
