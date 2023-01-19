# Under Construction :construction:

# Microsoft Event Matrix

The goal of this project is to gather all Security Event IDs in a json file and add connections to GPO settings. The end result allows you to filter on a each GPO setting and display all Event IDs produced by it. Additionally, tags were applied to each event ID per the advice of Microsoft or other security firms (See tags section for more informations). For SOC analysts and security engineers who want to specify a log collection strategy, this repository is helpful.

# Files
You can find in the root folder :
- Categories folder which contains each Advanced Audit policy settings categories and Event IDs
- AdvancedSecurityEventIDs.json (Categories combined in one Json file)
- AdvancedSecurityEventIDs.csv (Json to Csv)

# Scripts
You can divide or combine Json files using the scripts in the scripts folder.
        
# Tags
Below the descriptions of each tag and the source of the recommendation :
- JSCU-NL = ALl event from https://github.com/JSCU-NL/logging-essentials/blob/main/WindowsEventLogging.adoc based on multiple sources (https://github.com/JSCU-NL/logging-essentials#sources--additional-links)
- SRV-ETM = [Events to Monitor recommandation by Microsoft] (https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor)
- YAMATO = Each event with rules or Not Yet from [Yamato repositories] (https://github.com/Yamato-Security/EnableWindowsLogSettings/blob/main/ConfiguringSecurityLogAuditPolicies.md)
- MDE = All events from Olaf Hartung [defender analysis post](https://medium.com/falconforce/microsoft-defender-for-endpoint-internals-0x02-audit-settings-and-telemetry-1d0af3ebfb27)
- ANSSI = From [ANSSI-FR selection](https://github.com/ANSSI-FR/guide-journalisation-microsoft/blob/main/Standard_WEC_query.xml)

# Sources to build this project
- https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/security-best-practices/audit-policy-recommendations
- https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/advanced-security-audit-policy-settings
- https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor
- https://github.com/JSCU-NL/logging-essentials


## 🍰 Contributing    
Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

## License
This project is open source and available under the [MIT License](LICENSE).
