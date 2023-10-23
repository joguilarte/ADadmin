# Import the users from the CSV file
$users = Import-Csv -Path "$env:USERPROFILE\Desktop\AD\UserList.csv" 
$results = @()
# Iterate through each user and retrieve their samAccountName
foreach ($user in $users) {
    $searcher = New-Object System.DirectoryServices.DirectorySearcher
    $searcher.Filter = "(&(objectClass=user)(mail=$($user.email)))"
    $result = $searcher.FindOne()
    $samAccountName = $result.Properties.samaccountname[0]
    $results += New-Object psobject -Property @{
        email = $user.email
        samaccountname = $samAccountName
    }
    Write-Output "email: $($user.email)  samAccountName: $samAccountName"
}
#Export the results to CSV file
$results | Export-Csv -Path "$env:USERPROFILE\Desktop\AD\ResultadoUsuarios.csv" -NoTypeInformation -Encoding UTF8


Write-Host "`Los usuarios se exportaron correctamente" -ForegroundColor Green