public with sharing class RealTimeActivityProcessor {
    
    @InvocableMethod(label='Get Real Time Selected Product Id')
    public static List<Response> getProductId(List<Request> requests) {
        try {            
            Request input = requests[0];
            String contactId = input.contactId;
            String graph = 'Hospitality_Realtime_Profile';// RealtimeProfile
            String space = 'default';
            String lookup = 'UnifiedLinkssotIndividualReal__dlm';
            Long uniqueParam = System.currentTimeMillis();
            String lookupValueField = '';
            // Process the To Get the Transformed Data
            List<Map<String, Object>> transformedData = getTransformedData(contactId, graph, space, lookup, uniqueParam, lookupValueField);
            if (transformedData.isEmpty()) {
                throw new AuraHandledException('No Valid Transform data found');
            }

            //return processResponse(response);
            //return (String) transformedData[0].get('ProductId');
            List<Response> responses = new List<Response>();
            Response res = new Response();
            String productId = (String) transformedData[0].get('ProductId');
            res.prompt = productId;//JSON.serialize((String) transformedData[0].get('ProductId'));       
            responses.add(res);
            System.debug('## responses = '+responses);
            return responses;
        } catch (Exception e) {
            throw new AuraHandledException('Error processing real-time activity: ' + e.getMessage());
        }
    }
    
    @TestVisible
    private static List<Map<String, Object>> getTransformedData(String recordId, String graph, String space, String lookup, Long uniqueParam, String lookupValueField) {
        try {            
            // Fetch data from the Apex service
            String response = RTService.fetch(recordId, graph, space, lookup, uniqueParam, lookupValueField);
            System.debug('## response = '+response);
            if (String.isEmpty(response)) {
                throw new AuraHandledException('No data was returned from the API.');
            }

            // Process the JSON response
            return processResponse(response);
        } catch (Exception e) {
            throw new AuraHandledException('Error processing real-time activity: ' + e.getMessage());
        }
    }

    @TestVisible
    private static List<Map<String, Object>> processResponse(String response) {
        // Deserialize the response
        Map<String, Object> parsedJson = (Map<String, Object>) JSON.deserializeUntyped(response);
        System.debug('## parsedJson = '+parsedJson);
        if (!parsedJson.containsKey('data')) {
            throw new AuraHandledException('Key "data" not found in the API response.');
        }

        // Extract data array
        List<Object> dataList = (List<Object>) parsedJson.get('data');
        String largestJsonBlob = findLargestJsonBlob(dataList);
        if (String.isEmpty(largestJsonBlob)) {
            throw new AuraHandledException('No valid JSON blob found in the response.');
        }

        // Parse the largest JSON blob
        Map<String, Object> jsonBlobObject = (Map<String, Object>) JSON.deserializeUntyped(largestJsonBlob);
        // Extract specific DMO-related data        
         return extractAndTransformData(jsonBlobObject);
    }

    private static String findLargestJsonBlob(List<Object> dataList) {
        String largestJsonBlob = '';
        Integer maxLength = 0;

        for (Object dataItem : dataList) {
            Map<String, Object> dataMap = (Map<String, Object>) dataItem;
            String jsonBlob = (String) dataMap.get('json_blob__c');

            if (jsonBlob != null && jsonBlob.length() > maxLength) {
                largestJsonBlob = jsonBlob.replace('&quot;', '"').replace('&amp;', '&');
                system.debug('largestJsonBlobInside'+ largestJsonBlob);
                maxLength = jsonBlob.length();
            }
        }
        System.debug('## largestJsonBlob = '+largestJsonBlob);
        return largestJsonBlob;
    }
    @TestVisible
    private static List<Map<String, Object>> extractAndTransformData(Map<String, Object> jsonBlobObject) {
        List<Map<String, Object>> transformedData = new List<Map<String, Object>>();
        // Define lookup keys
        String lookupIndividualLinkKey = 'UnifiedLinkssotIndividualReal__dlm';
        String productKey = 'ssot__ProductBrowseEngagement__dlm';
        String lookupIndividualKey = 'ssot__Individual__dlm';
        String productIdField = 'ssot__ProductId__c';
        // Traverse the JSON blob for Individual Identity Links
        if (jsonBlobObject.containsKey(lookupIndividualLinkKey)) {
            List<Object> identityLinks = (List<Object>) jsonBlobObject.get(lookupIndividualLinkKey);
            for (Object identityLink : identityLinks) {
                Map<String, Object> identityLinkMap = (Map<String, Object>) identityLink;  
                if (identityLinkMap.containsKey(lookupIndividualKey)) {
                    List<Object> individuals = (List<Object>) identityLinkMap.get(lookupIndividualKey);
                    for (Object individual : individuals) {
                        Map<String, Object> individualMap = (Map<String, Object>) individual;
                        // Check for Product Browse Engagements
                        if (individualMap.containsKey(productKey)) {
                            List<Object> productEngagements = (List<Object>) individualMap.get(productKey);
                            for (Object engagement : productEngagements) {
                                Map<String, Object> engagementMap = (Map<String, Object>) engagement;
                                // Extract Product ID and Timestamp
                                if (engagementMap.containsKey(productIdField)) {
                                    Map<String, Object> transformedItem = new Map<String, Object>();
                                    transformedItem.put('ProductId', engagementMap.get(productIdField));
                                    transformedItem.put('Timestamp', engagementMap.get('ssot__EngagementDateTm__c'));
                                    transformedData.add(transformedItem);                                    
                                }
                            }
                        }
                    }                    
                }
            }
        }
        System.debug('## transformedData Before = '+transformedData);
        // Sort transformed data by Timestamp
        transformedData = sortTransformedData(transformedData, 'Timestamp');
        // Return the top 100 entries
        return getTopEntries(transformedData, 100);
    }

    // Sort the transformed data by a given key
    @TestVisible
    private static List<Map<String, Object>> sortTransformedData(List<Map<String, Object>> data, String sortKey) {
        // Using bubble sort for simplicity in Apex
        for (Integer i = 0; i < data.size(); i++) {
            for (Integer j = 0; j < data.size() - i - 1; j++) {
                Map<String, Object> current = data[j];
                Map<String, Object> next = data[j + 1];
                // Extract timestamps
                String currentTimestamp = (String) current.get(sortKey);
                String nextTimestamp = (String) next.get(sortKey);

                if (currentTimestamp == null || nextTimestamp == null) {
                    continue;
                }
                
                DateTime currentDateTime = validateTimestamp(currentTimestamp);//DateTime.valueOf(currentTimestamp);
                DateTime nextDateTime = validateTimestamp(nextTimestamp);//DateTime.valueOf(nextTimestamp);

                // Compare and swap if necessary
                if (currentDateTime < nextDateTime) {
                    data[j] = next;
                    data[j + 1] = current;
                }
            }
        }
        System.debug('## data = '+data);
        return data;
    }

    // Return the top N entries from a list
    @TestVisible
    private static List<Map<String, Object>> getTopEntries(List<Map<String, Object>> data, Integer limits) {
        List<Map<String, Object>> topEntries = new List<Map<String, Object>>();
        for (Integer i = 0; i < Math.min(data.size(), limits); i++) {
            topEntries.add(data[i]);
        }
        System.debug('## topEntries = '+topEntries);
        return topEntries;
    }
    
    @TestVisible
    private  static DateTime validateTimestamp(String timestamp) {
        
        Datetime convertedTimestamp = (DateTime)JSON.deserialize('"' + timestamp.substringbefore('+') + '"', DateTime.class);        
        return convertedTimestamp;
    }
    
    public class Request {
        @InvocableVariable
        public String contactId;         
    }

    public class Response {
        @InvocableVariable
        public String Prompt;
    }
}
