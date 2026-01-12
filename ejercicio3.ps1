[int]$numhoras = Read-Host "¿Cuántas horas has trabajado?"
[int] $coste_horas = Read-Host "¿Cuánto es el coste por hora?"
$salario = $numhoras * $coste_horas
Write-Host "El salario que debe pagarle es $salario"