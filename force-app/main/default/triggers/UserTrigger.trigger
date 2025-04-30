trigger UserTrigger on User (after insert) {
    
    if(trigger.isInsert){
        if(trigger.isAfter){
            
            Set<Id> userIds = new Set<Id>();
            String UserId;
            
            Profile prof=[Select Id,Name from Profile where name='AutoFolio Community User' Limit 1];
            
            for (User u : Trigger.new) {
                
                if(u.ProfileId==prof.Id && u.ContactId!=null){
                    userIds.add(u.Id);
                }
                
            }
            if(userIds.size()>0){
                ClsAutomotiveSelfRegisterDataProvider.init(userIds);
            }
            
            
            
        }
    }
    
    
    
}