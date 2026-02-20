
$csvDepartamentos = ".\Desktop\actividadespowershell\archivos\departamentos.csv"
$csvEmpleados     = ".\Desktop\actividadespowershell\archivos\empleados.csv"

New-ADOrganizationalUnit -Name "Empresa" -Path $dominioDN -Description "Unidad organizativa principal de la empresa"

$departamentos = Import-Csv $csvDepartamentos

foreach ($dep in $departamentos) {
    New-ADOrganizationalUnit -Name $dep.departamento -Path "OU=EMPRESA,DC=EMPRESA,DC=LOCAL" -Description $dep.'departamento;descripcion'  
    New-ADGroup -Name "G_$($_.departemento)" -GroupScope Global -Path "OU=$($_.departamento), OU=EMPRESA, DC=EMPRESA, DC=LOCAL" -Description $_.descripcion
}
$empleados = Import-Csv $csvEmpleados

foreach ($emp in $empleados) {
    New-ADUser -Name "$($_.nombre) $($_.apellido)" `
            -SamAccountName "$($_.nombre).$($_.apellido)".ToLower()`
            -UserPrincipalName "$($_.nombre).$($_.apellido)@empresa.local" `
            -Path "OU=$($_.departamento),OU=EMPRESA, DC=EMPRESA, DC=LOCAL"`
            -AccountPassword (ConvertTo-SecureString "aso2025." -AsPlainText -Force) `
            -ChangePasswordAtLogon $true `
            -Enabled $true 

        Add-ADGroupMember -Identity "G_$($_.departemento)" -Members "$($_.nombre).$($_.apellido)".ToLower()
}
