#El script va a leer los grupos que se encuentran en el CSV "userlist" luego los va a exportar a la carpeta TEMP
#"C:\Windows\Temp\ResultadoUsuarios.csv" El Script DEBE correrse en el domain controller


$grupos = Import-Csv -Path "$env:USERPROFILE\Desktop\AD\UserList.csv" | Select-Object -ExpandProperty grupos
$usuarios = foreach ($grupo in $grupos) {
    Get-ADGroupMember -Identity $grupo | Select-Object Name, SamAccountName, @{Name='Grupo';Expression={$grupo}}
}
$usuarios | Export-Csv -Path "$env:USERPROFILE\Desktop\AD\Resultadousuarios.csv" -NoTypeInformation
Write-Host "Los usuarios fueron exportados exitosamente" -ForegroundColor Green
