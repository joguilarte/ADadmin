# Importar el módulo de Active Directory para ejecutar los cmdlets de AD
Import-Module ActiveDirectory

# Ruta del archivo CSV que contiene los nuevos usuarios
$csvPath = "$env:USERPROFILE\Desktop\AD\UserList.csv"

# Importar el archivo CSV
$users = Import-Csv -Path $csvPath -Delimiter ","

# Verificar los nombres de cuenta SAM en uso
foreach ($user in $users) {
    $samAccountName = $user.'samAccountName'
    $userExists = Get-ADUser -Filter "SamAccountName -eq '$samAccountName'" -ErrorAction SilentlyContinue

    if ($userExists) {
        Write-Host "El nombre de cuenta '$samAccountName' ya está en uso." -ForegroundColor Green
    } else {
        Write-Host "El nombre de cuenta '$samAccountName' no está disponible." -ForegroundColor Red
    }
}
