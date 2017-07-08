<html>
<h>
This template is Step1 of 3 templates to build and Automate Secure Production like deployment on Azure Cloud and utilize best practice for creating IaaS V2 Infrastructure on Azure.
</h>
It creates a VNet with 3 Subnets:  Web, App and DB subnet. 

It also creates three Network Security groups one per each subnet.

It creates DMZ rules for the Web Subnet to expose endpoints to the Internet. 

It secures the App Subnet and the DB subnet with appropriate rules. 

It blocks Outbound Internet access to VMs in App and DB Subnets. 

It opens up DB Subnet only on the mysql DB port to App Subnet.


## Below are Steps for End-to-End Deployment using  Azure CLI 2.0, this template uses latest Managed Disk, Managed AS, LB and Custom Scripts Extentions

Step1) 

    Option 1) az login   # This is manual way to login to Azure with CLI
    
    or 
    
    Option 2) Create Service Principal Id to login with Azure CLI 2.0 https://docs.microsoft.com/en-us/cli/azure/ad/sp  
    
    # This more automated may to login to Azure with CLI

      a) az ad sp create-for-rbac -n "http://azclidemo" --role contributor --scopes /subscriptions/<subscription id>

            You will see output as below:

            {
                    "appId": "xyxxxxzzxxxxxxxxxxx",
                    "displayName": "azure-cli-2017-07-08-23-08-36",
                    "name": "http://azclidemo",
                    "password": "xxxxxxxxxxxxxxxxx",
                    "tenant": "xxxxxxxxxxxx"
                }

    b) az ad sp show --id xyxxxxzzxxxxxxxxxxx

    c) az login --service-principal -u <appID> --password <password>  --tenant <tenant>
    
    d) subscriptionId = <subscription id>

Step2) az account set --subscription $subscriptionId

Step3) Create a Resource Group

az group create --name demo1 --location westus

Step 4) Deploy Network resources 

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step1-network/azuredeploy-netparameters2.json

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step1-network/azuredeploy.json --parameters @azuredeploy-netparameters2.json

Step 5) Deploy VM resources 

Deplopy VM's with Managed Disks

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy-md-parameters.json

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy-md.json --parameters @azuredeploy-md-parameters.json

Step4) Deploy LB 

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step3-lb/azuredeploy-lbparameters2.json

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step3-lb/azuredeploylb.json

Step 6) Validate output in Azure Portal for Resources

# Deploy Using a GUI

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsrakesh28%2Fdemo-working%2Fmaster%2Fstep1-network%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>

</a>

# Below are Steps for End-to-End Deployment using  Azure CLI 1.0  Instructions:

azure login

Username: "your org login"

Pass : "your org pass"

azure account list

azure account set "Your Account Name"

azure config mode arm

Step1) azure group create <resource group name> <resource group location> westus
ex : azure group create demo1 westus

Step2) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step1-network/azuredeploy.json demo1 (This Template)

Step3) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy.json  demo1

Step4) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step3-lb/azuredeploy.json demo1




</html>
