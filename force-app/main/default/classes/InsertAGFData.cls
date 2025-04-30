public class InsertAGFData {
    public void insertChargingStationAccounts() {
        // Create a list to store the accounts
        List<Account> accountsToInsert = new List<Account>();

        // Create Account records
        accountsToInsert.add(new Account(
            Name = 'Semaconnect Charging Station',
            Industry = 'Energy',
            BillingCity='San Francisco',
            BillingCountry='United States',
            BillingPostalCode='94111',
            BillingState='CA',
            BillingStreet='201 California St suite 640',
            BillingLatitude=37.7930344,
            BillingLongitude=-122.4035358
            
            
        ));
        accountsToInsert.add(new Account(
            Name = 'Electrify America Charging Station',
            Industry = 'Energy',
             BillingCity='San Francisco',
            BillingCountry='United States',
            BillingPostalCode='94107',
            BillingState='CA',
            BillingStreet='928 Harrison St',
            BillingLatitude=37.778576,
            BillingLongitude=-122.4206945
            
        ));
        accountsToInsert.add(new Account(
            Name = 'EVgo Charging Station',
            Industry = 'Energy',
             BillingCity='San Francisco',
            BillingCountry='United States',
            BillingPostalCode='94111',
            BillingState='CA',
            BillingStreet='350 Pacific Ave',
            BillingLatitude=37.7977604,
            BillingLongitude=-122.4107328
            
        ));

        // Insert the accounts
        try {
            insert accountsToInsert;
            System.debug('Accounts successfully inserted.');
        } catch (DmlException e) {
            System.debug('Error occurred while inserting accounts: ' + e.getMessage());
        }
    }
    public void insertServiceLocationAccounts() {
        // Create a list to store the accounts
        List<Account> accountsToInsert = new List<Account>();

        // Create Account records
        accountsToInsert.add(new Account(
            Name = 'Cole Fox Hardware',
            Industry = 'Machinery',
            BillingCity='San Francisco',
            BillingCountry='United States',
            BillingPostalCode='94103',
            BillingState='CA',
            BillingStreet='Cole Hardware, 70 4th St',
            BillingLatitude=37.7847373,
            BillingLongitude=-122.4352064
            
            
        ));
        accountsToInsert.add(new Account(
            Name = 'Parts Warehouse Distribution',
            Industry = 'Machinery',
            BillingCity='South San Francisco',
            BillingCountry='United States',
            BillingPostalCode='94080',
            BillingState='CA',
            BillingStreet='449 Littlefield Ave',
            BillingLatitude=37.6506974,
            BillingLongitude=-122.4306537
            
        ));
        accountsToInsert.add(new Account(
            Name = 'City Auto Supply',
            Industry = 'Machinery',
             BillingCity='South San Francisco',
            BillingCountry='United States',
            BillingPostalCode='94080',
            BillingState='CA',
            BillingStreet='449 Littlefield Ave',
            BillingLatitude=37.6506974,
            BillingLongitude=-122.4306537
            
        ));

        // Insert the accounts
        try {
            insert accountsToInsert;
            System.debug('Accounts successfully inserted.');
        } catch (DmlException e) {
            System.debug('Error occurred while inserting accounts: ' + e.getMessage());
        }
    }

}