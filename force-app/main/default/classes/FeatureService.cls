public with sharing class FeatureService {

    CustomMetadataService cmts;

    public FeatureService() {
        this.cmts = new CustomMetadataService();
    }

    public boolean isFeatureEnabled() {
        return this.cmts.getMapperEnablementRecord().FeatureEnabled__c;
    }

    public boolean setEnabled(Boolean newValue) {
        return this.cmts.updateMapperEnablementRecord(newValue);
    }
}
