# Import the users from the CSV file
$users = Import-Csv -Path "$env:USERPROFILE\Desktop\AD\UserList.csv" 
$results = @()
# Iterate through each user and retrieve their samAccountName
foreach ($user in $users) {
    $searcher = New-Object System.DirectoryServices.DirectorySearcher
    $searcher.Filter = "(&(objectClass=user)(wWWHomePage=$($user.WebPage)))"
    $result = $searcher.FindOne()
    $samAccountName = $result.Properties.samaccountname[0]
    $results += New-Object psobject -Property @{
        WebPage = $user.WebPage
        samaccountname = $samAccountName
    }
    Write-Output "WebPage: $($user.WebPage)  samAccountName: $samAccountName"
}
#Export the results to CSV file
$results | Export-Csv -Path "$env:USERPROFILE\Desktop\AD\ResultadoUsuarios.csv" -NoTypeInformation -Encoding UTF8

Write-Host "`Los usuarios se exportaron correctamente" -ForegroundColor Green