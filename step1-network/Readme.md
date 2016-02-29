<html>
<h>
This template is Step2 of 3 templates to build and Automate Secure Production like deployment on Azure Cloud and utilize best practice for creating IaaS V2 Infrastructure on Azure.
</h>
It creates a VNet with 1 Subnets:  Web subnet. 
It also creates Network Security groups for a subnet.
It creates DMZ rules for the Web Subnet to expose endpoints to the Internet. 


This Template builds up-on Next Template as Step2 for building your Infrastructure on Azure

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsrakesh28%2Fdemo-working%2Fsingle-vnet-vms-arm-templates%2Fstep1-network%2Fazuredeploy.json" target="_blank">
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

Step2) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/single-vnet-vms-arm-templates/step1-network/azuredeploy.json demo1 (This Template)

Step3) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/single-vnet-vms-arm-templates/step2-linuxvm/azuredeploy.json  demo1




</html>
