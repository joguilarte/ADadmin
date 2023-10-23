# Configurar la ruta de salida del archivo CSV
$csvPath = "$env:USERPROFILE\Desktop\AD\usuarios.csv"

# Obtener todas las OU de Active Directory
$ous = Get-ADOrganizationalUnit -Filter *

# Filtrar solo las OU que contienen usuarios
$ousConUsuarios = @()
foreach ($ou in $ous) {
    $usuarios = Get-ADUser -SearchBase $ou.DistinguishedName -SearchScope OneLevel -Filter *
    if ($usuarios.Count -gt 0) {
        $ousConUsuarios += $ou
    }
}

# Exportar las OU a un archivo CSV
$ousConUsuarios | Select-Object DistinguishedName, Name | Export-Csv $csvPath -NoTypeInformation
