<html>
<h>
This template is Step2 of 3 templates to build and Automate Secure Production like deployment on Azure Cloud and utilize best practice for creating IaaS V2 Infrastructure on Azure.
</h>
It creates a 2 Ubuntu Linux VM's per in each subnet Web, App and DB.
It also creates  Availability Sets for VM pairs in respective subnets for HA
It provides option to deploy Chef Agent extensions as part of the deployment.


This Template builds up-on Next Template as Step3 for building your Infrastructure on Azure

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsrakesh28%2Fdemo-working%2Fmaster%2Fstep2-linuxvms%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

Below are Steps for End-to-End Deployment using  Azure CLI Instructions:

azure login
Username: <your org login>
Pass : <your org pass>
azure account list
azure account set "Your Account Name"

Create a Resource Group

Create a Resource Group

Step1) azure group create <Your Resource Group Name> <Your Locaion> westus

Step2) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/demo-working/master/step1-network/azuredeploy.json <Your Resource Group Name> <optional deployment name> 

Step3) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/demo-working/master/step2-linuxvms/azuredeploy.json <Your Resource Group Name> <optional deployment name>  ( This Template)

Step4) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/demo-working/master/step3-lb/azuredeploy.json <Your Resource Group Name> <optional deployment name>

</html>
