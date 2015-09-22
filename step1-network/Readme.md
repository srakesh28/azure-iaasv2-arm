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

<a href="https://azuredeploy.net/?repository=https://raw.githubusercontent.com/srakesh28/demo-working/master/step1-network/azuredeploy-parameters.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

Below are Steps for End-to-End Deployment using  Azure CLI Instructions:

azure login
Username: <your org login>
Pass : <your org pass>
azure account list
azure account set "Your Account Name"

Create a Resource Group

Step1) azure group create <Your Resource Group Name> <Your Locaion> westus

Step2) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/demo-working/master/1-vnet-nsg-10-working.json <Your Resource Group Name> <optional deployment name> (This Template)

Step3) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/demo-working/master/2-vms-vnet-nsg-linux-working.json <Your Resource Group Name> <optional deployment name>  ( Link : )

Step4) azure group deployment create --template-uri https://raw.githubusercontent.com/srakesh28/demo-working/master/3-lb-public-ip.json <Your Resource Group Name> <optional deployment name>   (Link : )

</html>
