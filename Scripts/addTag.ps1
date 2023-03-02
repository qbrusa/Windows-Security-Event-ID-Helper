<#
.SYNOPSIS
  Add tags on event ID
.DESCRIPTION
  This script adds a tag to each project security reference event.
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
  ./addTag.ps1
#>


#----------------------------------------------------------[Declarations]----------------------------------------------------------
$cat = @()

$SRV_ETM = "4618","4649","4719","4765","4766","4794","4897","4964","5124","4675","4692","4693","4706","4713","4714","4715","4716","4724","4727","4735","4737","4739","4754","4755","4764","4764","4780","4816","4865","4866","4867","4868","4870","4882","4885","4890","4892","4896","4906","4907","4908","4912","4960","4961","4962","4963","4965","4976","4977","4978","4983","4984","5027","5028","5029","5030","5035","5037","5038","5120","5121","5122","5123","5376","5377","5453","5480","5483","5484","5485","5827","5828","6145","6273","6274","6275","6276","6277","6278","6279","6280","24586","24594","4608","4609","4610","4611","4612","4614","4615","4616","4622","4624","4625","4634","4646","4647","4648","4650","4651","4652","4653","4654","4655","4656","4657","4658","4659","4660","4661","4662","4663","4664","4665","4666","4667","4668","4670","4671","4672","4673","4674","4688","4689","4690","4691","4694","4695","4696","4697","4698","4699","4700","4701","4702","4704","4705","4707","4709","4710","4711","4712","4717","4718","4720","4722","4723","4725","4726","4728","4729","4730","4731","4732","4733","4734","4738","4740","4741","4742","4743","4744","4745","4746","4747","4748","4749","4750","4751","4752","4753","4756","4757","4758","4759","4760","4761","4762","4767","4768","4769","4770","4771","4772","4774","4775","4776","4777","4778","4779","4781","4782","4783","4784","4785","4786","4787","4788","4789","4790","4793","4800","4801","4802","4803","4864","4869","4871","4872","4873","4874","4875","4876","4877","4878","4879","4880","4881","4883","4884","4886","4887","4888","4889","4891","4893","4894","4895","4898","4902","4904","4905","4909","4910","4928","4929","4930","4931","4932","4933","4934","4935","4936","4937","4944","4945","4946","4947","4948","4949","4950","4951","4952","4953","4954","4956","4957","4958","4979","4980","4981","4982","4985","5024","5025","5031","5032","5033","5034","5039","5040","5041","5042","5043","5044","5045","5046","5047","5048","5050","5051","5056","5057","5058","5059","5060","5061","5062","5063","5064","5065","5066","5067","5068","5069","5070","5125","5126","5127","5136","5137","5138","5139","5140","5141","5152","5153","5154","5155","5156","5157","5158","5159","5378","5440","5441","5442","5443","5444","5446","5447","5448","5449","5450","5451","5452","5456","5457","5458","5459","5460","5461","5462","5463","5464","5465","5466","5467","5468","5471","5472","5473","5474","5477","5479","5632","5633","5712","5888","5889","5890","6008","6144","6272","24577","24578","24579","24580","24581","24582","24583","24584","24588","24595","24621","5049","5478"
$JSCU_NL = "1000","1002","865","866","867","868","882","8002","8003","8004","8005","8006","8007","8023","8020","1","3","4","59","51039","3008","50028","4104","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","0","1","2","3","4","5","6","7","8","9","10","11","14","15","16","18","21","22","23","24","25","26","255","200","201","1024","5857","5858","5860","5861","260","1006","1007","1008","1009","1010","1116","1117","1118","1119","1121","1122","1123","1124","1125","1126","5007","1100","1102","4610","4611","4614","4616","4622","4624","4625","4627","4634","4647","4648","4649","4657","4663","4672","4673","4688","4689","4697","4698","4699","4700","4701","4702","4706","4713","4715","4716","4717","4719","4720","4722","4723","4724","4725","4726","4727","4728","4729","4730","4731","4732","4733","4734","4735","4737","4738","4739","4740","4741","4742","4743","4754","4755","4756","4757","4758","4764","4767","4768","4769","4771","4778","4779","4780","4781","4782","4794","4798","4799","4817","4826","4865","4866","4867","4904","4905","4906","4907","4908","4912","5038","5140","5142","5376","5377","5632","6281","6410","6416","104","12","13","41","5","7031","7034","7040","1074"
$MDE = "4624","4625","4648","4664","4670","4697","4698","4699","4702","4719","4720","4724","4726","4731","4732","4733","4734","4738","4798","4799","4907","5024","5025","5031","5058","5157","5376","5379","5380","5381","5382","6416","6423"
$YAMATO = "4776","4776","4768","4771","4772","4769","4770","4773","4741","4742","4743","4782","4793","4727","4728","4729","4730","4731","4732","4733","4734","4737","4754","4755","4756","4757","4758","4764","4799","4720","4722","4723","4724","4725","4726","4738","4740","4765","4766","4767","4780","4781","4794","4798","5376","5377","6416","4688","4689","5712","4703","4661","4662","5136","5137","5138","5139","5141","4625","4627","4634","4647","4624","4648","4649","4778","4779","4800","4801","4802","4803","5632","5633","4672","4964","4898","4899","5145","5140","5142","5143","5144","5168","4656","4658","4660","4663","4664","4670","5051","5031","5150","5151","5154","5155","5156","5157","5158","5159","5152","5153","4698","4699","4700","4701","4702","5148","5149","5888","5889","5890","4657","4715","4719","4817","4902","4904","4905","4907","4908","4912","4706","4707","4713","4716","4717","4718","4739","4864","4865","4866","4867","4704","4705","4911","4913","4944","4945","4946","4947","4948","4949","4950","4951","4952","4953","4954","4956","4957","4958","4673","4674","4985","4608","4616","4611","4697"
$ANSSI = "1120","4688","4776","4648","4624","4624","4624","4625","4740","4778","4779","1024","1025","4672","300","4720","4722","4725","4726","4732","4728","4756","2027","2025","2027","5632","5632","5140","5145","5142","5144","3062","3062","1102","104","4616","4657","2003","2004","2006","2010","2100","2101","2105","2106","6416","106","141","142","107","140","100","129","200","106","141","142","107","140","100","129","200","4697","1000","1002","4103","4104","4105","4106","800","12","13"
$CORTEX = "1511","1518","1000","1002","11","70","90","3008","2004","4103","4104","4105","4106","106","129","141","142","200","201","1024","1006","1009","1116","1119","2004","2005","2006","2009","2033","1102","4880","4881","4896","4898","6272","6280","4624","4625","4634","4647","4648","4649","4672","4768","4769","4770","4771","4776","4778","4800","4801","4802","4803","4720","4722","4723","4724","4725","4726","4727","4728","4729","4731","4732","4733","4735","4737","4738","4740","4741","4742","4743","4754","4755","4756","4757","4764","4765","4766","4767","4780","4799","4616","4821","4822","4823","4824","4698","4702","4886","4887","4899","4900","5140","4713","4662"
$MDI = "4776","4741","4743","4753","4763","4728","4729","4730","4732","4733","4756","4757","4758","4726","4662","5136","7045"
$SENTINEL = "1","299","300","324","340","403","404","410","411","412","413","431","500","501","1100","1102","1107","1108","4608","4610","4611","4614","4622","4624","4625","4634","4647","4648","4649","4657","4661","4662","4663","4665","4666","4667","4688","4670","4672","4673","4674","4675","4689","4697","4700","4702","4704","4705","4716","4717","4718","4719","4720","4722","4723","4724","4725","4726","4727","4728","4729","4733","4732","4735","4737","4738","4739","4740","4742","4744","4745","4746","4750","4751","4752","4754","4755","4756","4757","4760","4761","4762","4764","4767","4768","4771","4774","4778","4779","4781","4793","4797","4798","4799","4800","4801","4802","4803","4825","4826","4870","4886","4887","4888","4893","4898","4902","4904","4905","4907","4931","4932","4933","4946","4948","4956","4985","5024","5033","5059","5136","5137","5140","5145","5632","6144","6145","6272","6273","6278","6416","6423","6424","8001","8002","8003","8004","8005","8006","8007","8222","26401","30004"
$ADSECURITY = "1102","517","4610","4611","4614","4622","4648","4661","4672","4723","4964","7045","4697","4698","4702","4719","612","4732","4720","3065","3066","3063","4798","4908","4713","4716","4739","4867","4741","4742","4692","4768","4771","4769","4624","4625","4648","4698","4699","4702","4732","4756","4610","4611","4697","4672","4674","4964","4720","4722","4723","4738","4765","4766","4780","4794"


