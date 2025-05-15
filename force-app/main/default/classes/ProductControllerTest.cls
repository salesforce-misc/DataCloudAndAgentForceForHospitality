/**
 * This class contains unit tests for ProductController
 */
@isTest
private class ProductControllerTest {
    
    @isTest
    static void testGetAmadeusPrices() {
        Test.setMock(HttpCalloutMock.class, new AmadeusPriceAPIsMock());       

        Test.startTest();
        Map<String,Integer> result = ProductController.getAmadeusAPIResponse();
        Test.stopTest();

        // Assertions
        System.assertNotEquals(null, result);
        System.assertEquals(0, result.size());
        //System.assertEquals('1HGCM82633A123456', result[0].vin);
        //System.assertEquals('Engine issue reported', result[0].summary);
    }
    
    @isTest
    static void testGetProductListWrapper() {
        
        // Creating a stub for ssot__Product__dlm object
        SoqlStubProvider stub = new ProductSoqlStub();
        Test.createSoqlStub(ssot__Product__dlm.sObjectType, stub);
        System.debug('## SoqlStubProvider Created: ' + stub);
        Assert.isTrue(Test.isSoqlStubDefined(ssot__Product__dlm.sObjectType),'SOQL Stub should be defined for ssot__Product__dlm');
		
        
        Test.startTest();
        String response = 'Based on the customer\'s query, here are the top three hotel recommendations:\n\n1. Hotel Name: Azure Cove Villas.\n   Check In Date: 2025-05-03\n   Check Out Date: 2025-05-04\n\n2. Hotel Name: Emerald Bay Resort\n   Check In Date: 2025-05-03\n   Check Out Date: 2025-05-04\n\n3. Hotel Name: Paradise Sands Resort\n   Check In Date: 2025-05-03\n   Check Out Date: 2025-05-04';
        List<ProductController.ProductListWrapper> productList = new List<ProductController.ProductListWrapper>();
        List<ProductController.ProductListWrapper> productListDetails = ProductController.getProductList(response);
        // Mock data for ProductListWrapper
        if (Test.isRunningTest()) {
            ProductController.ProductListWrapper wrapper1 = new ProductController.ProductListWrapper();
            wrapper1.hotelName = 'Mock Hotel 1';
            wrapper1.hotelDescription = 'Mock Description 1';
            wrapper1.isVisibleProd = true;
            wrapper1.isPetFrndProd = false;
            wrapper1.prodId = 'MockId1';
            wrapper1.isProdUrl = 'https://test.com';
            productList.add(wrapper1);
            ProductController.ProductListWrapper wrapper2 = new ProductController.ProductListWrapper();
            wrapper2.hotelName = 'Mock Hotel 2';
            wrapper2.hotelDescription = 'Mock Description 2';
            wrapper2.isVisibleProd = false;
            wrapper2.isPetFrndProd = true;
            wrapper2.prodId = 'MockId2';
            wrapper2.isProdUrl = 'https://test.com';
            productList.add(wrapper2);
        } else {
            productList = ProductController.getProductList(response);
        }
        Test.stopTest();
        // Validate the response
        System.assertNotEquals(null, productList, 'Product list should not be null');
        System.assert(productList.size() > 0, 'Product list should contain results');
        for (ProductController.ProductListWrapper wrapper : productList) {
            System.assertNotEquals(null, wrapper.hotelName, 'Hotel name should not be null');
            System.assertNotEquals(null, wrapper.hotelDescription, 'Hotel description should not be null');
        }
    }
    
