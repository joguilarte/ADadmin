# Función para mostrar el menú
function Show-Menu
{
    param (
        [string]$Title = 'Menú'
    )
    Clear-Host
    Write-Host "================ $AD ================"
    
    Write-Host "1: Agregar usuarios a grupos de AD"
    Write-Host "2: Altas Masivas"
    Write-Host "3: Blanqueo Masivo"
    Write-Host "4: Crear grupos de AD"
    Write-Host "5: Extraer id de usuarios usando su MAIL"
    Write-Host "6: Extraer id de usuarios usando su DNI"
    Write-Host "7: Extraer miembros de usuarios de grupos Especificos"
    Write-Host "8: Extraer todas las OU"
    Write-Host "9: Extraer todas las OU que contengan usuarios"
    Write-Host "10: Remover usuarios de grupos AD"
    Write-Host "11: Setear contraseñas que NO expiren de forma masiva"
    Write-Host "12: Extraer todos los grupos de AD"
    Write-Host "13: Grupos a los que pertenece un usuario"
    Write-Host "14: Todos los usuarios en el dominio"
    Write-Host "15: Verificar que un ID no este en uso"
    Write-Host "Q: Salir."
}

# Bucle infinito hasta que el usuario salga del script
do
{
    Show-Menu –Title 'Menú de scripts'
    $input = Read-Host "Por favor selecciona una opción"
    
    switch ($input)
    {
        '1' {
            & "$env:USERPROFILE\Desktop\AD\Agregar usuarios a grupos de AD.ps1"
            break
        }
        '2' {
            & "$env:USERPROFILE\Desktop\AD\Altas Masivas.ps1"
            break
        }
        '3' {
            & "$env:USERPROFILE\Desktop\AD\Blanqueo Masivo.ps1"
            break
        }
        '4' {
            & "$env:USERPROFILE\Desktop\AD\Crear grupos de AD.ps1"
            break
        }
        '5' {
            & "$env:USERPROFILE\Desktop\AD\Extraer id de usuarios usando su MAIL.ps1"
            break
        }
        '6' {
            & "$env:USERPROFILE\Desktop\AD\Extraer id de usuarios usando su DNI.ps1"
            break
        }
        '7' {
            & "$env:USERPROFILE\Desktop\AD\Extraer miembros de usuarios de grupos Especificos.ps1"
            break
        }
        '8' {
            & "$env:USERPROFILE\Desktop\AD\Extraer todas las OU.ps1"
            break
        }
        '9' {
            & "$env:USERPROFILE\Desktop\AD\Extraer todas las OU que contengan usuarios.ps1"
            break
        }
        '10' {
            & "$env:USERPROFILE\Desktop\AD\Remover usuarios de grupos AD.ps1"
            break
        }
        '11' {
            & "$env:USERPROFILE\Desktop\AD\Setear contraseñas que NO expiren de forma masiva.ps1"
            break
        }
        '12' {
            & "$env:USERPROFILE\Desktop\AD\Extraer todos los grupos de AD.ps1"
            break
        }
        '13' {
            & "$env:USERPROFILE\Desktop\AD\Grupos a los que pertenece un usuario.ps1"
            break
        }
        '14' {
            & "$env:USERPROFILE\Desktop\AD\Todos los usuarios en el dominio.ps1"
            break
        }
        '15' {
            & "$env:USERPROFILE\Desktop\AD\Verificar que un ID no este en uso.ps1"
            break
        }
        'Q' {
            return
        }
    }
    
    pause
}
until ($input -eq 'q')
