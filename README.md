# RecordTypeMapper CMT Transition Demo
## Custom Metadata Types - The "After"
The RecordTypeMapper application uses field values on new Lead records to determine which record type the new Lead should have.

This version of the app uses custom metadata types to control which record type to use, based on values from the Lead's Country and Industry fields. 

## Get the code
This repo is structured as a Salesforce DX project and is ready to be pushed to scratch organizations using the Salesforce DX Command Line Interface tool. For more information on developing with DX: https://developer.salesforce.com/platform/dx

1. Clone this repo and navigate to it in the terminal or VS Code.
2. Make sure you have authenticated with a Salesforce developer hub org. (To sign up a trial: https://developer.salesforce.com/promotions/orgs/dx-signup)
3. Create a new scratch organization using the project-scratch-def.json definition in this project.

`sfdx force:org:create -f config/project-scratch-def.json -a myCmtOrg`
 
4. Open the scratch org.

`sfdx force:org:open -u myCmtOrg`

5. Navigate to Leads. Try creating Leads where the Country and Industry values match mappings in the `RecordTypeMappingCMT__mdt` custom metadata type, and notice that the record type is set automatically by the `TriggerRecordTypeMapping` trigger after save.
