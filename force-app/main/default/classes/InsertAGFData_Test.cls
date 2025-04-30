@isTest
public class InsertAGFData_Test {

  
    
    @isTest
    static void testInsertChargingStationAccounts() {
        // Instantiate the class to test
        InsertAGFData agfData = new InsertAGFData();

        // Call the method to insert Charging Station Accounts
        Test.startTest();
        agfData.insertChargingStationAccounts();
        Test.stopTest();

        // Query inserted records to validate
        List<Account> chargingStationAccounts = [SELECT Name, Industry, BillingCity, BillingCountry, BillingPostalCode, BillingState, BillingStreet, BillingLatitude, BillingLongitude FROM Account WHERE Industry = 'Energy'];

        // Assert the records were inserted correctly
        System.assertEquals(3, chargingStationAccounts.size(), 'Expected 3 Charging Station accounts to be inserted.');

        // Further assertions to check data integrity
        System.assertEquals('Semaconnect Charging Station', chargingStationAccounts[0].Name);
        System.assertEquals('San Francisco', chargingStationAccounts[0].BillingCity);
        System.assertEquals(37.7930344, chargingStationAccounts[0].BillingLatitude);
        System.assertEquals(-122.4035358, chargingStationAccounts[0].BillingLongitude);
    }

    @isTest
    static void testInsertServiceLocationAccounts() {
        // Instantiate the class to test
        InsertAGFData agfData = new InsertAGFData();

        // Call the method to insert Service Location Accounts
        Test.startTest();
        agfData.insertServiceLocationAccounts();
        Test.stopTest();

        // Query inserted records to validate
        List<Account> serviceLocationAccounts = [SELECT Name, Industry, BillingCity, BillingCountry, BillingPostalCode, BillingState, BillingStreet, BillingLatitude, BillingLongitude FROM Account WHERE Industry = 'Machinery'];

        // Assert the records were inserted correctly
        System.assertEquals(3, serviceLocationAccounts.size(), 'Expected 3 Service Location accounts to be inserted.');

        // Further assertions to check data integrity
        System.assertEquals('Cole Fox Hardware', serviceLocationAccounts[0].Name);
        System.assertEquals('San Francisco', serviceLocationAccounts[0].BillingCity);
        System.assertEquals(37.7847373, serviceLocationAccounts[0].BillingLatitude);
        System.assertEquals(-122.4352064, serviceLocationAccounts[0].BillingLongitude);
    }
}