<html>
<h>
This template to build and Automate Secure Production like deployment on Azure Cloud and utilize best practice for creating IaaS V2 Infrastructure on Azure.
</h>
It creates a n of Ubuntu Linux VM's per in each one subnet Web
It also creates  Availability Sets for VM pairs in respective subnets for HA
It provides deploys Linux extensions as part of the deployment and Attaches Public IP to each vm
It's Allow port 22 and 80
It will install LAMP Stack on each VM via CustomScriptExtention



<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsrakesh28%2Fdemo-working%2Fsingle-vnet-vms-arm-templates%2Fazure-single-vnet-vms%2Fazuredeploy-vnet-vms-pip-extention.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

Below are Steps for End-to-End Deployment using  Azure CLI Instructions:

azure config arm

azure login

Username: "your org login"

Pass : "your org pass"

azure account list

azure account set "Your Account Name"


azure group create "resourcergoupname" "<location>" --template-uri  https://raw.githubusercontent.com/srakesh28/azure-iaasv2-arm/single-vnet-vms-arm-templates/step2-linuxvm/azuredeploy-vnet-vms-pip-extention.json -d "deploymentname"


</html>
