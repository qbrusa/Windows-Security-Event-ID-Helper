<#
.SYNOPSIS
  Combine JSON files from a folder
.DESCRIPTION
  This script combine each EventIDs sub-categories in a one Json file
.INPUTS
  None
.OUTPUTS
  AdvancedSecurityEventIDs.json
.NOTES
  Version:        1.0
  Author:         Quentin BRUSA
  Creation Date:  02-03-2023
  Purpose/Change: Initial script development
.EXAMPLE
  ./CombineJson.ps1
#>


#----------------------------------------------------------[Declarations]----------------------------------------------------------

$finalJson = @()

#-----------------------------------------------------------[Functions]------------------------------------------------------------

#-----------------------------------------------------------[Execution]------------------------------------------------------------
$jsonFiles = Get-ChildItem -Recurse .\Categories\

# Get-Content of each file in Categories folder
foreach ($file in $jsonFiles) {
    
    $filesToJson = Get-Content -Path $file -Raw | ConvertFrom-Json
    
    $finalJson += $filesToJson

}

# Write finalJson to AdvancedSecurityEventIDs.json
$finalJson | ConvertTo-Json | Out-File -FilePath AdvancedSecurityEventIDs.json