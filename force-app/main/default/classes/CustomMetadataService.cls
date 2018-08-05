public with sharing class CustomMetadataService {
    //Return a record that shows whether the RecordTypeMapping feature is enabled
    public FeatureSettingsCMT__mdt getMapperEnablementRecord() {
        FeatureSettingsCMT__mdt enabledRecord = [SELECT Id, FeatureEnabled__c FROM FeatureSettingsCMT__mdt WHERE DeveloperName = 'EnableItPlease' LIMIT 1];
        return enabledRecord;
    }

    //Update the org-level custom setting
    //Returns the original value
    public Boolean updateMapperEnablementRecord(Boolean newValue) {
        //FeatureSettings__c enablementRecord = [Select Id, FeatureEnabled__c from FeatureSettings__c LIMIT 1];
        //Boolean originalValue = enablementRecord.FeatureEnabled__c;
        
        //enablementRecord.FeatureEnabled__c = newValue;
        //update enablementRecord;

        //return originalValue;
        return true;
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
