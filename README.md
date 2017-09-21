# Azure Arm Templates IaaSv2 - Vnet's to VM's
<html>

This Azure Arm Template walks you through 3 Simple Steps to Deploy End-to-End Azure Environment on Latest IaaS V2 from Virtual Network & Virtual Machines to Load Balancer.
Start from Step1 to Step3 and you will end up with design as shown below, in a fully automated fashion and provides best practice around deploying your IaaS v2 Infrastructure on Azure.
![ScreenShot](https://github.com/srakesh28/azure-iaasv2-arm/blob/master/IaaSv2.jpg)


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

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step1-network/azuredeploy-netparameters2.json --no-check-certificate

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step1-network/azuredeploy.json --parameters @azuredeploy-netparameters2.json

Step 5) Deploy VM resources 

Deplopy VM's with Managed Disks

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy-md-parameters.json --no-check-certificate

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy-md.json --parameters @azuredeploy-md-parameters.json

Step4) Deploy LB 

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step3-lb/azuredeploy-lbparameters2.json --no-check-certificate

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step3-lb/azuredeploylb.json

Step 6) Validate output in Azure Portal for Resources

</html>

