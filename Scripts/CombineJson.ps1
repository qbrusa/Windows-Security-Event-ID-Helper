$jsonFiles = Get-ChildItem -Recurse .\Categories\
$finaljson = @()

foreach ($file in $jsonFiles) {
    #Write-Host $file
    $filesToJson = Get-Content -Path $file -Raw | ConvertFrom-Json

    $finaljson += $filesToJson

}

$finaljson | ConvertTo-Json | Out-File -FilePath AdvancedSecurityEventIDs.json