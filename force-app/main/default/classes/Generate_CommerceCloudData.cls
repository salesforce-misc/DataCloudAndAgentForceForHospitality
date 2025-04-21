public class Generate_CommerceCloudData {
    @InvocableMethod(label='Generate CommerceCloudData' description='Generate records for CommerceCloudData')
    public static void generateCommerceCloudData() {
        try {
            // Create a Store
            /*List<WebStore> WebStores = new List<WebStore>();
WebStore WS = new WebStore(Name ='Sunshine Resorts',	OptionsAutoFacetingEnabled = false,	OptionsCartAsyncProcessingEnabled = true, OptionsCartCalculateEnabled =true, OptionsCartToOrderAutoCustomFieldMapping = true, OptionsCommerceEinsteinActivitiesTracked = false,	OptionsCommerceEinsteinDeployed = false, OptionsDuplicateCartItemsEnabled = false,	OptionsGuestBrowsingEnabled = true,	OptionsGuestCartEnabled = true,	OptionsGuestCheckoutEnabled = true,	OptionsPreserveGuestCartEnabled= true,	OptionsSkipAdditionalEntitlementCheckForSearch= true, OptionsSkuDetectionEnabled = false, OptionsSplitShipmentEnabled = false, SupportedCurrencies = 'USD',	Type = 'B2C'); WebStores.add(WS);

insert WebStores;*/
            
            //Get web store 
            //WebStore WS1 = [SELECT Id,Name FROM WebStore WHERE Name='Sunshine Resorts' LIMIT 1];
            
            // Create a Catalog
            /* List<ProductCatalog> ProductCatalogs = new List<ProductCatalog>();

ProductCatalog PC1 = new ProductCatalog(Name = 'Sunshine Resorts Catalog'); ProductCatalogs.add(PC1);

Insert ProductCatalogs;*/
            //Get ProductCatalog
            
            ProductCatalog PC1 = [SELECT Id, Name FROM ProductCatalog WHERE Name ='Sunshine Resorts Catalog' LIMIT 1];
            
            // Create a Category
            /* List<ProductCategory> ProductCategories = new List<ProductCategory>();

ProductCategory Catagory1 = new ProductCategory(Name = 'Sunshine Resorts Catagory', CatalogId = PC1.Id); ProductCategories.add(Catagory1);

Insert ProductCategories;*/
            
            //Get Product Category
            ProductCategory Catagory1 =[SELECT Id, Name, Catalog.Name,CatalogId FROM ProductCategory Where CatalogId =:PC1.Id LIMIT 1];    
            
            // Create a WebStoreCatalog
            /*List<WebStoreCatalog> WebStoreCatalogs = new List<WebStoreCatalog>();

WebStoreCatalog WSC = new WebStoreCatalog(ProductCatalogId = PC1.Id, SalesStoreId = WS.Id); WebStoreCatalogs.add(WSC);

Insert WebStoreCatalogs;*/
            
            
            // Create a Price Book
            Pricebook2 standardPriceBook = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
            System.debug('Standard Price book'+ standardPriceBook);
            /*
Pricebook2 customPriceBook = new Pricebook2();
customPriceBook.Name = 'Sunshine Resorts PriceBook';
customPriceBook.IsActive = true;
Insert customPriceBook;
System.debug('customPriceBook'+ customPriceBook);*/
            Pricebook2 customPriceBook =[SELECT Id, Name FROM Pricebook2 WHERE Name ='Sunshine Resorts Price Book' LIMIT 1];
            // Create a Product
            List<Product2> products = new List<Product2>();
            
            Product2 product1 = new Product2();
            product1.Name = 'Paradise Sands Resort';
            product1.Family = 'Sunshine Resorts Family';
            product1.IsActive = true;
            product1.ProductCode = '0002';
            product1.Location__c = 'Maui, Hawaii';
            product1.StockKeepingUnit = '60100411';
            product1.Description = 'Escape to the serene beauty of Paradise Sands Resort, where the lush landscapes of Maui meet the turquoise waters of the Pacific. This luxurious beach front, family-friendly resort offers elegantly designed suites with private lanais, infinity pools, and multiple fine dining options. Perfect for romance or family adventure.';
            product1.Activities__c = 'Snorkeling, Whale-watching, Luaus, Paddleboarding, Spa Treatments, Sunset Yoga';
            product1.Amenities__c ='Wi-Fi, Private Beach, Infinity Pools, Restaurants, Fitness Center, Kids Club, Shuttle Service';
            product1.Pet_Policy__c = 'Pets welcome (max 2, up to 50 lbs), $100 fee, must be leashed in public areas.';
            product1.Cancellation_Policy__c = 'Free cancellation up to 72 hours before check-in; 1-night charge for late cancellations.';
            product1.Kids_Activities__c = 'drawing, painting, reading, playing board games, doing puzzles, riding bikes, playing soccer, crafting, gardening, watching movies';
            product1.TeenAge_Activity__c = 'wilderness camp, learn survival skills, outdoor adventures';
            
            products.add(product1);
            
            Product2 product2 = new Product2();
            product2.Name = 'Palm Oasis Resort';
            product2.Family = 'Sunshine Resorts Family';
            product2.IsActive = true;
            product2.ProductCode = '0002';
            product2.Location__c = 'Aruba';
            product2.StockKeepingUnit = '60100471';
            product2.Description = 'A vibrant resort offering beachfront cabanas, lively nightlife, and a variety of water sports. Palm Oasis Resort is a favorite among young travelers.';
            product2.Activities__c = 'Jet Skiing, Snorkeling, Nightly Entertainment, Beach Volleyball, Kayaking';
            product2.Amenities__c ='Beach Cabanas, Swimming Pools, Bars, Restaurants, Fitness Center, Spa';
            product2.Pet_Policy__c = 'Pets not allowed.';
            product2.Cancellation_Policy__c = 'Free cancellation up to 48 hours before check-in; 1-night charge for late cancellations.';
            product2.Kids_Activities__c = '';
            product2.TeenAge_Activity__c = '';
            
            products.add(product2);
            
            Product2 product3 = new Product2();
            
            product3.Name = 'Coral Bay Retreat';
            product3.Family = 'Sunshine Resorts Family';
            product3.IsActive = true;
            product3.ProductCode = '';
            product3.Location__c = 'Bahamas';
            product3.StockKeepingUnit = '60100451';
            product3.Description = 'Set on a secluded private island, Coral Bay Retreat offers luxurious villas, world-class snorkeling spots, and unmatched tranquility. Perfect for a quiet getaway.';
            product3.Activities__c = 'Snorkeling, Sailing, Paddleboarding, Nature Walks, Yoga, Spa Treatments';
            product3.Amenities__c ='Private Villas, Infinity Pool, Gourmet Restaurants, Private Beach, Spa, Fitness Center';
            product3.Pet_Policy__c = 'Pets not allowed.';
            product3.Cancellation_Policy__c = 'Free cancellation up to 5 days before check-in; full charge for late cancellations.';
            product3.Kids_Activities__c = '';
            product3.TeenAge_Activity__c = '';
            
            products.add(product3);
            
            Product2 product4 = new Product2();
            
            product4.Name = 'Lagoon Paradise Resort';
            product4.Family = 'Sunshine Resorts Family';
            product4.IsActive = true;
            product4.ProductCode = '';
            product4.Location__c = 'Maldives';
            product4.StockKeepingUnit = '60100541';
            product4.Description = 'Located on a private island, Lagoon Paradise Resort offers unmatched luxury with stunning overwater villas, personalized services, and serene surroundings.';
            product4.Activities__c = 'Snorkeling, Diving, Dolphin Watching, Kayaking, Sunset Yoga, Spa Treatments';
            product4.Amenities__c ='Overwater Villas, Infinity Pools, Beach Access, Fine Dining, Spa, Water Sports';
            product4.Pet_Policy__c = 'Pets not allowed.';
            product4.Cancellation_Policy__c = 'Free cancellation up to 7 days before check-in; 50% charge for late cancellations.';
            product4.Kids_Activities__c = '';
            product4.TeenAge_Activity__c = '';
            
            products.add(product4);
            
            Product2 product5 = new Product2();
            
            product5.Name = 'Emerald Bay Resort';
            product5.Family = 'Sunshine Resorts Family';
            product5.IsActive = true;
            product5.ProductCode = '0002';
            product5.Location__c = 'Dominican Republic';
            product5.StockKeepingUnit = '60100531';
            product5.Description = 'A family-friendly resort offering pristine beaches, exciting activities, and spacious accommodations for guests of all ages.';
            product5.Activities__c = 'Snorkeling, Paddleboarding, Kids Activities, Cultural Excursions, Nightly Shows';
            product5.Amenities__c ='Family Suites, Pools, Restaurants, Kids’ Club, Spa, Fitness Center';
            product5.Pet_Policy__c = 'Pets are allowed and must be leashed in public areas';
            product5.Cancellation_Policy__c = 'Free cancellation up to 5 days before check-in; 1-night charge for late cancellations.';
            product5.Kids_Activities__c = 'drawing, painting, reading, playing board games, doing puzzles, playing soccer, crafting';
            product5.TeenAge_Activity__c = 'wilderness camp, riding bike';
            
            products.add(product5);
            
            Product2 product6 = new Product2();
            
            product6.Name = 'Azure Cove Villas';
            product6.Family = 'Sunshine Resorts Family';
            product6.IsActive = true;
            product6.ProductCode = '0002';
            product6.Location__c = 'Seychelles';
            product6.StockKeepingUnit = '60100521';
            product6.Description = 'A beachfront family-friendly offering pristine beaches, exciting activities, and spacious accommodations for guests of all ages.';
            product6.Activities__c = 'Snorkeling, Diving, Kayaking, Spa Treatments, Sunset Yoga, Family Suites';
            product6.Amenities__c ='Private Villas, Infinity Pool, Beach Access, Gourmet Restaurants, Spa Services';
            product6.Pet_Policy__c = 'Pets not allowed.';
            product6.Cancellation_Policy__c = 'Free cancellation up to 10 days before check-in; 50% charge for late cancellations.';
            product6.Kids_Activities__c = 'drawing, painting, reading, playing board games, doing puzzles, playing soccer, crafting';
            product6.TeenAge_Activity__c = 'wilderness camp, learn survival skills';
            
            products.add(product6);
            
            Product2 product7 = new Product2();
            
            product7.Name = 'Golden Palms Retreat';
            product7.Family = 'Sunshine Resorts Family';
            product7.IsActive = true;
            product7.ProductCode = '';
            product7.Location__c = 'Key West, Florida';
            product7.StockKeepingUnit = '60100511';
            product7.Description = 'A charming resort featuring lush tropical gardens, vibrant nightlife, and proximity to Key West’s iconic attractions.';
            product7.Activities__c = 'Snorkeling, Jet Skiing, Sunset Cruises, Local Tours, Fishing';
            product7.Amenities__c ='Cabanas, Poolside Bar, Restaurants, Fitness Center, Spa, Concierge Services';
            product7.Pet_Policy__c = 'Pets not allowed.';
            product7.Cancellation_Policy__c = 'Free cancellation up to 72 hours before check-in; 1-night charge for late cancellations.';
            product7.Kids_Activities__c = '';
            product7.TeenAge_Activity__c = '';
            
            products.add(product7);
            
            Product2 product8 = new Product2();
            
            product8.Name = 'Sea Breeze Villas';
            product8.Family = 'Sunshine Resorts Family';
            product8.IsActive = true;
            product8.ProductCode = '0002';
            product8.Location__c = 'Turks and Caicos';
            product8.StockKeepingUnit = '60100501';
            product8.Description = 'Sea Breeze Villas features private beachfront accommodations with panoramic ocean views and direct beach access, ideal for exclusive getaways.';
            product8.Activities__c = 'Snorkeling, Sailing, Paddleboarding, Private Beach Dinners, Yoga';
            product8.Amenities__c ='Private Villas, Spa, Fine Dining, Beachfront Access, Fitness Center';
            product8.Pet_Policy__c = 'Pets not allowed.';
            product8.Cancellation_Policy__c = 'Free cancellation up to 14 days before check-in; 1-night charge for late cancellations.';
            product8.Kids_Activities__c = '';
            product8.TeenAge_Activity__c = '';
            
            products.add(product8);
            
            Insert products;
            
            // Create Standard Price Book Entry
            List<PricebookEntry> pricebookEntries = new List<PricebookEntry>();
            
            // List of unit prices for each product
            List<Decimal> unitPrices = new List<Decimal>{100, 100, 100, 100, 100, 100, 100, 100};
                
                // Loop through each product and create a corresponding PricebookEntry
                for (Integer i = 0; i < products.size(); i++) {
                    PricebookEntry pricebookEntry = new PricebookEntry(
                        Pricebook2Id = standardPriceBook.Id,
                        Product2Id = products[i].Id,
                        UnitPrice = unitPrices[i],
                        IsActive = true
                    );
                    pricebookEntries.add(pricebookEntry);
                }
            
            Insert pricebookEntries;
            
            List<PricebookEntry> customPricebookEntries = new List<PricebookEntry>();
            
            // Define the custom price for each product
            List<Decimal> customUnitPrices = new List<Decimal>{150, 160, 170, 180, 190, 200, 210, 220};
                
                // Loop through each product and create a corresponding custom PricebookEntry
                for (Integer i = 0; i < products.size(); i++) {
                    PricebookEntry customPricebookEntry = new PricebookEntry(
                        Pricebook2Id = customPriceBook.Id,
                        Product2Id = products[i].Id,
                        UnitPrice = customUnitPrices[i],
                        IsActive = true);
                    customPricebookEntries.add(customPricebookEntry);
                }
            
            Insert customPricebookEntries;
            
            List<ProductCategoryProduct> ProductCategoryProducts = new List<ProductCategoryProduct>();
            
            ProductCategoryProduct PCP1 = new ProductCategoryProduct(ProductId = products[0].ID, ProductCategoryId =Catagory1.Id); ProductCategoryProducts.add(PCP1);
            ProductCategoryProduct PCP2 = new ProductCategoryProduct(ProductId = products[1].ID, ProductCategoryId =Catagory1.Id); ProductCategoryProducts.add(PCP2);
            ProductCategoryProduct PCP3 = new ProductCategoryProduct(ProductId = products[2].ID, ProductCategoryId =Catagory1.Id); ProductCategoryProducts.add(PCP3);
            ProductCategoryProduct PCP4 = new ProductCategoryProduct(ProductId = products[3].ID, ProductCategoryId =Catagory1.Id); ProductCategoryProducts.add(PCP4);
            ProductCategoryProduct PCP5 = new ProductCategoryProduct(ProductId = products[4].ID, ProductCategoryId =Catagory1.Id); ProductCategoryProducts.add(PCP5);
            ProductCategoryProduct PCP6 = new ProductCategoryProduct(ProductId = products[5].ID, ProductCategoryId =Catagory1.Id); ProductCategoryProducts.add(PCP6);
            ProductCategoryProduct PCP7 = new ProductCategoryProduct(ProductId = products[6].ID, ProductCategoryId =Catagory1.Id); ProductCategoryProducts.add(PCP7);
            ProductCategoryProduct PCP8 = new ProductCategoryProduct(ProductId = products[7].ID, ProductCategoryId =Catagory1.Id); ProductCategoryProducts.add(PCP8);
            
            Insert ProductCategoryProducts;
            
            //Assign Entitlement policy
            List<CommerceEntitlementProduct> insertcommercePolicy = New List<CommerceEntitlementProduct>();
            CommerceEntitlementPolicy  cmrceentiltmntPolicy = [SELECT Id, Name FROM CommerceEntitlementPolicy WHERE Name ='All Access for Sunshine Resorts' LIMIT 1];
            for(Product2 p : products){
                CommerceEntitlementProduct cep = New CommerceEntitlementProduct();
                cep.PolicyId = cmrceentiltmntPolicy.Id;
                cep.ProductId = p.Id;
                insertcommercePolicy.add(cep);
            }
            if(!insertcommercePolicy.isempty()){
                insert insertcommercePolicy;
            }
            
        } catch(Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw e;
        }
    }
}