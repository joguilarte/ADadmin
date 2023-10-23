Import-Module ActiveDirectory
$csvPath = "$env:USERPROFILE\Desktop\AD\UserList.csv"
$users = Import-Csv -Path $csvPath
foreach ($user in $users) {
    $samAccountName = $user.sAMAccountName
    try {
        Set-ADUser -Identity $samAccountName -PasswordNeverExpires $true
        Write-Output "Password set to never expire for user $samAccountName"
    } catch {
        Write-Output "Failed to set password to never expire for user $samAccountName due to: $_"
    }
}
