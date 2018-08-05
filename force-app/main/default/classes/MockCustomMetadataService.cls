@isTest
global with sharing class MockCustomMetadataService implements StubProvider {
    Boolean featureIsEnabled;

    //featureIsEnabled - the initial value for whether the feature is enabled or not
    public MockCustomMetadataService(Boolean featureIsEnabled) {
        this.featureIsEnabled = featureIsEnabled;
    }

    global Object handleMethodCall(Object stubbedObject, String stubbedMethodName, System.Type returnType,
                           List<System.Type> listOfParamTypes, List<String> listOfParamNames, List<Object> listOfArgs){

        //Methods in 
        if (stubbedMethodName == 'getMapperEnablementRecord') {
            //Coming in Winter '19!
            //return new FeatureSettingsCMT__mdt(
            //        DeveloperName='EnableItPlease', 
            //        FeatureEnabled__c = this.featureIsEnabled);
            return null;

        } else if (stubbedMethodName == 'updateMapperEnablementRecord') {
            Boolean originalValue = this.featureIsEnabled;
            this.featureIsEnabled = (Boolean) listOfArgs.get(0);
            return originalValue;
        
        } else {
            System.debug('You tried to call a method that we havent implemented');
            return null;
        }
    }
}