#-----------------------------------------------------------[Functions]------------------------------------------------------------

function addTag {
    param (
        [Parameter(Mandatory=$true, Position=0)]$SourceTag, 
        [Parameter(Mandatory=$true, Position=2)] [string]$Tag
    )

    foreach ($evt in $SourceTag){
   
        #Search Event in the SourceTag exist
        $cat = $json | Where-Object {$_.eventID -eq $evt}
        
        # If exist
        if ($cat){
            
            # Count if tag exist
            $y=0

            # If multiple event was found
            if($cat.count -gt 1){
    
                foreach ($EID in $cat){
                    # Reset Count if tag exist
                    $y=0

                    # Verify if tags already exist
                    for ($i=0; $i -lt $EID.tags.length; $i++){
                        
                        if ($EID.tags[$i] -eq $Tag){
                            $y = 1
                        }
                    }

                    # If tag not exist
                    if ($y -eq 0){
                        $EID.tags += $Tag
                    }
    
                }
            }else{
            #If only one event

            # Verify if tags already exist
            for ($i=0; $i -lt $cat.tags.length; $i++){

                if ($cat.tags[$i] -eq $Tag){
                       $y = 1
                }
            }
            
            # If tag not exist
            if ($y -eq 0){
                
                #Add tag on event
                $cat.tags += $Tag
            }
            
        }
            
        }
    
    }
    
    # Write modification
    $json | ConvertTo-Json | Out-File -FilePath AdvancedSecurityEventIDs.json
}


#-----------------------------------------------------------[Execution]------------------------------------------------------------
$json = Get-Content .\AdvancedSecurityEventIDs.json | ConvertFrom-Json

addTag -SourceTag $SRV_ETM -Tag "SRV-ETM"
addTag -SourceTag $JSCU_NL -Tag "JSCU-NL"
addTag -SourceTag $MDE -Tag "MDE"
addTag -SourceTag $YAMATO -Tag "YAMATO"
addTag -SourceTag $ANSSI -Tag "ANSSI"
addTag -SourceTag $CORTEX -Tag "CORTEX"
addTag -SourceTag $MDI -Tag "MDI"
addTag -SourceTag $SENTINEL -Tag "SENTINEL"
addTag -SourceTag $ADSECURITY -Tag "ADSECURITY"




