trigger TriggerGenericMapping on Lead (before insert) {

    //get all the generic mappings that apply
    List<GenericFieldMapping__mdt> mappings = 
            [SELECT Id, Field1__c, Value1__c, Field2__c, Value2__c, TargetField__c, TargetValue__c 
             FROM GenericFieldMapping__mdt];
    
    for (Lead l : Trigger.new) {
        //arbitrarily use the first matching mapping we find.
        for (GenericFieldMapping__mdt mapping : mappings) {
            //if this lead's Field1 and Field2 values match the values in the mapping
            if (l.get(convertFieldName(mapping.Field1__c)) == mapping.Value1__c 
                    && l.get(convertFieldName(mapping.Field2__c)) == mapping.Value2__c) {
                //then set the TargetField on the lead to the TargetValue from the mapping
                l.put(convertFieldName(mapping.TargetField__c), mapping.targetValue__c);
            }
        }
    }

    //Standard fields will look like "Lead.FieldName", so strip off the leading "Lead"
    private String convertFieldName(String relationshipFieldValue) {
        return relationshipFieldValue.contains('.') ? relationshipFieldValue.substringAfter('.') : relationshipFieldValue;
    }
}