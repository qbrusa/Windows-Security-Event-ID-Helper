<#
.SYNOPSIS
  Add Mitre Att&ck TTP on Event ID
.DESCRIPTION
  This script add Mitre TTP from EID_TTP.csv to each Event ID
.INPUTS
  EID_TTP
.OUTPUTS
  AdvancedSecurityEventIDs.json
.NOTES
  Version:        1.0
  Author:         Quentin BRUSA
  Creation Date:  02-03-2023
  Purpose/Change: Initial script development
.EXAMPLE
  ./addMitreTTP.ps1
#>


#----------------------------------------------------------[Declarations]----------------------------------------------------------


#-----------------------------------------------------------[Functions]------------------------------------------------------------

#-----------------------------------------------------------[Execution]------------------------------------------------------------

$csv = Import-Csv -path .\EID_TTP.csv -Delimiter ";"
$json = Get-Content .\AdvancedSecurityEventIDs.json | ConvertFrom-Json

foreach ($line in $csv){
    $EID = $line.EID
    $TTP = $line.TTP
    $y = 0
   
    #Search Event in the SourceTag exist
    $evt = $json | Where-Object {$_.eventID -eq $EID}
        
    # If exist
    if ($evt){

        $EID

        # If multiple event was found
        if($evt.count -gt 1){
    
            foreach ($EvtID in $evt){
                # Reset Count if TTP exist
                $y=0

                # Verify if TTP exist

                for ($i=0; $i -lt $EvtID.MitreTTP.length; $i++){

                    if ($EvtID.MitreTTP[$i] -eq $TTP){
                           $y = 1
                    }
                }
                
                # If TTP not exist
                if ($y -eq 0){
                    
                    #Add TTP on event
                    $EvtID.MitreTTP += $TTP
             
                }

            }
        }else{
        #If only one event

        for ($i=0; $i -lt $evt.MitreTTP.length; $i++){

            if ($evt.MitreTTP[$i] -eq $TTP){
                   $y = 1
            }
        }
        
        # If TTP not exist
        if ($y -eq 0){
            
            #Add TTP on event
            $evt.MitreTTP += $TTP
     
        }

        }
    }
    # Write modification
    $json | ConvertTo-Json | Out-File -FilePath AdvancedSecurityEventIDs.json
}

