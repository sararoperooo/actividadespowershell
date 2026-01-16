$elemento = Read-Host "Introduce un directorio: "
If (Test-Path $elemento -PathType Container) {
  Write-Host "La ruta indicada es un directorio: "
  Get-ChildItem -Path $elemento -Recurse
  }
  Else {
    Write-Host "La ruta inidicada no es un directorio o no existe"
    }