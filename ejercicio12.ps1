$tipo_pizza=Read-Host "Introduce que tipo de pizza quieres"
If ($tipo_pizza -eq "Vegetariana"){
    Write-Host "Puedes añadir un ingrediente más entre los siguientes: Pimiento y Tofu"

}
Else{
 Write-Host "Puedes añadir un ingrediente más entre los siguientes: Peperoni, Jamón y salmón"   
}