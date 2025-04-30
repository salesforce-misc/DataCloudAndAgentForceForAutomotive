public class ClsGetProductPrice {
     @InvocableMethod(label='Get Product Prices' description='get Product Prices from pricebook')
    public static List<Response> getProductPrice(List<Request> requests){ 
         Request input = requests[0];
        String prodName = input.productName;

        List<Response> productPriceInfoList = new List<Response>();
        Set<Id> pdIds= new Set<Id>();
		// Step 1: Fetch Products
        Product2 products = [SELECT Id, Name,IsActive,Seat_Capacity__c from product2 where IsActive=true and Seat_Capacity__c!=null and Name=:prodName limit 1 ];
      /**  for(Product2 pd:products){
            pdIds.add(pd.Id);
        }**/

        // Step 2: Fetch 1 Pricebook (assuming you want the Standard Pricebook)
        Pricebook2 pricebook = [SELECT Id,Name,IsActive FROM Pricebook2 WHERE Name = :PriceBook__mdt.getInstance('PriceBook_Name').Name__c and IsActive=true LIMIT 1];

        // Step 3: Fetch PricebookEntries related to the products and pricebook
        PricebookEntry pricebookEntries = [SELECT Product2Id, UnitPrice FROM PricebookEntry 
                                                 WHERE Product2Id = :products.Id AND Pricebook2Id = :pricebook.Id LIMIT 1];
        /**
        // Step 4: Create a map to store the product name and price
        Map<Id, Decimal> productPricesMap = new Map<Id, Decimal>();
        
        // Step 5: Populate the map with the product Id and their corresponding prices
        for (PricebookEntry entry : pricebookEntries) {
            productPricesMap.put(entry.Product2Id, entry.UnitPrice);
        }
        
        // Step 6: Create the result map for product names and prices
        Map<String, Decimal> productPriceMap = new Map<String, Decimal>();
        
        // Step 7: Add the product name and price to the final map
        for (Product2 product : products) {
            if (productPricesMap.containsKey(product.Id)) {
                //productPriceMap.put(product.Name, productPricesMap.get(product.Id));
                 productPriceInfoList.add(new Response(product.Name, productPricesMap.get(product.Id)));
            }
        }**/
        productPriceInfoList.add(new Response(products.Name, (Decimal)pricebookEntries.UnitPrice));
        
     
        return productPriceInfoList;
        
       // return weekendDates;
    }
    
     public class Request {
        @InvocableVariable(required=true)
        public String productName;
    }
    
   
    
     public class Response {
        @InvocableVariable
        public String ProductName;
         
        @InvocableVariable
        public Decimal Prices;
         
         // Constructor
        public Response(String name, Decimal price) {
            this.ProductName = name;
            this.Prices = price;
        }
    }

}