New-ADOrganizationalUnit -Name "Empresa" -Path "DC=EMPRESA,DC=LOCAL" -Description "Unidad Empresa" -ProtectedFromAccidentalDeletion $false

$departamentos = Import-Csv "C:\Users\Administrador\Desktop\archivos\departamentos.csv" -Delimiter ";"

$ouEmpresaDN = "OU=Empresa,DC=EMPRESA,DC=LOCAL"

foreach ($dep in $departamentos) {
    $nombreDepartamento = $dep.departamento
    $descripcionDepartamento = $dep.descripcion

    New-ADOrganizationalUnit -Name $nombreDepartamento -Path $ouEmpresaDN -Description $descripcionDepartamento -ProtectedFromAccidentalDeletion $false

    $ouDepartamentoDN = "OU=$($nombreDepartamento),OU=Empresa,DC=EMPRESA,DC=LOCAL"

    New-ADGroup -Name $nombreDepartamento -GroupCategory Security -GroupScope Global -Path $ouDepartamentoDN
}

$empleados = Import-Csv "C:\Users\Administrador\Desktop\archivos\empleados.csv" -Delimiter ";"

foreach ($emp in $empleados) {
    $nombre = "$($emp.nombre)" -replace "\s", ""
    $apellido = $emp.apellido
    $nomdepartamento = $emp.departamento
    $usuario = ("$($nombre).$($apellido)" -replace "\s", "").ToLower()

    $ouDepartamentoDN = "OU=$($nomdepartamento),OU=Empresa,DC=EMPRESA,DC=LOCAL"

    New-ADUser -Name $nombre -Path $ouDepartamentoDN -SamAccountName $usuario -UserPrincipalName "$($usuario)@empresa.local" -AccountPassword (ConvertTo-SecureString "aso2023." -AsPlainText -Force) -GivenName $nombre -Surname $apellido -ChangePasswordAtLogon $true -Enabled $true


    Add-ADGroupMember -Identity $nomdepartamento -Members $usuario

}