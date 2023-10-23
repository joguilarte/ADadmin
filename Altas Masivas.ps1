# Importar el módulo de Active Directory para ejecutar los cmdlets de AD
Import-Module ActiveDirectory

# Almacenar los datos de NewUsersFinal.csv en la variable $ADUsers
$ADUsers = Import-Csv "$env:USERPROFILE\Desktop\AD\NewUsersFinal.csv" -Delimiter ","

# Define UPN
$UPN = "dorinka.com"

# Loop a través de cada fila que contiene los detalles del usuario en el archivo CSV
foreach ($User in $ADUsers) {

    # Leer los datos del usuario de cada campo en cada fila y asignar los datos a una variable como se muestra a continuación
    $username = $User.username
    $password = $User.password
    $firstname = $User.firstname
    $lastname = $User.lastname
    $initials = $User.initials
    $OU = $User.ou # Este campo se refiere a la OU en la que se creará la cuenta de usuario
    $email = $User.email
    $streetaddress = $User.streetaddress
    $city = $User.city
    $zipcode = $User.zipcode
    $state = $User.state
    $country = $User.country
    $telephone = $User.telephone
    $jobtitle = $User.jobtitle
    $company = $User.company
    $department = $User.department
    $homepage = $User.homepage
    $POBox = $User.POBox
    $employeeID = $User.employeeID
    $employeeNumber = $User.employeeNumber
    $Office = $User.Office
    $manager = $User.manager
    $description = $User.description

    # Comprobar si el usuario ya existe en AD
    if (Get-ADUser -F { SamAccountName -eq $username }) {
        
        # Si el usuario ya existe, mostrar una advertencia
        Write-Warning "Ya existe una cuenta de usuario con el nombre de usuario $username en Active Directory."
    }
    else {

        # Si el usuario no existe, proceder a crear la nueva cuenta de usuario
        # La cuenta se creará en la OU proporcionada por la variable $OU leída del archivo CSV
        New-ADUser `
            -SamAccountName $username `
            -UserPrincipalName "$username@$UPN" `
            -Name "$firstname $lastname" `
            -GivenName $firstname `
            -Surname $lastname `
            -Initials $initials `
            -Enabled $True `
            -DisplayName "$lastname, $firstname" `
            -Path $OU `
            -City $city `
            -PostalCode $zipcode `
            -Country $country `
            -HomePage $homepage `
            -POBox $POBox `
            -employeeID $employeeID `
            -employeeNumber $employeeNumber `
            -manager $manager `
            -Office $Office `
            -Company $company `
            -State $state `
            -StreetAddress $streetaddress `
            -OfficePhone $telephone `
            -EmailAddress $email `
            -Title $jobtitle `
            -Department $department `
            -Description $description `
            -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -ChangePasswordAtLogon $False

        # Si se crea el usuario, mostrar un mensaje.
        Write-Host "Se ha creado la cuenta de usuario $username." -ForegroundColor Cyan
    }
}

Read-Host -Prompt "Presione Enter para salir"
