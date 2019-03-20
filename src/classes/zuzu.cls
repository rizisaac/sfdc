@RestResource (urlmapping='/zuzu/*')
global class zuzu{
    
    @HttpGet
    global static void collectAccount(){
        RestResponse res=RestContext.response;
        try{
            List<Account> AccountList=[select Id, Name from Account];
            res.responseBody=Blob.valueOf(JSON.serialize(AccountList));
        }catch(Exception ex){
            System.debug(ex);
            System.debug(ex.getMessage());
            System.debug(ex.getLineNumber());
            res.responseBody=Blob.valueOf(ex.getMessage());
        }
    }
    
    @HttpPost
    global static void collectAccountById(){
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        try{
            String accId=req.Params.get('id');
            Account Acc=[select Id, Name from Account where id =:accId ];
            res.responseBody=Blob.valueOf(JSON.serialize(Acc));
        }catch(Exception ex){
            System.debug(ex);
            System.debug(ex.getMessage());
            System.debug(ex.getLineNumber());
            res.responseBody=Blob.valueOf(ex.getMessage());
        }
    }
    
}