public with sharing class MappingService {
    
    CustomMetadataService cmts;

    public MappingService() {
        this.cmts = new CustomMetadataService();
    }

    public String getRecordTypeName(String countryCode, String industry) {
        RecordTypeMappingCMT__mdt mapping = this.cmts.getRecordTypeMapping(countryCode, industry);
        if (mapping != null) {
            return mapping.RecordTypeName__c;
        } else {
            return 'Default Lead';
        }
    }
}
