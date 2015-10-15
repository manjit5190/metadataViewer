@RestResource(urlMapping='/ms/viewData/*')

global class MetadataViewerHelperService {
        
    @HttpPost
    
    global static void returnData(){
        
    }
    
    @RemoteAction
    global static String returnDataRemote(String payload){
        Map<String,Object> config = (Map<String,Object>) JSON.deserializeUntyped(payload);
        HTTP httpProto = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod((String)config.get('method'));
        req.setEndpoint((String)config.get('url'));
        req.setHeader('Authorization', 'Bearer ' + (String)config.get('sessionId'));
        HttpResponse resp =  httpproto.send(req);
        String body = EncodingUtil.base64Encode(Blob.valueOf(resp.getBody()));
        return body;
    }
    
}
