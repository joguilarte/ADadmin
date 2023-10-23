Import-Module ActiveDirectory
$AddUsers = Import-Csv "$env:USERPROFILE\Desktop\AD\UserList.csv"
foreach ($Account in $AddUsers) {
if(-not($Account.sAMAccountName) -or -not($Account.group)){
continue
}
$user = Get-ADUser -Identity $Account.sAMAccountName
if(Get-ADGroup -Identity $Account.group -ErrorAction SilentlyContinue) {
$GroupMembers = Get-ADGroupMember -Identity $Account.group
$userExist = $GroupMembers | Where-Object {$_.sAMAccountName -eq $Account.sAMAccountName}
if ($userExist) {
Write-Host "The user $($Account.sAMAccountName) is already a member of the group $($Account.group)." -ForegroundColor Yellow
} else {
Add-ADGroupMember -Identity $Account.group -Members $user -Confirm:$false
Write-Host "The user $($Account.sAMAccountName) was successfully added to the group $($Account.group)." -ForegroundColor Green
}
}
}
