public with sharing class CustomMetadataService {
    //Return a record that shows whether the RecordTypeMapping feature is enabled
    public FeatureSettingsCMT__mdt getMapperEnablementRecord() {
        FeatureSettingsCMT__mdt enabledRecord = [SELECT Id, FeatureEnabled__c FROM FeatureSettingsCMT__mdt WHERE DeveloperName = 'EnableItPlease' LIMIT 1];
        return enabledRecord;
    }

    //Update the org-level custom setting
    //Returns the original value
    public Boolean updateMapperEnablementRecord(Boolean newValue) {
        Boolean originalValue = getMapperEnablementRecord().FeatureEnabled__c;

        Metadata.DeployContainer container = new Metadata.DeployContainer();
        List<Metadata.Metadata> records = Metadata.Operations.retrieve(Metadata.MetadataType.CustomMetadata, 
                                          new List<String>{'FeatureSettingsCMT.EnableItPlease'});
        if (records.size() > 0) {
            Metadata.CustomMetadata recordToUpdate = (Metadata.CustomMetadata) records.get(0);
            //update the FeatureEnabled__c field
            for (Metadata.CustomMetadataValue fieldAndValue : recordToUpdate.values) {
                if (fieldAndValue.field == 'FeatureEnabled__c') {
                    fieldAndValue.value = newValue;
                }
            }            
            container.addMetadata(recordToUpdate);
            Id asyncResultId = Metadata.Operations.enqueueDeployment(container, null); //could add callback in 2nd param
            System.debug('Updating feature enabled, async id is: ' + asyncResultId);
        }
        return originalValue;        
    }

    //Return a record that shows which record type name to use for the given countryCode
    //and industry values on a new lead.
    public RecordTypeMappingCMT__mdt getRecordTypeMapping(String countryCode, String industry) {
        RecordTypeMappingCMT__mdt mapping = null;

        List<RecordTypeMappingCMT__mdt> mappings =  [SELECT Id, RecordTypeName__c FROM RecordTypeMappingCMT__mdt 
                WHERE CountryCode__c = :countryCode AND Industry__c = :industry];
        if (mappings.size() > 0) {
            mapping = mappings.get(0);
        }
        return mapping;
    }
}
