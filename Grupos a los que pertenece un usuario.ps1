# Ruta donde se encuentra el archivo CSV con la lista de usuarios
$usersFile = "$env:USERPROFILE\Desktop\AD\UserList.csv"

# Ruta donde se guardará el archivo CSV con los grupos de los usuarios
$outputFile = "$env:USERPROFILE\Desktop\AD\UsersGroups.csv"

# Cargar la lista de usuarios desde el archivo CSV
$users = Import-Csv $usersFile

# Recorrer la lista de usuarios y extraer los grupos
$results = foreach ($user in $users) {
    $groups = Get-ADPrincipalGroupMembership $user.SamAccountName |
              Select-Object -ExpandProperty Name
    foreach ($group in $groups) {
        [PSCustomObject]@{
            Nombre = $user.Name
            ID = $user.SamAccountName
            Grupo = $group
        }
    }
}

# Exportar los resultados a un archivo CSV
$results | Export-Csv $outputFile -NoTypeInformation
