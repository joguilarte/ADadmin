# Importar el módulo de Active Directory
Import-Module ActiveDirectory

# Especificar la ruta del archivo CSV
$csvPath = "$env:USERPROFILE\Desktop\AD\grupos.csv"

# Leer los datos del archivo CSV
$csvData = Import-Csv -Path $csvPath

# Recorrer cada fila del archivo CSV
foreach ($row in $csvData) {
    # Obtener el nombre del grupo de la columna "grupos"
    $groupName = $row.grupos

    # Obtener la OU de la columna "OU"
    $ou = $row.OU

    # Crear el grupo en el AD en la OU especificada
    New-ADGroup -Name $groupName -GroupScope Global -Path $ou

}
