@RestResource(urlMapping='/testApi/*')
global with sharing class TestFirstApi {
    
    @HttpGet
    global static String method1(){
        RestRequest req = RestContext.request;
        //RestResponse res = RestContext.response;
        try{
            String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        	Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        	return JSON.serialize(result);
        }
        catch(Exception ex){
            return JSON.serialize(ex);
        }
        
        
    }
    
    
    
    
}