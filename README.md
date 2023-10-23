# ADadmin
Scripts para la administración de active directory

# Scripts de PowerShell para la administración de Active Directory

Este repositorio contiene una serie de scripts de PowerShell útiles para la administración de Active Directory. Cada script realiza una tarea específica, como agregar usuarios a grupos, realizar altas masivas, blanquear contraseñas, entre otros.

## Preparación

1. Clona este repositorio en tu máquina local.
2. Asegúrate de tener instalado PowerShell y el módulo Active Directory para PowerShell.
3. Coloca todos los archivos CSV necesarios en la carpeta `AD` en el escritorio del usuario.

## Uso

Para utilizar estos scripts, simplemente ejecuta el script `Menu.ps1` en PowerShell. Este script mostrará un menú interactivo con varias opciones. Cada opción corresponde a uno de los scripts de administración de Active Directory.

Cuando seleccionas una opción, el script correspondiente se ejecutará. Algunos scripts requieren un archivo CSV con datos específicos. Asegúrate de tener estos archivos CSV en la carpeta `AD` en el escritorio del usuario.

Aquí está la lista de scripts disponibles y su descripción:

1. `Agregar usuarios a grupos de AD.ps1`: Agrega usuarios a grupos de Active Directory. Necesita un archivo CSV llamado `UserList.csv` con las columnas `sAMAccountName` y `group`.
2. `Altas Masivas.ps1`: Realiza altas masivas de usuarios. Necesita un archivo CSV llamado `NewUsersFinal.csv` con las columnas correspondientes a los detalles del usuario (nombre de usuario, contraseña, nombre, apellido, etc.).
3. `Blanqueo Masivo.ps1`: Realiza un blanqueo masivo de contraseñas. Necesita un archivo CSV llamado `UserList.csv` con las columnas `sAMAccountName` y `Password`.
4. `Crear grupos de AD.ps1`: Crea grupos en Active Directory. Necesita un archivo CSV llamado `grupos.csv` con las columnas `grupos` y `OU`.
5. `Extraer id de usuarios usando su MAIL.ps1`: Extrae el ID de los usuarios usando su correo electrónico. Necesita un archivo CSV llamado `UserList.csv` con la columna `email`.
6. `Extraer id de usuarios usando su DNI.ps1`: Extrae el ID de los usuarios usando su DNI. Necesita un archivo CSV llamado `UserList.csv` con la columna `WebPage`.
7. `Extraer miembros de usuarios de grupos Especificos.ps1`: Extrae los miembros de grupos específicos. Necesita un archivo CSV llamado `UserList.csv` con la columna `grupos`.
8. `Extraer todas las OU.ps1`: Extrae todas las Unidades Organizativas (OU). No necesita un archivo CSV.
9. `Extraer todas las OU que contengan usuarios.ps1`: Extrae todas las Unidades Organizativas (OU) que contengan usuarios. No necesita un archivo CSV.
10. `Remover usuarios de grupos AD.ps1`: Remueve usuarios de grupos en Active Directory. Necesita un archivo CSV llamado `UserList.csv` con las columnas `sAMAccountName` y `group`.
11. `Setear contraseñas que NO expiren de forma masiva.ps1`: Configura las contraseñas para que no expiren. Necesita un archivo CSV llamado `UserList.csv` con la columna `sAMAccountName`.
12. `Extraer todos los grupos de AD.ps1`: Extrae todos los grupos de Active Directory. No necesita un archivo CSV.
13. `Grupos a los que pertenece un usuario.ps1`: Muestra los grupos a los que pertenece un usuario específico. Necesita un archivo CSV llamado `UserList.csv` con la columna `SamAccountName`.
14. `Todos los usuarios en el dominio.ps1`: Muestra todos los usuarios en el dominio. No necesita un archivo CSV.
15. `Verificar que un ID no este en uso.ps1`: Verifica si un ID específico está en uso. Necesita un archivo CSV llamado `Users.csv` con la columna 'samAccountName'.

## Contribuciones

Las contribuciones son bienvenidas! Por favor, siéntete libre de abrir un problema o hacer un pull request si tienes alguna mejora o corrección.

---
