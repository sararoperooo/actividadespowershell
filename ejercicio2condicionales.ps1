$edad = Read-Host "Introduce una edad: "
If ($edad -lt 18){
    Write-Host "Es menor de edad"
}
Else{
    Write-Host "Es mayor de edad"
}