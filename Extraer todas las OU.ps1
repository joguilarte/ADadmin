# Configurar la ruta de salida del archivo CSV
$csvPath = "$env:USERPROFILE\Desktop\AD\usuarios.csv"

# Obtener todas las OU de Active Directory
$ous = Get-ADOrganizationalUnit -Filter *

# Exportar las OU a un archivo CSV
$ous | Select-Object DistinguishedName, Name | Export-Csv $csvPath -NoTypeInformation
