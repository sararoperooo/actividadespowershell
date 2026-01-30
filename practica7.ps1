Import-Module ActiveDirectory
$dominioDN = "DC=empresa,DC=local"
$ouEmpresa = "OU=Empresa,$dominioDN"

$csvDepartamentos = ".\Desktop\actividadespowershell\archivos\departamentos.csv"
$csvEmpleados     = ".\Desktop\actividadespowershell\archivos\empleados.csv"

$password = ConvertTo-SecureString "aso2025." -AsPlainText -Force



if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Empresa'" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit `
        -Name "Empresa" `
        -Path $dominioDN `
        -Description "Unidad organizativa principal de la empresa"
}

$departamentos = Import-Csv $csvDepartamentos

foreach ($dep in $departamentos) {

    $rutaOUDept = "OU=$($dep.Departamento),$ouEmpresa"

   
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$($dep.Departamento)'" -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit `
            -Name $dep.Departamento `
            -Path $ouEmpresa `
            -Description $dep.Descripcion
    }

  
    if (-not (Get-ADGroup -Filter "Name -eq '$($dep.Departamento)'" -ErrorAction SilentlyContinue)) {
        New-ADGroup `
            -Name $dep.Departamento `
            -GroupScope Global `
            -GroupCategory Security `
            -Path $rutaOUDept
    }
}


$empleados = Import-Csv $csvEmpleados

foreach ($emp in $empleados) {

    $login = "$($emp.Nombre.ToLower()).$($emp.Apellido.ToLower())"
    $rutaOUUsuario = "OU=$($emp.Departamento),$ouEmpresa"

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$login'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name "$($emp.Nombre) $($emp.Apellido)" `
            -GivenName $emp.Nombre `
            -Surname $emp.Apellido `
            -SamAccountName $login `
            -UserPrincipalName "$login@empresa.local" `
            -Path $rutaOUUsuario `
            -AccountPassword $password `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Add-ADGroupMember `
            -Identity $emp.Departamento `
            -Members $login
    }
}
