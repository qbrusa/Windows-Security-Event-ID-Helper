<#
.SYNOPSIS
  Separate Json file by Categories
.DESCRIPTION
  This script separate each EventIDs sub-categories in mulitple Json files
.INPUTS
  None
.OUTPUTS
  Account Logon.json, Account Management.json, Detailed Tracking.json, DS Access.json,"Logon Logoff.json, Object Access.json, Other Events.json, Policy Change.json, Privilege Use.json, System.json
.NOTES
  Version:        1.0
  Author:         Quentin BRUSA
  Creation Date:  02-03-2023
  Purpose/Change: Initial script development
.EXAMPLE
  ./SeparateJsonByCategories.ps1
#>


#----------------------------------------------------------[Declarations]----------------------------------------------------------

$categories = "Account Logon", "Account Management", "Detailed Tracking", "DS Access", "Logon Logoff", "Object Access", "Other Events", "Policy Change", "Privilege Use", "System"

#-----------------------------------------------------------[Functions]------------------------------------------------------------

#-----------------------------------------------------------[Execution]------------------------------------------------------------

# Get Json file
$json = Get-Content .\AdvancedSecurityEventIDs.json | ConvertFrom-Json

# Foreach category listed in categories var
foreach ($category in $categories){

    # Search Category in Json file
    $cat = $json | Where-Object {$_.Category -eq $category}

    # Write Category in a file
    $cat | ConvertTo-Json | Out-File -Path "./Categories/$category.json"

}





