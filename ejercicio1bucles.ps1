$nombre=Read-Host "Introduce un nombre de usuario: "
$numero=Read-Host "Introduce un número entero: "
for ($i=1; $i -le $numero; $i++){
    Write-Host $nombre
}
