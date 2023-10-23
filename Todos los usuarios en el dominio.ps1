
Get-ADUser -Filter * -Properties AccountExpirationDate,ObjectClass,CN,Description,LastLogonDate,EmailAddress,Homepage,
enabled,LockedOut -SearchBase "DC=Dorinka, DC=com" | export-csv -path "$env:USERPROFILE\Desktop\AD\UserList.csv"