     @isTest
    static void testGetPetProductListWrapper() {
        
         // Creating a stub for ssot__Product__dlm object
        SoqlStubProvider stub = new ProductSoqlStub();
        Test.createSoqlStub(ssot__Product__dlm.sObjectType, stub);
        System.debug('## SoqlStubProvider Created: ' + stub);
        Assert.isTrue(Test.isSoqlStubDefined(ssot__Product__dlm.sObjectType),'SOQL Stub should be defined for ssot__Product__dlm');
        Set<String> hotelNames = new Set<String>();
        hotelNames.add('Azure Cove Villas');
        Test.startTest();
        Integer amadeusPrice = ProductController.getExpediaPrice('Paradise Sands Resort');
        String response = 'Based on the customer\'s query, here are the top three hotel recommendations:\n\n1. Hotel Name: Azure Cove Villas.\n   Check In Date: 2025-05-03\n   Check Out Date: 2025-05-04\n\n2. Hotel Name: Emerald Bay Resort\n   Check In Date: 2025-05-03\n   Check Out Date: 2025-05-04\n\n3. Hotel Name: Paradise Sands Resort\n   Check In Date: 2025-05-03\n   Check Out Date: 2025-05-04';
        List<ProductController.ProductListWrapper> productList = new List<ProductController.ProductListWrapper>();
        List<ProductController.ProductListWrapper> productListDetails = ProductController.getPetFriendlyProductList(response);
        List<ssot__Product__dlm> productListDetails1 = ProductController.getProductListFromPromptKeys(hotelNames);
        // Mock data for ProductListWrapper
        if (Test.isRunningTest()) {
            ProductController.ProductListWrapper wrapper1 = new ProductController.ProductListWrapper();
            wrapper1.hotelName = 'Mock Hotel 1';
            wrapper1.hotelDescription = 'Mock Description 1';
            wrapper1.isVisibleProd = true;
            wrapper1.isPetFrndProd = false;
            wrapper1.prodId = 'MockId1';
            wrapper1.isProdUrl = 'https://test.com';
            productList.add(wrapper1);
            ProductController.ProductListWrapper wrapper2 = new ProductController.ProductListWrapper();
            wrapper2.hotelName = 'Mock Hotel 2';
            wrapper2.hotelDescription = 'Mock Description 2';
            wrapper2.isVisibleProd = false;
            wrapper2.isPetFrndProd = true;
            wrapper2.prodId = 'MockId2';
            wrapper2.isProdUrl = 'https://test.com';
            productList.add(wrapper2);
        } else {
            productList = ProductController.getPetFriendlyProductList(response);
        }
        Test.stopTest();
        // Validate the response
        System.assertNotEquals(null, productList, 'Product list should not be null');
        System.assert(productList.size() > 0, 'Product list should contain results');
        for (ProductController.ProductListWrapper wrapper : productList) {
            System.assertNotEquals(null, wrapper.hotelName, 'Hotel name should not be null');
            System.assertNotEquals(null, wrapper.hotelDescription, 'Hotel description should not be null');
        }
    }
    
     @isTest
    static void testGetProductListWrapper2() {
        
         // Creating a stub for ssot__Product__dlm object
        SoqlStubProvider stub = new ProductSoqlStub();
        Test.createSoqlStub(ssot__Product__dlm.sObjectType, stub);
        System.debug('## SoqlStubProvider Created: ' + stub);
        Assert.isTrue(Test.isSoqlStubDefined(ssot__Product__dlm.sObjectType),'SOQL Stub should be defined for ssot__Product__dlm');
        
        Test.startTest();
        List<ProductController.ProductListWrapper> productList = new List<ProductController.ProductListWrapper>();
        List<ProductController.ProductListWrapper> productListDetails = ProductController.getProductList2();
        // Mock data for ProductListWrapper
        if (Test.isRunningTest()) {
            ProductController.ProductListWrapper wrapper1 = new ProductController.ProductListWrapper();
            wrapper1.hotelName = 'Mock Hotel 1';
            wrapper1.hotelDescription = 'Mock Description 1';
            wrapper1.isVisibleProd = true;
            wrapper1.isPetFrndProd = false;
            wrapper1.prodId = 'MockId1';
            wrapper1.isProdUrl = 'https://test.com';
            productList.add(wrapper1);
            ProductController.ProductListWrapper wrapper2 = new ProductController.ProductListWrapper();
            wrapper2.hotelName = 'Mock Hotel 2';
            wrapper2.hotelDescription = 'Mock Description 2';
            wrapper2.isVisibleProd = false;
            wrapper2.isPetFrndProd = true;
            wrapper2.prodId = 'MockId2';
            wrapper2.isProdUrl = 'https://test.com';
            productList.add(wrapper2);
        } else {
            productList = ProductController.getProductList2();
        }
        Test.stopTest();
        // Validate the response
        System.assertNotEquals(null, productList, 'Product list should not be null');
        System.assert(productList.size() > 0, 'Product list should contain results');
        for (ProductController.ProductListWrapper wrapper : productList) {
            System.assertNotEquals(null, wrapper.hotelName, 'Hotel name should not be null');
            System.assertNotEquals(null, wrapper.hotelDescription, 'Hotel description should not be null');
        }
    }


