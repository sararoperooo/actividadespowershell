$usuarios = Import-Csv C:\Users\Administrador\Desktop\usuarios.csv -Delimiter ","

foreach($usu in $usuarios){
    Write-Host "Usuario: $($usu.nombre) $($usu.apellidos) $($usu.grupo)"
}