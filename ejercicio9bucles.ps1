$contraseña_correcta="hola01"
$contraseña=Read-Host "Introduce una contraseña: "
while($contraseña -ne $contraseña_correcta){
    Write-Host "Contraseña incorrecta"
    $contraseña=Read-Host "Introduce otra contraseña"
}
Write-Host "Contraseña correcta"