
$json = Get-Content .\AdvancedSecurityEventIDs.json | ConvertFrom-Json

$categories = "Account Logon", "Account Management", "Detailed Tracking", "DS Access", "Global Object Access Auditing", "Logon Logoff", "Object Access", "Other Events", "Policy Change", "Privilege Use", "System"

foreach ($category in $categories){

    Write-Host "Search for $category"

    $cat = $json | Where-Object {$_.Category -eq $category}
    # debug 
    # Write-Host $cat

    $cat | ConvertTo-Json | Out-File -Path "./Categories/$category.json"

}





