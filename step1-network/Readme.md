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

This Template builds up-on Next Template as Step2 for building your Infrastructure on Azure

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsrakesh28%2Fdemo-working%2Fmaster%2Fstep1-network%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>

</a>

Below are Steps for End-to-End Deployment using  Azure CLI Instructions:

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


## Azure CLI 2.0  Instructions 

subscriptionId = "<subscription id>"

Step1) az login

Step2) az account set --subscription $subscriptionId

Step3) Create a Resource Group

az group create --name demo1 --location westus

Step 4) Deploy Network resources 

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step1-network/azuredeploy-netparameters2.json

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step1-network/azuredeploy.json --parameters @azuredeploy-netparameters2.json

Step 5) Deploy VM resources 

Option1 - Deploy Regular VM's with Un-Managed Disks

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy-vmparameters2.json

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy.json --parameters @azuredeploy-vmparameters2.json

Option2 - Deplopy VM's with Managed Disks

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy-md-parameters.json

az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step2-linuxvm/azuredeploy-md.json --parameters @azuredeploy-md-parameters.json


Step4) Deploy LB 

wget https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step3-lb/azuredeploy-lbparameters2.json


az group deployment create -g demo1 --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/master/step3-lb/azuredeploylb.json



</html>
