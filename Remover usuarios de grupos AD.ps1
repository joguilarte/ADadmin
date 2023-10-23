Import-Module ActiveDirectory
$RemoveUsers = Import-Csv "$env:USERPROFILE\Desktop\AD\UserList.csv" 
foreach ($Account in $RemoveUsers) {
    if(-not($Account.sAMAccountName) -or -not($Account.group)){
        continue
    }
    $user = Get-ADUser -Identity $Account.sAMAccountName 
    if(Get-ADGroup -Identity $Account.group -ErrorAction SilentlyContinue) {
        $GroupMembers = Get-ADGroupMember -Identity $Account.group
        $userExist = $GroupMembers | Where-Object {$_.sAMAccountName -eq $Account.sAMAccountName}
        if ($userExist) {
            Remove-ADGroupMember -Identity $Account.group -Members $user -Confirm:$false
            Write-Host "The user $($Account.sAMAccountName) was successfully removed from the group $($Account.group)." -ForegroundColor Green
        } else {
            Write-Host "The user $($Account.sAMAccountName) is not a member of the group $($Account.group)." -ForegroundColor Red
        }
    }
}