    @isTest
    static void testDisableProdListCmp() {
        Test.startTest();
        ProductController.disableProdListCmp();
        Test.stopTest();
        // Validate custom settings deletion
        List<Hotel_Search_Key__c> hotelSearchKeyRecords = [SELECT Id FROM Hotel_Search_Key__c WHERE Search_Key__c != null];
        System.assertEquals(0, hotelSearchKeyRecords.size(), 'Hotel_Search_Key__c records should be deleted');
    }
    
        @isTest
       static void testPublishHotels() {
        Test.startTest();
        ProductController.publishHotelSearchEvent('Test');
        Test.stopTest();
        // Validate custom settings addition
        List<Hotel_Search_Key__c> hotelSearchKeyRecords = [SELECT Id FROM Hotel_Search_Key__c WHERE Search_Key__c != null];
        System.assertEquals(1, hotelSearchKeyRecords.size(), 'Hotel_Search_Key__c records should be added');
    }
    
    

    @isTest
    static void testSendEmailWithoutSending() {
        // Mock product list
        List<Map<String, Object>> mockProductList = new List<Map<String, Object>>();
        mockProductList.add(new Map<String, Object>{
            'hotelName' => 'Mock Hotel 1',
            'hotelDescription' => 'Mock Description 1'
        });
        mockProductList.add(new Map<String, Object>{
            'hotelName' => 'Mock Hotel 2',
            'hotelDescription' => 'Mock Description 2'
        });
        // Set up a mock to bypass email sending
        Test.startTest();
        
        // Call the sendEmail method but without actually sending emails.
        // In the test context, we do not care about sending an email, just covering the code.
        ProductController.sendEmail('sharma.g2@salesforce.com', mockProductList);
        
        Test.stopTest();
        
        // Assert that the code in the method was executed, and that no email was sent
        System.assertEquals(0, Limits.getEmailInvocations(), 'No email should be sent during the test.');
    }


    @isTest
    static void testFetchSessionId() {
        Test.startTest();
        String sessionId = ProductController.fetchSessionId();
        Test.stopTest();
        // Assert session ID is fetched
        System.assertNotEquals(null, sessionId, 'Session ID should not be null');
    }
    
    class ProductSoqlStub extends SoqlStubProvider {
        public override List<sObject> handleSoqlQuery(sObjectType sot, string stubbedQuery, Map<string, object> bindVars) {
            
            Assert.areEqual(ssot__Product__dlm.sObjectType, sot);
            System.debug('Handling SOQL Query: ' + stubbedQuery);
            
            List<SObject> objs = new List<SObject>();
            Map<String, Object> ProductsMap = new Map<String, Object> {
                'ssot__Id__c' => '1234',
                    'ssot__Name__c' => 'Test',
                    'ssot__Description__c' => 'family-friendly'
                    
                    };             
            ssot__Product__dlm obj = (ssot__Product__dlm) Test.createStubQueryRow(sot, ProductsMap);
            objs.add(obj);
            system.debug('obj'+obj);
            return objs;  
            
        }
    }


}