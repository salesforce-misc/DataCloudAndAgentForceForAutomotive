global with sharing class DSPGetRTDGData {
    //Apex to get Data Graph information retrieval

    private static final String API_VERSION = 'v61.0';
    
    global class DataGraphRequest {
        @InvocableVariable(required=true label='Record ID')
        public String recordId;
        
        @InvocableVariable(required=true label='Graph Name')
        public String graphName;
    }
    
    global class DataGraphResponse {
        @InvocableVariable
        public String responseData;
        
        @InvocableVariable
        public Boolean isSuccess;
        
        @InvocableVariable
        public String errorMessage;
        
        public DataGraphResponse() {
            this.isSuccess = false;
            this.errorMessage = '';
            this.responseData = '';
        }
    }
    
    public class ProductEngagementComparator implements Comparator<Map<String, Object>> {
        public Integer compare(Map<String, Object> eng1, Map<String, Object> eng2) {
            try {
                System.debug('## eng1 = '+eng1);
                System.debug('## eng2 = '+eng2);
                
                
                
                DateTime date1 = DateTime.valueOf(String.valueOf(eng1.get('ssot__EngagementDateTm__c')));
                DateTime date2 = DateTime.valueOf(String.valueOf(eng2.get('ssot__EngagementDateTm__c')));
                
                if (date1 > date2) return -1;
                if (date1 < date2) return 1;
                return 0;
            } catch(Exception e) {
                return 0;
            }
        }
    }
    
    @InvocableMethod(label='Get Data Graph Data' 
                     description='Retrieves data from Data Cloud Data Graph')
    global static List<DataGraphResponse> getDataGraphData(List<DataGraphRequest> requests) {
        List<DataGraphResponse> responses = new List<DataGraphResponse>();

        for(DataGraphRequest request : requests) {
            DataGraphResponse response = new DataGraphResponse();
            try {
                if (String.isBlank(request.graphName)) {
                    throw new AuraHandledException('Graph name is required');
                }
                
                String endpoint = String.format(
                    'callout:DataCloudNew/services/data/{0}/ssot/data-graphs/data/{1}',
                    new String[]{ API_VERSION, request.graphName }
                );
    			
                String lookupKeys = 'UnifiedLinkssotIndividualReal__dlm.SourceRecordId__c=' + request.recordId;
                System.debug('## Final Endpoint = '+endpoint + '?lookupKeys=' + EncodingUtil.urlEncode(lookupKeys, 'UTF-8'));
                HttpRequest req = new HttpRequest();
                req.setEndpoint(endpoint + '?lookupKeys=' + EncodingUtil.urlEncode(lookupKeys, 'UTF-8'));
                req.setMethod('GET');
                req.setHeader('Content-Type', 'application/json');
                
                Http http = new Http();
                HttpResponse res = http.send(req);
                System.debug('## res = '+res);
                if (res.getStatusCode() == 200) {
                    String rawBody = res.getBody();
                    System.debug('## rawBody = '+rawBody);
                    Map<String, Object> fullResponse = (Map<String, Object>)JSON.deserializeUntyped(rawBody);
                    System.debug('## fullResponse = '+fullResponse);
                    List<Map<String, Object>> allEngagements = new List<Map<String, Object>>();
                    
                    if(fullResponse.containsKey('data')) {
                        List<Object> dataList = (List<Object>)fullResponse.get('data');
                        System.debug('## dataList = '+dataList);
                        for(Object dataItem : dataList) {
                            System.debug('## dataItem = '+dataItem);
                            Map<String, Object> dataMap = (Map<String, Object>)dataItem;
                            System.debug('## dataMap = '+dataMap);
                            if(dataMap.containsKey('json_blob__c')) {
                                String jsonBlob = String.valueOf(dataMap.get('json_blob__c'));
                                System.debug('## jsonBlob = '+jsonBlob);
                                jsonBlob = preprocessJsonBlob(jsonBlob);
                                
                                try {
                                    Map<String, Object> blobData = (Map<String, Object>)JSON.deserializeUntyped(jsonBlob);
                                    System.debug('## blobData = '+blobData);
                                    extractEngagements(blobData, allEngagements);
                                } catch(Exception e) {
                                    System.debug('Error processing blob: ' + e.getMessage());
                                }
                            }
                        }
                    }
                    
                    if (!allEngagements.isEmpty()) {
                        allEngagements.sort(new ProductEngagementComparator());
                    }                    
                    System.debug('## allEngagements = '+allEngagements);
                    System.debug('## allEngagements.size() = '+allEngagements.size());
                    //Added new Logic
                    Map<String, Map<String, Object>> latestPerProduct = new Map<String, Map<String, Object>>();
                    for (Map<String, Object> engagement : allEngagements) {
                        String firstProductId = (String) allEngagements[0].get('ssot__ProductId__c');
                        String productId = (String) engagement.get('ssot__ProductId__c');
                        if (String.isNotBlank(productId) && !latestPerProduct.containsKey(productId) && productId == firstProductId) {
                            latestPerProduct.put(productId, engagement);
                            break;
                        }
                    }    
                    List<Map<String, Object>> latestEngagements = new List<Map<String, Object>>(latestPerProduct.values());
                    
                    System.debug('## latestEngagements = '+latestEngagements);
                    response.responseData = JSON.serialize(new Map<String, Object>{
                        'productEngagements' => latestEngagements,
                        'totalEngagements' => latestEngagements.size()
                    });
                    response.isSuccess = true;
                    
                } else {
                    response.isSuccess = false;
                    response.errorMessage = handleErrorResponse(res);
                }
                
            } catch (Exception e) {
                System.debug('Error: ' + e.getMessage());
                response.isSuccess = true;
                response.errorMessage = e.getMessage();
                response.responseData = createEmptyResponse();
            }
            responses.add(response);
        }
        return responses;
    }
    
    private static String preprocessJsonBlob(String jsonBlob) {
        System.debug('## preprocessJsonBlob jsonBlob = '+jsonBlob);
        // Primero decodificamos las entidades HTML básicas
        jsonBlob = jsonBlob.replace('&quot;', '"')
                          .replace('&amp;', '&')
                          .replace('&lt;', '<')
                          .replace('&gt;', '>')
                          .replace('&apos;', '\'')
                          .replace('&#39;', '\'')
                          .replace('&#92;', '\\');
                          System.debug('## preprocessJsonBlob jsonBlob 1= '+jsonBlob);
        // Buscar todos los campos Product_Image__c
        Pattern imgPattern = Pattern.compile('"Product_Image__c":"([^"]*)"');
        Matcher imgMatcher = imgPattern.matcher(jsonBlob);
        String processedJson = '';
        Integer lastEnd = 0;

        while(imgMatcher.find()) {
            // Añadir todo hasta el inicio del match
            processedJson += jsonBlob.substring(lastEnd, imgMatcher.start());
            
            // Obtener el valor completo del campo
            String imgValue = imgMatcher.group(1);
            
            // Escapar las comillas con una sola barra invertida
            String escapedImgValue = imgValue.replace('="', '=\"')    // Escapar comillas en atributos HTML
                                          .replace('" ', '\" ')    // Escapar comillas seguidas de espacio
                                          .replace('">', '\">');   // Escapar comillas antes de cierre de tag
            
            // Reconstruir el campo con el valor escapado
            processedJson += '"Product_Image__c":"' + escapedImgValue + '"';
            
            lastEnd = imgMatcher.end();
        }
        
        // Añadir el resto del JSON
        if(lastEnd < jsonBlob.length()) {
            processedJson += jsonBlob.substring(lastEnd);
        }
        System.debug('## processedJson = '+processedJson);
        return processedJson;
    }
    
    private static void extractEngagements(Map<String, Object> data, List<Map<String, Object>> allEngagements) {
        System.debug('## data = '+data);
        System.debug('## allEngagements = '+allEngagements);
        if(data.containsKey('UnifiedLinkssotIndividualReal__dlm')) {
            List<Object> links = (List<Object>)data.get('UnifiedLinkssotIndividualReal__dlm');
            System.debug('## links = '+links);
            for(Object link : links) {
                Map<String, Object> linkMap = (Map<String, Object>)link;
                
                if(linkMap.containsKey('ssot__Individual__dlm')) {
                    List<Object> individuals = (List<Object>)linkMap.get('ssot__Individual__dlm');
                    System.debug('## individuals = '+individuals);
                    processIndividuals(individuals, allEngagements);
                }
            }
        }
    }
    
    private static void processIndividuals(List<Object> individuals, List<Map<String, Object>> allEngagements) {
        for(Object individual : individuals) {
            Map<String, Object> indMap = (Map<String, Object>)individual;
            
            // Direct engagements
            if(indMap.containsKey('ssot__ProductBrowseEngagement__dlm')) {
                List<Object> engagements = (List<Object>)indMap.get('ssot__ProductBrowseEngagement__dlm');
                processEngagements(engagements, allEngagements);
            }
            
            // Check in WebsiteEngagement
            if(indMap.containsKey('ssot__WebsiteEngagement__dlm')) {
                List<Object> webEngagements = (List<Object>)indMap.get('ssot__WebsiteEngagement__dlm');
                for(Object webEng : webEngagements) {
                    Map<String, Object> webEngMap = (Map<String, Object>)webEng;
                    if(webEngMap.containsKey('ssot__ProductBrowseEngagement__dlm')) {
                        List<Object> engagements = (List<Object>)webEngMap.get('ssot__ProductBrowseEngagement__dlm');
                        system.debug('engagementsTEST'+ engagements);
                        processEngagements(engagements, allEngagements);
                    }
                }
            }
        }
    }
    
    private static void processEngagements(List<Object> engagements, List<Map<String, Object>> allEngagements) {
        system.debug('## engagements = '+engagements);
        system.debug('## allEngagements = '+allEngagements);
        for(Object eng : engagements) {
            Map<String, Object> engagement = (Map<String, Object>)eng;
            if (engagement.containsKey('ssot__ProductId__c')) {                
                allEngagements.add(engagement);
            }
            /*if(engagement.containsKey('ssot__GoodsProduct__dlm')) {
                List<Object> products = (List<Object>)engagement.get('ssot__GoodsProduct__dlm');
                
                if(!products.isEmpty()) {
                    engagement.put('productInfo', products[0]);
                }
            }
            system.debug('products[0]'+engagement);
            allEngagements.add(engagement);*/

        }
        system.debug('## allEngagements = '+allEngagements);
    }
    
    private static String createEmptyResponse() {
        return JSON.serialize(new Map<String, Object>{
            'productEngagements' => new List<Object>(),
            'totalEngagements' => 0
        });
    }
    
    private static DateTime tryParseDateTime(Object dt) {
        try {
            return DateTime.valueOf(String.valueOf(dt));
        } catch (Exception e) {
            return null;
        }
	}

    
    private static String handleErrorResponse(HttpResponse res) {
        switch on res.getStatusCode() {
            when 401 {
                return 'Authentication failed. Check Named Credential configuration.';
            }
            when 403 {
                return 'Access forbidden. Check Data Cloud permissions.';
            }
            when 404 {
                return 'Data Graph not found.';
            }
            when else {
                return 'Error calling Data Cloud API. Status: ' + 
                    res.getStatusCode() + '. Message: ' + res.getBody();
            }
        }
    }      
}
