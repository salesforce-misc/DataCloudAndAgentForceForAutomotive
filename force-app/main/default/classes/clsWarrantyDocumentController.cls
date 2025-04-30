public class clsWarrantyDocumentController {
    
    @InvocableMethod(label='getWarrantyContract' description='getWarrantyContractInfo')
    public static List<WarrantyInfo> getWarrantyInformation(List<VinParam> requests) {
        
        List<WarrantyInfo> warrantyInf = new List<WarrantyInfo>();
        
        // Create inputs
        System.debug('requests[0].VIN'+requests[0].VIN);
        
        ConnectApi.WrappedValue experienceSessionValue = new ConnectApi.WrappedValue();
        experienceSessionValue.value = requests[0].VIN;
        Map<String, ConnectApi.WrappedValue> inputParams = new Map<String, ConnectApi.WrappedValue>();
        inputParams.put('Input:VIN', experienceSessionValue);
        
        // Configure invocation parameters
        ConnectApi.EinsteinPromptTemplateGenerationsInput executeTemplateInput = new ConnectApi.EinsteinPromptTemplateGenerationsInput();
        executeTemplateInput.additionalConfig = new ConnectApi.EinsteinLlmAdditionalConfigInput();
        executeTemplateInput.additionalConfig.applicationName = 'PromptBuilderPreview';
        executeTemplateInput.isPreview = false;
        executeTemplateInput.inputParams = inputParams;
        
        try {
            // Call the service
            ConnectApi.EinsteinPromptTemplateGenerationsRepresentation generationsOutput = ConnectApi.EinsteinLLM.generateMessagesForPromptTemplate(
                'Return_Warranty_Info',
                executeTemplateInput
            );
            ConnectApi.EinsteinLLMGenerationItemOutput response = generationsOutput.generations[0];
            System.debug(response.text);
            Map<String, Object> m =   (Map<String, Object>)JSON.deserializeUntyped(response.text);
            if(m.get('Number of Miles') !='' || m.get('End Date') !='' || m.get('Start Date')!='' || m.get('Warranty Offers') !='' || m.get('Warranty Duration') !=''  ){ 
              
                warrantyInf.add(new WarrantyInfo(Integer.valueOf(m.get('Number of Miles')), String.valueOf(m.get('End Date')),String.valueOf(m.get('Start Date')),String.valueOf(m.get('Warranty Offers')),String.valueOf(m.get('Warranty Duration'))));
            }
        } catch (Exception e) {
            System.debug(e.getMessage());
            throw e;
        }
        return warrantyInf;
    }
    // Inner class to define input parameters
    public class VinParam {
        @InvocableVariable(required=true description='vehcile Identification Number')
        public String VIN;
        
        
    }
    // Inner class to define output data
    public class WarrantyInfo {
        @InvocableVariable(description='Distance between the two locations in kilometers')
        public Integer NoOfMiles;
        
        @InvocableVariable(description='Estimated travel time in minutes')
        public String EndDate;
        
        @InvocableVariable(description='Estimated travel time in minutes')
        public String startDate;
        
        @InvocableVariable(description='Estimated travel time in minutes')
        public String WarrantyOffers;
        
        @InvocableVariable(description='Estimated travel time in minutes')
        public String WarrantyDuration;
        
        // Constructor
        public WarrantyInfo(Integer NoOfMiles, String EndDate,String startDate,String WarrantyOffers,String WarrantyDuration) {
            this.NoOfMiles = NoOfMiles;
            this.EndDate = EndDate;
            this.startDate = startDate;
            this.WarrantyOffers = WarrantyOffers;
            this.WarrantyDuration = WarrantyDuration;
        }
        
    }
    
    
}