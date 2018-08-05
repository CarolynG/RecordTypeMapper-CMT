@isTest(seeAllData=true) //seeAllData needed to see custom setting data
private class Test_FeatureService {
    
    @isTest static void testFeatureEnabledByDefault() {
        FeatureService fs = new FeatureService();
        System.assert(fs.isFeatureEnabled(), 'Feature should have been enabled by default');
    }

    @isTest static void testFeatureCanBeTurnedOff() {
        //mock the custom metadata service
        CustomMetadataService mockCM = (CustomMetadataService) Test.createStub(CustomMetadataService.class, 
                new MockCustomMetadataService(true));
        
        //instantiate a new feature service that uses the mocked custom metadata service        
        FeatureService fs = new FeatureService(mockCm);
        Boolean originalValue = fs.setEnabled(false);

        System.assertEquals(true, originalValue, 'Feature should have been enabled by default');
        //requires Winter '19
        //System.assert(!fs.isFeatureEnabled(), 'Feature was not disabled successfully');
    }
}