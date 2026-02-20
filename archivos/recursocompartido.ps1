$rutaEmpresa = "C:\Empresa"
$dom = (Get-ADDomain).NetBIOSName

New-Item -Path $rutaEmpresa -ItemType Directory

$acl= Get-Acl -Path $rutaEmpresa
$Acl.SetAccessRuleProtection($true, $false)

#permisos adiministradores
$permisoadd = @('Administradores', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoadd
$acl.SetAccessRule($ace)


$permisoadd = @("$($dom)\Usuarios del dominio", 'ReadAndExecute', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoadd
$acl.SetAccessRule($ace)

Set-Acl -Path $rutaEmpresa -AclObject $acl


$departamentos = Import-Csv "C:\Users\Administrador\Desktop\examen\departamentos.csv" -Delimiter ";"

foreach ($dep in $departamentos) {
    $nombreDepartamento = $dep.departamento
    $descripcionDepartamento = $dep.descripcion

    $rutaDepartamento = "$($rutaEmpresa)\$($nombreDepartamento)"
    New-Item -Path $rutaDepartamento -ItemType Directory


    $acl= Get-Acl -Path $rutaDepartamento
    $acl.SetAccessRuleProtection($true, $false)

    #permisos adiministradores
    $permisoadd = @('Administradores', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
    $ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoadd
    $acl.SetAccessRule($ace)


    $permisoadd = @("$($dom)\$nombreDepartamento", 'Modify', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
    $ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoadd
    $acl.SetAccessRule($ace)

   

    foreach ($x in $departamentos) {
        if ($x.departamento -ne $nombreDepartamento) {
            $permisoadd = @("$($dom)\$($x.departamento)", 'ReadAndExecute', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
            $ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoadd
            $acl.SetAccessRule($ace)
        }
    }

    Set-Acl -Path $rutaDepartamento -AclObject $acl
}

New-SmbShare -Path $rutaEmpresa -Name "Empresa" -FullAccess "$($dom)\Usuarios del dominio"